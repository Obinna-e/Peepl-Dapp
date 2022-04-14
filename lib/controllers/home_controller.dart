import 'package:flutter_web3/flutter_web3.dart';
import 'package:get/get.dart';
import 'package:nftapp/helpers/abi.dart';
import 'package:nftapp/helpers/dateTimeFormat.dart';
import 'package:nftapp/utils.dart';

class HomeController extends GetxController {
  bool get isEnabled => ethereum != null;

  bool get isInOperatingChain => currentChain == OPERATING_CHAIN;

  bool get isConnected => isEnabled && currentAddress.isNotEmpty;

  String currentAddress = '';
  String displayAddress = '';
  String displayScheduleID = '';
  int currentChain = -1;
  static const OPERATING_CHAIN = 97;

  connect() async {
    if (isEnabled) {
      final accs = await ethereum!.requestAccount();
      if (accs.isNotEmpty) currentAddress = accs.first;
      if (accs.isNotEmpty) {
        displayAddress =
            accs.first.substring(0, 5) + "..." + accs.first.substring(37, 41);
      }

      currentChain = await ethereum!.getChainId();

      update();
    }
  }

  clear() {
    currentAddress = '';
    displayAddress = '';
    currentChain = -1;
    update();
  }

  init() {
    if (isEnabled) {
      getVestingContractInformation();

      ethereum!.onAccountsChanged((accs) {
        clear();
      });

      ethereum!.onChainChanged((chain) {
        clear();
      });
    }
  }

  @override
  void onInit() {
    init();
    super.onInit();
  }

  final vestingContract =
      Contract('0x4f95788Bc7Ba96337CEf7dbdCC1216Fa672E0051', abi, provider!);

  final contractAddress = '0x4f95788Bc7Ba96337CEf7dbdCC1216Fa672E0051';

  static const TOKENVESTING_ADDRESS =
      '0x4f95788Bc7Ba96337CEf7dbdCC1216Fa672E0051';

  static const FEQUITY_ADDRESS = '0xaDA5216B415a38C3Fa8daD6e7fDE5b772605d716';

  ContractERC20? testToken;

  BigInt yourTokenBalance = BigInt.zero;

  int scheduleCount = 0;

  Contract? tokenVesting;

  var amountReleasable;

  BigInt withdrawableAmount = BigInt.zero;

  var displayBalance;

  var displayID;

  String startTime = '';
  String endTime = '';
  String endTimeDays = '';
  String cliff = '';
  String cliffEndDays = '';
  var vestedTotal;
  bool revoked = true;

  List<String> scheduleIDs = [];
  List<String> scheduleIDdropdown = [];

  //Contract Methods

  getVestingSchedulesCountByBeneficiary() async {
    final BigInt response = await vestingContract.call<BigInt>(
        'getVestingSchedulesCountByBeneficiary', [currentAddress]);

    scheduleCount = response.toInt();
    update();
  }

  //TODO: Move to a separate file e.g contract controller
  getScheduleByAddressAndIndex(int id, String beneficiary) async {
    final schedule = await vestingContract
        .call('getVestingScheduleByAddressAndIndex', [beneficiary, id]);

    startTime = readTimestamp(
      int.parse(
        schedule[3].toString(),
      ),
    );

    cliff = readTimestamp(int.parse(schedule[2].toString()));

    final total = int.parse(schedule[7].toString());

    vestedTotal = toDecimal(BigInt.parse(schedule[7].toString()), 18);
    final tempStart = int.parse(schedule[3].toString());
    final tempDuration = int.parse(schedule[4].toString());

//TODO: Add error for no vesting schedule

    endTime = readTimestamp(tempStart + tempDuration);

    DateTime tempEnd =
        DateTime.fromMillisecondsSinceEpoch((tempStart + tempDuration) * 1000);
    DateTime tempStartTime = DateTime.fromMillisecondsSinceEpoch(
        int.parse(schedule[3].toString()) * 1000);

    DateTime tempCliff = DateTime.fromMillisecondsSinceEpoch(
        int.parse(schedule[2].toString()) * 1000);
    endTimeDays = daysBetween(DateTime.now(), tempEnd);
    cliffEndDays = daysBetween(DateTime.now(), tempCliff);

    update();
  }

  Future<List<String>> getUserVestingSchedulesList(
      int amountOfSchedules, String address) async {
    List<String> schedules = [];
    for (int i = 0; i < amountOfSchedules; i++) {
      final vestingScheduleId = await vestingContract.call(
          'computeVestingScheduleIdForAddressAndIndex',
          [address, BigInt.from(i)]);
      schedules.add(vestingScheduleId);

      //To add schedule dropdown list
      // scheduleIDdropdown.add(scheduleIDs.length.toString());
    }
    return schedules;

    // update();
  }

  getTokenBalance() async {
    testToken ??= ContractERC20(FEQUITY_ADDRESS, provider!.getSigner());
    yourTokenBalance = await testToken!.balanceOf(currentAddress);

    displayBalance = toDecimal(yourTokenBalance, 18);

    update();
  }

  getVestingContractInformation() async {
    withdrawableAmount =
        await vestingContract.call<BigInt>('getWithdrawableAmount');

    update();
  }

  computeAmountReleasable(String id) async {
    final BigInt releaseable =
        await vestingContract.call<BigInt>('computeReleasableAmount', [id]);

    amountReleasable = toDecimal(releaseable, 18);
  }

  getSchedulesInfo() async {
    final List<String> lists =
        await getUserVestingSchedulesList(1, currentAddress);

    scheduleIDs = List.from(lists);
    displayScheduleID = scheduleIDs[0].substring(0, 5) +
        "..." +
        scheduleIDs[0].substring(61, 66);

    computeAmountReleasable(scheduleIDs[0]);

    update();
    // await computeAmountReleasable(BigInt.parse(scheduleIDs[0]));
  }

  release(BigInt schedule) async {
    await vestingContract.call<BigInt>('Released', [
      schedule,
    ]);
  }
}
