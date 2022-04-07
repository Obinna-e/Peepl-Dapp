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

  int amountReleasable = 0;

  BigInt withdrawableAmount = BigInt.zero;

  var displayBalance;
  var displayID;

  var startTime = '';
  var endTime = '';
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

    final tempStart = int.parse(schedule[2].toString());
    final tempDuration = int.parse(schedule[4].toString());

    endTime = readTimestamp(tempStart + tempDuration);

    


    update();
  }

  getUserVestingSchedulesList(int amountOfSchedules, String address) async {
    for (int i = 0; i < amountOfSchedules; i++) {
      final vestingScheduleId = await vestingContract.call(
          'computeVestingScheduleIdForAddressAndIndex',
          [address, BigInt.from(i)]);
      scheduleIDs.add(vestingScheduleId);
      scheduleIDdropdown.add(scheduleIDs.length.toString());
    }

    update();
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

  computeAmountReleasable(BigInt id) async {
    await getVestingContractInformation();

    amountReleasable =
        await tokenVesting!.call<int>('computeReleasableAmount', [id]);
  }
}
