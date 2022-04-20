import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:nftapp/Widgets/customText.dart';
import 'package:nftapp/Widgets/header.dart';

import 'package:nftapp/constants/style.dart';
import 'package:nftapp/controllers/home_controller.dart';

class DashboardScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    /*24 is for notification bar on Android*/
    final double itemHeight = (size.height - kToolbarHeight - 24) / 2;
    final double itemWidth = size.width / 5;
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

                    h.getSchedulesInfo();
                  } else if (h.isConnected && !h.isInOperatingChain) {
                    text = 'Wrong Chain! Please connect to FUSE Network';
                  } else if (h.isEnabled) {
                    return SafeArea(
                      child: SingleChildScrollView(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Header(
                              connectWallet: h.connect,
                            ),
                            GridView.count(
                              crossAxisCount: 2,
                              childAspectRatio: 5 / 2,
                              crossAxisSpacing: 0,
                              shrinkWrap: true,
                              padding: EdgeInsets.only(
                                  left: itemWidth, right: itemWidth),
                              children: [
                                Column(
                                  children: const [
                                    CustomText(text: 'Your Schedule Id'),
                                    CustomText(
                                      text: '0x######',
                                      color: textColorBlack,
                                    ),
                                  ],
                                ),
                                const SizedBox(
                                  height: 2,
                                ),
                                Column(
                                  children: const [
                                    CustomText(text: 'Vested Amount'),
                                    CustomText(
                                      text: '##### PPL (£####)',
                                      color: textColorBlack,
                                    ),
                                  ],
                                ),
                                Column(
                                  children: const [
                                    CustomText(text: 'Fully Vested'),
                                    CustomText(
                                      text: '##### Days',
                                      color: Colors.black,
                                    ),
                                    CustomText2(
                                      text: 'YYYY-MM-DD',
                                      color: textColorGrey,
                                    ),
                                  ],
                                ),
                                Column(
                                  children: const [
                                    CustomText(text: 'Withdrawable Amount'),
                                    CustomText(
                                      text: '##### PPL (£####)',
                                      color: textColorBlack,
                                    ),
                                  ],
                                ),
                                Column(
                                  children: const [
                                    CustomText(text: 'Withdrawal Available in'),
                                    CustomText(
                                      text: '##### Days',
                                      color: textColorBlack,
                                    ),
                                    CustomText2(
                                      text: 'YYYY-MM-DD',
                                      color: textColorGrey,
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    );
                  } else {
                    text = 'Your browser is not Supported';
                    return CustomText(text: text);
                  }

                  return (h.isConnected && h.isInOperatingChain)
                      ? SingleChildScrollView(
                          padding: const EdgeInsets.all(defaultPadding),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Header(
                                walletState: h.displayAddress,
                                connectWallet: () {},
                              ),
                              GridView.count(
                                crossAxisCount: 2,
                                childAspectRatio: 5 / 2,
                                crossAxisSpacing: 0,
                                shrinkWrap: true,
                                padding: EdgeInsets.only(
                                    left: itemWidth, right: itemWidth),
                                children: [
                                  Column(
                                    children: [
                                      const CustomText(
                                          text: 'Your Schedule Id'),
                                      CustomText(
                                        text: h.vestedChecker <= 0
                                            ? 'No Vesting Schedule Detected'
                                            : h.displayScheduleID,
                                        color: textColorBlack,
                                      ),
                                    ],
                                  ),
                                  const SizedBox(
                                    height: 2,
                                  ),
                                  Column(
                                    children: [
                                      const CustomText(text: 'Vested Amount'),
                                      CustomText(
                                        text: h.vestedChecker < 1
                                            ? '0 PPL (£####)'
                                            : '${h.vestedTotal} PPL (£####)',
                                        color: textColorBlack,
                                      ),
                                    ],
                                  ),
                                  Column(
                                    children: [
                                      const CustomText(text: 'Fully Vested'),
                                      CustomText(
                                        text: h.vestedChecker < 1
                                            ? '0 Days'
                                            : '${h.endTimeDays} Days',
                                        color: Colors.black,
                                      ),
                                      CustomText2(
                                        text: h.endTime,
                                        color: textColorGrey,
                                      ),
                                    ],
                                  ),
                                  Column(
                                    children: [
                                      const CustomText(
                                          text: 'Withdrawable Amount'),
                                      CustomText(
                                        text:
                                            '${h.amountReleasable} PPL (£####)',
                                        color: textColorBlack,
                                      ),
                                    ],
                                  ),
                                  Column(
                                    children: [
                                      const CustomText(text: 'Cliff Ends In'),
                                      CustomText(
                                        text: h.cliffChecker < 0
                                            ? '0 Days'
                                            : '${h.cliffEndDays} Days',
                                        color: textColorBlack,
                                      ),
                                      CustomText2(
                                        text: h.cliff,
                                        color: textColorGrey,
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ],
                          ),
                        )
                      : CustomText(text: text);
                },
              ),
            ));
  }
}
