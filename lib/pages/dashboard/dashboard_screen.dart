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

                    h.getSchedulesInfo();
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
                                      CustomText(
                                        text: '0x######',
                                        color: textColorBlack,
                                      ),
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
                                          CustomText(
                                            text: '##### PPL (£####)',
                                            color: textColorBlack,
                                          ),
                                        ],
                                      ),
                                      Column(
                                        children: const [
                                          CustomText(
                                              text: 'Withdrawal Available in'),
                                          CustomText(
                                            text: '##### Days',
                                            color: textColorBlack,
                                          ),
                                          CustomText2(
                                            text: 'YYYY-MM-DD',
                                            color: textColorGrey,
                                          ),
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
                      ? SingleChildScrollView(
                          padding: const EdgeInsets.all(defaultPadding),
                          child: SizedBox(
                            height: MediaQuery.of(context).size.height,
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
                                          CustomText(
                                            text: h.displayScheduleID,
                                            color: textColorBlack,
                                          ),
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
                                                    '${h.vestedTotal} PPL (£####)',
                                                color: textColorBlack,
                                              ),
                                            ],
                                          ),
                                          Column(
                                            children: [
                                              const CustomText(
                                                  text: 'Fully Vested'),
                                              CustomText(
                                                text: '${h.endTimeDays} Days',
                                                color: textColorBlack,
                                              ),
                                              CustomText2(
                                                text: h.endTime,
                                                color: textColorGrey,
                                              ),
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
                                                    '${h.amountReleasable} PPL (£####)',
                                                color: textColorBlack,
                                              ),
                                            ],
                                          ),
                                          Column(
                                            children: [
                                              const CustomText(
                                                  //TODO: Change this text to cliff date since User will not be allowed to withdraw early
                                                  text:
                                                      'Withdrawal Available in'),
                                              CustomText(
                                                //TODO: If end day is negative, show 0 days!!!
                                                text: '${h.cliffEndDays} Days',
                                                color: textColorBlack,
                                              ),
                                              CustomText2(
                                                text: h.cliff,
                                                color: textColorGrey,
                                              ),
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
