import 'package:flutter_web3/flutter_web3.dart';
import 'package:get/get.dart';

import 'contract_controller.dart';

class HomeController extends GetxController {
  static HomeController instance = Get.find();

  bool get isEnabled => ethereum != null; //isEnabled means if metamask is enabled

  bool get isInOperatingChain =>
      currentChain == OPERATING_CHAIN; //if the operating chain is the same as the chain of the current wallet

  bool get isConnected => isEnabled && currentAddress != null; //if enabled plus current address is not null.

  final walletConnect = false.obs;

  String? currentAddress;
  String displayAddress = '';

  RxBool isLoading = false.obs;

  int currentChain = -1;
  static const OPERATING_CHAIN = 97;

  Future<bool> connect() async {
    if (isEnabled) {
      isLoading(true);
      final accs = await ethereum!.requestAccount();
      if (accs.isNotEmpty) currentAddress = accs.first;
      Get.put(ContractController(currentAddress!), tag: "contractController");
      if (accs.isNotEmpty) {
        displayAddress = accs.first.substring(0, 5) + "..." + accs.first.substring(37, 41);
      }
      currentChain = await ethereum!.getChainId();

      walletConnect(true);
      update();
    }
    return Future.value(true);
  }

  void clear() {
    currentAddress = '';
    displayAddress = '';
    currentChain = -1;
    update();
  }

  @override
  void onInit() {
    if (isEnabled) {
      ethereum!.onAccountsChanged((accs) {
        clear();
      });

      ethereum!.onChainChanged((chain) {
        clear();
      });
    }
    super.onInit();
  }
}
