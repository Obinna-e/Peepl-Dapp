import 'package:decimal/decimal.dart';
import 'package:flutter_web3/flutter_web3.dart';
import 'package:get/get.dart';
import 'package:nftapp/constants/addresses.dart';
import 'package:nftapp/controllers/home_controller.dart';

import 'package:nftapp/helpers/abi.dart';
import 'package:nftapp/helpers/dateTimeFormat.dart';
import 'package:nftapp/helpers/decimal_handler.dart';

class ContractController extends GetxController {
  HomeController homeController = Get.put(HomeController());

  String? currentWalletAddress;

  final vestingContract = Contract(VESTING_CONTRACT, Interface(abi), provider!.getSigner());

  bool hasVestingSchedule = false;
  Rx<Decimal> currentAmountReleasable = Decimal.zero.obs;

  late DateTime scheduleStart;

  String? displayScheduleID;
  Rx<DateTime> scheduleEnd = DateTime.now().obs;
  Rx<DateTime> cliff = DateTime.now().obs;

  RxInt endTimeDays = 0.obs;
  RxInt cliffEndDays = 0.obs;

  bool vestedChecker = false;

  Rx<Decimal> vestedTotal = Decimal.zero.obs;

  int scheduleCount = 0;

  bool isContractFullyVested = false;

  bool isLoading = false;

  List<String> scheduleIDs = [];

  RxString currentScheduleID = "".obs;

  // BigInt withdrawableAmount = BigInt.zero;
  // bool revoked = true;
  // int scheduleCount = 0;

  void getScheduleByAddressAndIndex({required int index, required String beneficaryAddress}) async {
    isLoading = true;

    final schedule = await vestingContract.call('getVestingScheduleByAddressAndIndex', [beneficaryAddress, index]);

    hasVestingSchedule = true;

    scheduleStart = readTimeStampToDate(
      int.parse(
        schedule[3].toString(),
      ),
    );

    final DateTime scheduleDuration = readTimeStampToDate(
      int.parse(
        schedule[4].toString(),
      ),
    );

    scheduleEnd(DateTime.fromMillisecondsSinceEpoch(
        scheduleStart.millisecondsSinceEpoch + scheduleDuration.millisecondsSinceEpoch));

    cliff(readTimeStampToDate(
      int.parse(
        schedule[2].toString(),
      ),
    ));

    vestedTotal(toDecimal(BigInt.parse(schedule[7].toString()), 18));

    vestedChecker = vestedTotal.value == Decimal.zero ? false : true;

    endTimeDays(daysBetweenInt(DateTime.now(), scheduleEnd.value));
    cliffEndDays(daysBetweenInt(DateTime.now(), cliff.value));

    isContractFullyVested = DateTime.now().compareTo(scheduleEnd.value) > 0 ? true : false;

    update();
  }

  Future<List<String>> getUserVestingSchedulesList() async {
    BigInt scheduleCount = await getUserVestingCount(homeController.currentAddress.value);

    List<String> schedules = [];

    for (int i = 0; i < scheduleCount.toInt(); i++) {
      final vestingScheduleId = await vestingContract
          .call('computeVestingScheduleIdForAddressAndIndex', [homeController.currentAddress.value, BigInt.from(i)]);
      schedules.add(vestingScheduleId);
    }

    return schedules;
  }

  Future<BigInt> getUserVestingCount(String beneficiary) async {
    return await vestingContract.call<BigInt>('getVestingSchedulesCountByBeneficiary', [beneficiary]);
  }

  Future<BigInt> computeAmountReleasable(String id) async {
    return await vestingContract.call<BigInt>('computeReleasableAmount', [id]);
  }

  Future<bool> getSchedulesInfo() async {
    try {
      final List<String> scheduleIDs = await getUserVestingSchedulesList();

      displayScheduleID = scheduleIDs[0].substring(0, 5) + "..." + scheduleIDs[0].substring(61, 66);

      currentAmountReleasable(toDecimal(await computeAmountReleasable(scheduleIDs[0]), 18));
      isLoading = false;
      currentScheduleID(scheduleIDs[0].substring(0, 5) + "..." + scheduleIDs[0].substring(61, 66));

      update();
      return Future.value(true);
    } catch (error) {
      return Future.value(false);
    }
  }

  void release() async {
    final BigInt releaseable = await vestingContract.call<BigInt>('computeReleasableAmount', [scheduleIDs[0]]);
    await vestingContract.call<BigInt>('release', [scheduleIDs[0], releaseable]);
  }
}
