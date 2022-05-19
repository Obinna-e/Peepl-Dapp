import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nftapp/Widgets/customText.dart';
import 'package:nftapp/Widgets/header.dart';
import 'package:nftapp/constants/style.dart';
import 'package:nftapp/controllers/contract_controller.dart';
import 'package:nftapp/controllers/home_controller.dart';

class SmallHomePage extends StatefulWidget {
  const SmallHomePage({Key? key}) : super(key: key);

  @override
  State<SmallHomePage> createState() => _SmallHomePageState();
}

class _SmallHomePageState extends State<SmallHomePage> {
  late HomeController _homeController;
  late ContractController _contractController;

  @override
  void initState() {
    _homeController = Get.find();

    try {
      _contractController = Get.find(tag: "contractController");
    } catch (e) {
      _homeController.walletConnect.listen((isConnected) {
        isConnected ? _contractController = Get.find(tag: "contractController") : null;
      });
    }

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Header(),
        Padding(
          padding: const EdgeInsets.only(left: 38.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const CustomText(text: 'Your Schedule Id'),
                  Obx(
                    () => CustomText(
                      text: _homeController.walletConnect.value ? _contractController.currentScheduleID.value : "dumb",
                      color: textColorBlack,
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const CustomText(text: 'Vested Amount'),
                  Obx(
                    () => CustomText(
                      text: _homeController.walletConnect.value
                          ? _contractController.vestedTotal.value.toString()
                          : "dumb",
                      color: textColorBlack,
                    ),
                  )
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const CustomText(text: 'Fully Vested'),
                  Obx(
                    () => CustomText(
                      text: _homeController.walletConnect.value
                          ? _contractController.endTimeDays.value.toString()
                          : "dumb",
                      color: Colors.black,
                    ),
                  ),
                  Obx(
                    () => CustomText2(
                      text: _homeController.walletConnect.value
                          ? _contractController.scheduleEnd.value.toString()
                          : "dumb",
                      color: textColorGrey,
                    ),
                  )
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const CustomText(text: 'Withdrawable Amount'),
                  Obx(
                    () => CustomText(
                      text: _homeController.walletConnect.value
                          ? _contractController.currentAmountReleasable.value.toString()
                          : "dumb",
                      color: textColorBlack,
                    ),
                  )
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const CustomText(text: 'Withdrawal Available in'),
                  Obx(
                    () => CustomText(
                      text: _homeController.walletConnect.value
                          ? _contractController.cliffEndDays.value.toString()
                          : "dumb",
                      color: textColorBlack,
                    ),
                  ),
                  Obx(
                    () => CustomText2(
                      text: _homeController.walletConnect.value ? _contractController.cliff.value.toString() : "dumb",
                      color: textColorGrey,
                    ),
                  )
                ],
              ),
            ],
          ),
        )
      ],
    );
  }
}
