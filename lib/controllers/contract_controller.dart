import 'package:decimal/decimal.dart';
import 'package:flutter_web3/flutter_web3.dart';
import 'package:get/get.dart';
import 'package:nftapp/constants/addresses.dart';

import 'package:nftapp/helpers/abi.dart';
import 'package:nftapp/helpers/dateTimeFormat.dart';
import 'package:nftapp/helpers/decimal_handler.dart';

class ContractController extends GetxController {
  ContractController(this.currentWalletAddress);

  String currentWalletAddress;

  final vestingContract = Contract(VESTING_CONTRACT, Interface(abi), provider!.getSigner());

  bool hasVestingSchedule = false;
  Decimal currentAmountReleasable = Decimal.zero;

  String startTime = '';
  String endTime = '';
  String cliff = '';

  int endTimeDays = 0;
  int cliffEndDays = 0;

  bool vestedChecker = false;

  Decimal vestedTotal = Decimal.zero;

  int scheduleCount = 0;

  bool isContractFullyVested = false;

  bool isLoading = false;

  List<String> scheduleIDs = [];

  // BigInt withdrawableAmount = BigInt.zero;
  // bool revoked = true;
  // int scheduleCount = 0;

  void getScheduleByAddressAndIndex({required int id, required String beneficaryAddress}) async {
    isLoading = true;

    final schedule = await vestingContract.call('getVestingScheduleByAddressAndIndex', [beneficaryAddress, id]);

    hasVestingSchedule = true;

    final DateTime scheduleStart = readTimeStampToDate(
      int.parse(
        schedule[3].toString(),
      ),
    );

    final DateTime scheduleDuration = readTimeStampToDate(
      int.parse(
        schedule[4].toString(),
      ),
    );

    final DateTime scheduleEnd = DateTime.fromMillisecondsSinceEpoch(
        scheduleStart.millisecondsSinceEpoch + scheduleDuration.millisecondsSinceEpoch);

    final DateTime cliff = readTimeStampToDate(
      int.parse(
        schedule[2].toString(),
      ),
    );

    vestedTotal = toDecimal(BigInt.parse(schedule[7].toString()), 18);

    vestedChecker = vestedTotal == Decimal.zero ? false : true;

    endTimeDays = daysBetweenInt(DateTime.now(), scheduleEnd);
    cliffEndDays = daysBetweenInt(DateTime.now(), cliff);

    isContractFullyVested = DateTime.now().compareTo(scheduleEnd) > 0 ? true : false;

    update();
  }

  Future<List<String>> getUserVestingSchedulesList() async {
    BigInt scheduleCount = await getUserVestingCount(currentWalletAddress);
    List<String> schedules = [];

    for (int i = 0; i < scheduleCount.toInt(); i++) {
      final vestingScheduleId = await vestingContract
          .call('computeVestingScheduleIdForAddressAndIndex', [currentWalletAddress, BigInt.from(i)]);
      schedules.add(vestingScheduleId);
    }
    return schedules;
  }

  Future<BigInt> getUserVestingCount(String beneficiary) async {
    return vestingContract.call('getVestingSchedulesCountByBeneficiary', [beneficiary]);
  }

  Future<BigInt> computeAmountReleasable(String id) async {
    return await vestingContract.call<BigInt>('computeReleasableAmount', [id]);
  }

  void getSchedulesInfo() async {
    try {
      final List<String> scheduleIDs = await getUserVestingSchedulesList();

      computeAmountReleasable(scheduleIDs[0]).then(
        (value) {
          currentAmountReleasable = toDecimal(BigInt.one, 18);
          isLoading = false;
          update();
        },
      );

      //displayScheduleID = scheduleIDs[0].substring(0, 5) + "..." + scheduleIDs[0].substring(61, 66);
    } catch (error) {
      print(error);
    }
  }

  void release() async {
    final BigInt releaseable = await vestingContract.call<BigInt>('computeReleasableAmount', [scheduleIDs[0]]);
    await vestingContract.call<BigInt>('release', [scheduleIDs[0], releaseable]);
  }
}
