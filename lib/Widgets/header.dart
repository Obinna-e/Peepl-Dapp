import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nftapp/Widgets/customText.dart';
import 'package:nftapp/constants/style.dart';
import 'package:nftapp/controllers/contract_controller.dart';
import 'package:nftapp/controllers/home_controller.dart';
import 'package:nftapp/helpers/responsiveness.dart';

class Header extends StatefulWidget {
  const Header({Key? key}) : super(key: key);

  @override
  State<Header> createState() => _HeaderState();
}

class _HeaderState extends State<Header> {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.asset(
          'assets/images/logo-red.png',
          width: 150,
          height: 150,
        ),
        SizedBox(
          width: !ResponsiveWidget.isSmallScreen(context) ? itemPadding + 80 : itemPadding - 80,
        ),
        const ConnectWallet(),
      ],
    );
  }
}

class ConnectWallet extends StatefulWidget {
  const ConnectWallet({Key? key}) : super(key: key);

  @override
  State<ConnectWallet> createState() => _ConnectWalletState();
}

class _ConnectWalletState extends State<ConnectWallet> {
  late HomeController _homeController;
  late ContractController _contractController;

  @override
  void initState() {
    _homeController = Get.put(HomeController());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        _homeController.connect().then((value) {
          _contractController = Get.find(tag: "contractController");
          _contractController.getScheduleByAddressAndIndex(id: 0, beneficaryAddress: _homeController.currentAddress!);
          _contractController.getSchedulesInfo();
          _homeController.isLoading(false);
        });
      },
      child: Obx(
        () => Container(
          padding: const EdgeInsets.all(defaultPadding * 0.75),
          decoration: BoxDecoration(
            color: _homeController.isLoading.value ? textColorBlack : callToAction,
            borderRadius: const BorderRadius.all(
              Radius.circular(10),
            ),
          ),
          child: _homeController.isLoading.value
              ? const CircularProgressIndicator(
                  color: callToAction,
                )
              : Padding(
                  padding: const EdgeInsets.symmetric(horizontal: defaultPadding / 2),
                  child: CustomText(
                    text: _homeController.currentAddress ?? "Connect Wallet",
                    color: Colors.white,
                    size: 18,
                  ),
                ),
        ),
      ),
    );
  }
}
