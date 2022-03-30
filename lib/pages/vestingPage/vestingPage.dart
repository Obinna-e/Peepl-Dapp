import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:get/state_manager.dart';
import 'package:nftapp/Widgets/customText.dart';
import 'package:nftapp/Widgets/token_rate_items.dart';
import 'package:nftapp/controllers/home_controller.dart';
import 'package:nftapp/constants/style.dart';
import 'dart:math' as math;

class VestingPage extends StatefulWidget {
  @override
  State<VestingPage> createState() => _VestingPageState();
}

class _VestingPageState extends State<VestingPage> {
  final mockDropdown = [
    '1',
    '2',
    '3',
    '4',
  ];
  String? value;

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    /*
    Todo: Add logic for switching screens in LargeScreen Widget
     */

    DropdownMenuItem<String> buildMenuItem(String item) => DropdownMenuItem(
          value: item,
          child: CustomText(text: item),
        );
    return GetBuilder<HomeController>(
      init: HomeController(),
      builder: (h) => Scaffold(
        body: Builder(builder: (_) {
          /*TODO: 
          *Fix bug were you need to refresh page when user not signed in to metamask
          *Make main vesting page widget stateless
          * 
          */
          var currentaddress = 'h';
          if (h.isConnected && h.isInOperatingChain) {
            currentaddress = h.currentAddress;
          } else if (h.isConnected && !h.isInOperatingChain) {
            //TODO: changge operating chain and chain id to Fuse and change below text to Fuse Network
            currentaddress = 'Wrong Chain! Please connect to BSC';
          } else if (h.isEnabled) {
            return ElevatedButton(
              onPressed: () async => await h.connect(),
              child: const Text('Connect'),
            );
          } else {
            currentaddress = 'Your browser is not Supported';
          }
          return Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                  padding: const EdgeInsets.only(
                      left: defaultPadding, right: defaultPadding),
                  child: Row(
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: const [
                              Icon(Icons.dashboard_outlined,
                                  color: light, size: 30),
                              Padding(
                                padding: EdgeInsets.all(8.0),
                                child: CustomText(
                                  text: 'Dashboard',
                                  size: 35,
                                ),
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              Container(
                                height: 35,
                                width: 400,
                                color: containerColor,
                                child: DropdownButtonFormField<String>(
                                    decoration: InputDecoration(
                                      isDense: true,
                                      prefixIcon: Row(
                                        children: [
                                          Icon(
                                            Icons.account_balance_wallet,
                                            color: Colors.yellow[700],
                                          ),
                                          const Padding(
                                            padding: EdgeInsets.only(left: 8.0),
                                            child: CustomText(
                                                text: 'Schedule ID: '),
                                          )
                                        ],
                                      ),
                                      prefixIconConstraints:
                                          const BoxConstraints(
                                        maxWidth: 150,
                                      ),
                                    ),
                                    value: value,
                                    items: mockDropdown
                                        .map(buildMenuItem)
                                        .toList(),
                                    onChanged: (value) =>
                                        setState(() => this.value = value)),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(left: 8.0),
                                child: ElevatedButton(
                                  onPressed: () {},
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Transform.rotate(
                                          angle: 180 * math.pi / 100,
                                          child: Icon(
                                            Icons.send,
                                            color: Colors.green[200],
                                          )),
                                      Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: CustomText(
                                            text: h.isConnected
                                                ? h.displayAddress
                                                : 'Connect Wallet'),
                                      ),
                                      const Icon(Icons.copy),
                                    ],
                                  ),
                                  style: ElevatedButton.styleFrom(
                                    primary: containerColor,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                      const Spacer(),
                      Column(
                        children: [
                          Row(
                            children: [
                              IconButton(
                                onPressed: () {},
                                icon: Icon(
                                  Icons.search,
                                  color: Colors.grey[600],
                                ),
                              ),
                              IconButton(
                                onPressed: () {
                                  h.getVestingContractInformation();
                                },
                                icon: Icon(
                                  Icons.refresh_outlined,
                                  color: Colors.grey[600],
                                ),
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              InkWell(
                                onTap: () {},
                                child: Container(
                                  width: 105,
                                  padding: const EdgeInsets.all(6.0),
                                  decoration: BoxDecoration(
                                    color: containerColor,
                                    borderRadius: BorderRadius.circular(10.0),
                                    border: Border.all(color: Colors.green),
                                  ),
                                  child: Center(
                                    child: Row(
                                      children: [
                                        Transform.rotate(
                                            angle: 180 * math.pi / 250,
                                            child: Icon(
                                              Icons.arrow_forward_rounded,
                                              color: Colors.green[200],
                                            )),
                                        CustomText(
                                          text: 'Recieve',
                                          color: Colors.green[200],
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                              const SizedBox(
                                width: 20,
                              ),
                              InkWell(
                                onTap: () {},
                                child: Container(
                                  width: 90,
                                  padding: const EdgeInsets.all(6.0),
                                  decoration: BoxDecoration(
                                    color: Colors.deepPurple[400],
                                    borderRadius: BorderRadius.circular(10.0),
                                  ),
                                  child: Center(
                                      child: Row(
                                    children: [
                                      Transform.rotate(
                                          angle: 180 * math.pi / 100,
                                          child: const Icon(
                                            Icons.arrow_forward_rounded,
                                            color: light,
                                          )),
                                      const CustomText(text: 'Send'),
                                    ],
                                  )),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ],
                  )),
              Padding(
                padding: const EdgeInsets.all(defaultPadding),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child: Container(
                        padding: const EdgeInsets.all(defaultPadding),
                        height: height * 0.759,
                        width: 100,
                        decoration: const BoxDecoration(
                            color: containerColor,
                            borderRadius:
                                BorderRadius.all(Radius.circular(35))),
                        child: Column(
                          children: [
                            Container(
                              height: 300,
                              width: 300,
                              decoration: BoxDecoration(
                                color: Colors.grey[900],
                                shape: BoxShape.circle,
                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(10),
                                child: Stack(
                                  children: [
                                    SizedBox(
                                      height: 300,
                                      child: PieChart(
                                        PieChartData(
                                          sectionsSpace: 20,
                                          sections: [
                                            PieChartSectionData(
                                                color: Colors.lightBlue[100],
                                                showTitle: false,
                                                radius: 10),
                                            PieChartSectionData(
                                                color: Colors.purple[900],
                                                showTitle: false,
                                                radius: 10),
                                            PieChartSectionData(
                                                color: Colors.lightGreen[400],
                                                showTitle: false,
                                                radius: 10),
                                          ],
                                        ),
                                      ),
                                    ),
                                    Positioned(
                                      left: 25,
                                      top: 25,
                                      child: Container(
                                        height: 230,
                                        width: 230,
                                        decoration: BoxDecoration(
                                            color: Colors.grey[850],
                                            shape: BoxShape.circle),
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            const Padding(
                                              padding: EdgeInsets.all(8.0),
                                              child: CustomText2(
                                                  text: 'Vested Amount'),
                                            ),
                                            Padding(
                                              padding:
                                                  const EdgeInsets.all(8.0),
                                              child: CustomText(
                                                text: '${h.withdrawableAmount}',
                                                size: 40,
                                              ),
                                            ),
                                            const Padding(
                                              padding: EdgeInsets.all(8.0),
                                              child: CustomText2(text: 'PPL'),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(
                                left: 30,
                                right: 30,
                                top: 30,
                              ),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Column(
                                    children: const [
                                      CustomText(text: 'Withdrawable Amount'),
                                      CustomText2(text: '600 PPL'),
                                    ],
                                  ),
                                  const Spacer(),
                                  Column(
                                    children: const [
                                      CustomText(text: 'Schedule Count'),
                                      CustomText2(text: '1'),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(
                                  left: 30, right: 30, top: 10),
                              child: Row(
                                children: const [
                                  CustomText(text: 'Cycle Ends In: '),
                                  CustomText2(text: '00:00:00'),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Expanded(
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(
                              left: defaultPadding,
                              right: defaultPadding,
                            ),
                            child: Container(
                              height: height * 0.4,
                              width: width * 0.5,
                              decoration: BoxDecoration(
                                color: containerColor,
                                borderRadius: BorderRadius.circular(35.0),
                                image: const DecorationImage(
                                    image: AssetImage(
                                      "assets/images/mock_chart.png",
                                    ),
                                    fit: BoxFit.fill),
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(
                                left: defaultPadding,
                                right: defaultPadding,
                                top: 10),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Container(
                                  height: height * 0.35,
                                  width: width * 0.21,
                                  decoration: BoxDecoration(
                                    color: containerColor,
                                    borderRadius: BorderRadius.circular(35.0),
                                  ),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: const [
                                      Padding(
                                        padding: EdgeInsets.only(top: 15.0),
                                        child: CustomText2(
                                          text: 'TOKEN RATES',
                                        ),
                                      ),
                                      TokenRateItems(
                                          symbol: 'FUSE',
                                          price: '£10',
                                          tokenName: 'Fuse'),
                                      TokenRateItems(
                                        symbol: 'GBPx',
                                        price: '£1',
                                        tokenName: 'GBPx',
                                      ),
                                      TokenRateItems(
                                        symbol: 'PPL',
                                        price: '£0.025',
                                        tokenName: 'Peepl',
                                      ),
                                    ],
                                  ),
                                ),
                                Container(
                                  height: height * 0.35,
                                  width: width * 0.21,
                                  decoration: BoxDecoration(
                                    color: containerColor,
                                    borderRadius: BorderRadius.circular(35.0),
                                  ),
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(35.0),
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        const Padding(
                                          padding: EdgeInsets.only(top: 80.0),
                                          child: CustomText(
                                            text: 'COMING SOON',
                                          ),
                                        ),
                                        const Spacer(),
                                        Row(
                                          children: [
                                            Expanded(
                                              child: Container(
                                                decoration: const BoxDecoration(
                                                  color: Color.fromARGB(
                                                      255, 141, 228, 144),
                                                ),
                                                child: const Center(
                                                  child: Padding(
                                                    padding: EdgeInsets.only(
                                                        bottom: 23.0,
                                                        top: 23.0),
                                                    child: CustomText(
                                                      text: 'STAKE YOUR TOKENS',
                                                      color: Colors.black,
                                                      weight: FontWeight.w600,
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          );
        }),
      ),
    );
  }
}
