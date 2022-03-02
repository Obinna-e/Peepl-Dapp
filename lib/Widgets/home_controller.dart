import 'package:flutter_web3/flutter_web3.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  bool get isEnabled => ethereum != null;

  bool get isInOperatingChain => currentChain == OPERATING_CHAIN;

  bool get isConnected => isEnabled && currentAddress.isNotEmpty;

  String currentAddress = '';
  int currentChain = -1;
  static const OPERATING_CHAIN = 97;

  connect() async {
    if (isEnabled) {
      final accs = await ethereum!.requestAccount();
      if (accs.isNotEmpty) currentAddress = accs.first;

      currentChain = await ethereum!.getChainId();

      update();
    }
  }

  clear() {
    currentAddress = '';
    currentChain = -1;
    update();
  }

  init() {
    if (isEnabled) {
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

  final abi = [
    'function release(bytes32 vestingScheduleId,uint256 amount) public nonReentrant onlyIfVestingScheduleNotRevoked(vestingScheduleId)',
    'function computeVestingScheduleIdForAddressAndIndex(address holder, uint256 index) public pure returns (bytes32)',
    'function computeReleasableAmount(bytes32 vestingScheduleId) public onlyIfVestingScheduleNotRevoked(vestingScheduleId) view returns (uint256)',
    'function getWithdrawableAmount() public view returns(uint256)',
  ];

  static const TOKENVESTING_ADDRESS =
      '0xB80884f579D862e73cA0BdD6aFEE0D5FeBDF39c7';

  Contract? tokenVesting;

  BigInt vestingId = BigInt.zero;

  int amountReleasable = 0;

  int withdrawableAmount = 0;

  getVestingContractInformation() async {
    tokenVesting ??= Contract(TOKENVESTING_ADDRESS, abi, provider!.getSigner());

    vestingId = await tokenVesting!.call<BigInt>(
        'computeVestingScheduleIdForAddressAndIndex', [currentAddress, 0]);

    withdrawableAmount = await tokenVesting!.call<int>('getWithdrawableAmount');

    update();
  }

  computeAmountReleasable(BigInt id) async {
    await getVestingContractInformation();

    amountReleasable =
        await tokenVesting!.call<int>('computeReleasableAmount', [id]);
  }
}
