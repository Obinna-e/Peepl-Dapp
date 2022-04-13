import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:nftapp/Widgets/customText.dart';
import 'package:nftapp/Widgets/header.dart';

import 'package:nftapp/constants/style.dart';
import 'package:nftapp/controllers/home_controller.dart';

class DashboardScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(
        init: HomeController(),
        builder: (h) => Scaffold(
              body: Builder(
                builder: (_) {
                  var currentaddress = '';
                  var text = '';

                  if (h.isConnected && h.isInOperatingChain) {
                    h.getVestingSchedulesCountByBeneficiary();
                    h.getVestingContractInformation();
                    h.getScheduleByAddressAndIndex(0, h.currentAddress);
                  } else if (h.isConnected && !h.isInOperatingChain) {
                    text = 'Wrong Chain! Please connect to FUSE Network';
                  } else if (h.isEnabled) {
                    return SafeArea(
                      child: SingleChildScrollView(
                        padding: const EdgeInsets.all(defaultPadding),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Column(
                              children: [
                                Header(
                                  connectWallet: h.connect,
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(defaultPadding),
                                  child: Column(
                                    children: const [
                                      CustomText(text: 'Your Schedule Id'),
                                      CustomText(text: '0x######'),
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(defaultPadding),
                                  child: Row(
                                    children: [
                                      Column(
                                        children: const [
                                          CustomText(text: 'Vested Amount'),
                                          CustomText(text: '##### PPL (£####)'),
                                        ],
                                      ),
                                      Column(
                                        children: const [
                                          CustomText(text: 'Fully Vested'),
                                          CustomText(text: '##### Days'),
                                          CustomText2(text: 'YYYY-MM-DD'),
                                        ],
                                      )
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(defaultPadding),
                                  child: Row(
                                    children: [
                                      Column(
                                        children: const [
                                          CustomText(
                                              text: 'Withdrawable Amount'),
                                          CustomText(text: '##### PPL (£####)'),
                                        ],
                                      ),
                                      Column(
                                        children: const [
                                          CustomText(
                                              text: 'Withdrawal Available in'),
                                          CustomText(text: '##### Days'),
                                          CustomText2(text: 'YYYY-MM-DD'),
                                        ],
                                      )
                                    ],
                                  ),
                                )
                              ],
                            )
                          ],
                        ),
                      ),
                    );
                  } else {
                    text = 'Your browser is not Supported';
                    return CustomText(text: text);
                  }

                  return (h.isConnected && h.isInOperatingChain)
                      ? SafeArea(
                          child: SingleChildScrollView(
                            padding: const EdgeInsets.all(defaultPadding),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Column(
                                  children: [
                                    Header(
                                      walletState: h.displayAddress,
                                      connectWallet: () {},
                                    ),
                                    Padding(
                                      padding:
                                          const EdgeInsets.all(defaultPadding),
                                      child: Column(
                                        children: [
                                          const CustomText(
                                              text: 'Your Schedule Id'),
                                          CustomText(text: h.displayAddress),
                                        ],
                                      ),
                                    ),
                                    Padding(
                                      padding:
                                          const EdgeInsets.all(defaultPadding),
                                      child: Row(
                                        children: [
                                          Column(
                                            children: [
                                              const CustomText(
                                                  text: 'Vested Amount'),
                                              CustomText(
                                                  text:
                                                      '${h.amountReleasable} PPL (£####)'),
                                            ],
                                          ),
                                          Column(
                                            children: [
                                              const CustomText(
                                                  text: 'Fully Vested'),
                                              const CustomText(
                                                  text: '##### Days'),
                                              CustomText2(text: h.endTime),
                                            ],
                                          )
                                        ],
                                      ),
                                    ),
                                    Padding(
                                      padding:
                                          const EdgeInsets.all(defaultPadding),
                                      child: Row(
                                        children: [
                                          Column(
                                            children: [
                                              const CustomText(
                                                  text: 'Withdrawable Amount'),
                                              CustomText(
                                                  text:
                                                      '${h.amountReleasable} PPL (£####)'),
                                            ],
                                          ),
                                          Column(
                                            children: [
                                              const CustomText(
                                                  text:
                                                      'Withdrawal Available in'),
                                              const CustomText(
                                                  text: '##### Days'),
                                              CustomText2(text: h.endTime),
                                            ],
                                          )
                                        ],
                                      ),
                                    )
                                  ],
                                )
                              ],
                            ),
                          ),
                        )
                      : CustomText(text: text);
                },
              ),
            ));
  }
}
