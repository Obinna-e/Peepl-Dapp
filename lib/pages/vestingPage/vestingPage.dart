import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/state_manager.dart';
import 'package:nftapp/Widgets/customText.dart';
import 'package:nftapp/Widgets/token_rate_items.dart';
import 'package:nftapp/Widgets/vestingdetails.dart';
import 'package:nftapp/controllers/home_controller.dart';
import 'package:nftapp/constants/style.dart';
import 'package:clipboard/clipboard.dart';
import 'package:flutter_inset_box_shadow/flutter_inset_box_shadow.dart'
    as inset_box;
import 'dart:math' as math;

class VestingPage extends StatefulWidget {
  @override
  State<VestingPage> createState() => _VestingPageState();
}

class _VestingPageState extends State<VestingPage> {
  final mockDropdown = [];
  String? value;
  bool isPressed = false;

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;

    /*
    TODO: Add logic for switching screens in LargeScreen Widget
     */

    DropdownMenuItem<String> buildMenuItem(String item) => DropdownMenuItem(
          value: item,
          child: CustomText(text: item),
        );

    Offset distance = isPressed ? const Offset(10, 10) : const Offset(28, 28);
    double blur = isPressed ? 5.0 : 30.0;

    return GetBuilder<HomeController>(
      init: HomeController(),
      builder: (h) => Scaffold(
        body: Builder(builder: (_) {
          /*TODO: 
          *Fix bug were you need to refresh page when user not signed in to metamask
          *Make main vesting page widget stateless
          * 
          */
          var currentaddress = '';
          var text = '';

          if (h.isConnected && h.isInOperatingChain) {
            h.getVestingSchedulesCountByBeneficiary();
            h.getVestingContractInformation();
            h.getScheduleByAddressAndIndex(0, h.currentAddress);
          } else if (h.isConnected && !h.isInOperatingChain) {
            //TODO: changge operating chain and chain id to Fuse and change below text to Fuse Network
            text = 'Wrong Chain! Please connect to BSC';
          } else if (h.isEnabled) {
            return Center(
              child: Listener(
                onPointerUp: (_) => setState(() {
                  isPressed = false;
                  h.connect();
                }),
                onPointerDown: (_) => setState(() => isPressed = true),
                child: AnimatedContainer(
                  duration: const Duration(milliseconds: 100),
                  decoration: inset_box.BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                    color: scaffoldColor,
                    gradient: const LinearGradient(
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                        colors: [
                          Color.fromARGB(255, 7, 6, 15),
                          Color.fromARGB(255, 41, 35, 87),
                        ]),
                    boxShadow: [
                      inset_box.BoxShadow(
                        blurRadius: blur,
                        offset: -distance,
                        color: const Color.fromARGB(255, 41, 35, 87),
                        inset: isPressed,
                      ),
                      inset_box.BoxShadow(
                        blurRadius: blur,
                        offset: distance,
                        color: const Color.fromARGB(255, 7, 6, 15),
                        inset: isPressed,
                      ),
                    ],
                  ),
                  child: SizedBox(
                      height: 300,
                      width: 300,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SizedBox(
                            height: 70,
                            width: 70,
                            child: SvgPicture.asset(
                              "assets/images/metamask.svg",
                            ),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          const CustomText2(text: 'Connect Wallet'),
                        ],
                      )),
                ),
              ),
            );
          } else {
            text = 'Your browser is not Supported';
            return CustomText(text: text);
          }
          return h.isConnected && h.isInOperatingChain
              ? Column(
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
                                                  padding: EdgeInsets.only(
                                                      left: 8.0),
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
                                          items: h.scheduleIDdropdown
                                              .map(buildMenuItem)
                                              .toList(),
                                          onChanged: (value) => setState(
                                              () => this.value = value)),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(left: 8.0),
                                      child: ElevatedButton(
                                        onPressed: () {
                                          h.isConnected
                                              ? FlutterClipboard.copy(
                                                      h.currentAddress)
                                                  .then((value) =>
                                                      print('copied'))
                                              : {};
                                        },
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
                                              padding:
                                                  const EdgeInsets.all(8.0),
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
                                        h.getUserVestingSchedulesList(
                                            h.scheduleCount, h.currentAddress);
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
                                          borderRadius:
                                              BorderRadius.circular(10.0),
                                          border:
                                              Border.all(color: Colors.green),
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
                                          borderRadius:
                                              BorderRadius.circular(10.0),
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
                                                      color: Colors
                                                          .lightBlueAccent[100],
                                                      showTitle: false,
                                                      radius: 10),
                                                  PieChartSectionData(
                                                      color: Colors.purple[900],
                                                      showTitle: false,
                                                      radius: 10),
                                                  PieChartSectionData(
                                                      color:
                                                          const Color.fromARGB(
                                                              255,
                                                              163,
                                                              241,
                                                              74),
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
                                                    padding:
                                                        EdgeInsets.all(8.0),
                                                    child: CustomText2(
                                                        text: 'Vested Amount'),
                                                  ),
                                                  Padding(
                                                    padding:
                                                        const EdgeInsets.all(
                                                            8.0),
                                                    child: CustomText(
                                                      text:
                                                          '${h.amountReleasable}',
                                                      size: 30,
                                                    ),
                                                  ),
                                                  const Padding(
                                                    padding:
                                                        EdgeInsets.all(8.0),
                                                    child: CustomText2(
                                                        text: 'PPL'),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  VestingDetails(
                                    vestingDetails: 'Withdrawable Amount',
                                    amount: '${h.amountReleasable} PPL',
                                    color: Colors.purple[900],
                                    note:
                                        'CLAIMING BEFORE FULLY VESTED REVOKES \nREMAINING AMOUNT',
                                  ),
                                  VestingDetails(
                                    vestingDetails: 'No. of Schedule(s)',
                                    amount: '${h.scheduleCount}',
                                    color: Colors.lightBlueAccent[100],
                                  ),
                                  VestingDetails(
                                    vestingDetails: 'Cliff',
                                    note: 'Start Date: ${h.startTime}',
                                    amount: 'Fully Vested on: ${h.endTime}',
                                    color: Colors.lightGreen[400],
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
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Container(
                                        height: height * 0.35,
                                        width: width * 0.21,
                                        decoration: BoxDecoration(
                                          color: containerColor,
                                          borderRadius:
                                              BorderRadius.circular(35.0),
                                        ),
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          children: const [
                                            Padding(
                                              padding:
                                                  EdgeInsets.only(top: 15.0),
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
                                          borderRadius:
                                              BorderRadius.circular(35.0),
                                        ),
                                        child: ClipRRect(
                                          borderRadius:
                                              BorderRadius.circular(35.0),
                                          child: Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            children: [
                                              const Padding(
                                                padding:
                                                    EdgeInsets.only(top: 80.0),
                                                child: CustomText(
                                                  text: 'COMING SOON',
                                                ),
                                              ),
                                              const Spacer(),
                                              Row(
                                                children: [
                                                  Expanded(
                                                    child: Container(
                                                      decoration:
                                                          const BoxDecoration(
                                                        color: Color.fromARGB(
                                                            255, 141, 228, 144),
                                                      ),
                                                      child: const Center(
                                                        child: Padding(
                                                          padding:
                                                              EdgeInsets.only(
                                                                  bottom: 23.0,
                                                                  top: 23.0),
                                                          child: CustomText(
                                                            text:
                                                                'STAKE YOUR TOKENS',
                                                            color: Colors.black,
                                                            weight:
                                                                FontWeight.w600,
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
                )
              : Center(
                  child: CustomText(text: text),
                );
        }),
      ),
    );
  }
}
