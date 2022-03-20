import 'package:flutter_web3/flutter_web3.dart';
import 'package:get/get.dart';
import 'dart:js';

import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';






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
   
    "function createVestingSchedule(address _beneficiary, uint256 _start, uint256 _cliff, uint256 _duration, uint256 _slicePeriodSeconds, bool _revocable, uint256 _amount)", 
    "constructor(address token_)",
    "event OwnershipTransferred(address indexed previousOwner, address indexed newOwner)",
    "function release(bytes32 vestingScheduleId, uint256 amount)",
    "event Released(uint256 amount)",
    "function renounceOwnership()",
    "function revoke(bytes32 vestingScheduleId)", 
    "event Revoked()",
    "function transferOwnership(address newOwner)",
    "function withdraw(uint256 amount)",
    "function computeNextVestingScheduleIdForHolder(address holder) view returns (bytes32)",
    "function computeReleasableAmount(bytes32 vestingScheduleId) view returns (uint256)",
    "function computeVestingScheduleIdForAddressAndIndex(address holder, uint256 index) pure returns (bytes32)",
    "function getLastVestingScheduleForHolder(address holder) view returns (tuple(bool initialized, address beneficiary, uint256 cliff, uint256 start, uint256 duration, uint256 slicePeriodSeconds, bool revocable, uint256 amountTotal, uint256 released, bool revoked))",
    "function getToken() view returns (address)", "function getVestingIdAtIndex(uint256 index) view returns (bytes32)",
    "function getVestingSchedule(bytes32 vestingScheduleId) view returns (tuple(bool initialized, address beneficiary, uint256 cliff, uint256 start, uint256 duration, uint256 slicePeriodSeconds, bool revocable, uint256 amountTotal, uint256 released, bool revoked))",
    "function getVestingScheduleByAddressAndIndex(address holder, uint256 index) view returns (tuple(bool initialized, address beneficiary, uint256 cliff, uint256 start, uint256 duration, uint256 slicePeriodSeconds, bool revocable, uint256 amountTotal, uint256 released, bool revoked))", 
    "function getVestingSchedulesCount() view returns (uint256)",
    "function getVestingSchedulesCountByBeneficiary(address _beneficiary) view returns (uint256)", 
    "function getVestingSchedulesTotalAmount() view returns (uint256)",
    "function getWithdrawableAmount() view returns (uint256)",
    "function owner() view returns (address)"


  ];

  final contractAddress = '0x4f95788Bc7Ba96337CEf7dbdCC1216Fa672E0051';

  static const TOKENVESTING_ADDRESS =
      '0x4f95788Bc7Ba96337CEf7dbdCC1216Fa672E0051';

  

  static const FEQUITY_ADDRESS = '0xaDA5216B415a38C3Fa8daD6e7fDE5b772605d716';

  ContractERC20? testToken;

  BigInt yourTokenBalance = BigInt.zero;

  

 

  getTokenBalance() async {
    if (testToken == null) {
      testToken = ContractERC20(FEQUITY_ADDRESS, provider!.getSigner());
    }
    yourTokenBalance = await testToken!.balanceOf(currentAddress);
    update();
  }

  

  Contract? tokenVesting;

  BigInt vestingId = BigInt.zero;

  int amountReleasable = 0;

  BigInt withdrawableAmount = BigInt.zero;

  getVestingContractInformation() async {
    final vestContract = Contract(contractAddress, abi, provider!);

    

    withdrawableAmount = await vestContract.call<BigInt>('getWithdrawableAmount');


    
    
    update();
  }

  computeAmountReleasable(BigInt id) async {
    await getVestingContractInformation();

    amountReleasable =
        await tokenVesting!.call<int>('computeReleasableAmount', [id]);
  }



  
  
  




}