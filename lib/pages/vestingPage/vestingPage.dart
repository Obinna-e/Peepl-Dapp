import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:get/state_manager.dart';
import 'package:nftapp/Widgets/customText.dart';
import 'package:nftapp/Widgets/header.dart';
import 'package:nftapp/controllers/home_controller.dart';
import 'package:nftapp/Widgets/side_menu.dart';
import 'package:nftapp/constants/style.dart';
import 'package:get/utils.dart';
import 'dart:math' as math;

import 'package:nftapp/pages/dashboard/dashboard_screen.dart';

class VestingPage extends StatefulWidget {
  
  @override
  State<VestingPage> createState() => _VestingPageState();
}

class _VestingPageState extends State<VestingPage> {
  final mockDropdown = ['1', 'ID 2', 'ID 3', 'ID 4',];
  String? value;

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    /*
    Todo: Add logic for switching screens in LargeScreen Widget
     */

    DropdownMenuItem<String> buildMenuItem(String item) => DropdownMenuItem(value: item, child: CustomText(text: item),);
    return GetBuilder<HomeController>(
      init: HomeController(),
      builder: (h) => Scaffold(
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: defaultPadding, right: defaultPadding),
              child: Row(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(children:[
                Icon(Icons.dashboard_outlined, color: light, size: 30),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: CustomText(text: 'Dashboard', size: 35,),
              ),],),
              Row(
                children: [
                 
                 
                    
                    
                        
                        Container(
                          height: 35,
                          width: 400,
                          color: containerColor,
                          child: DropdownButtonFormField<String>(
                       decoration: InputDecoration(
                         isDense: true,
                         prefixIcon: 
                             
                               
                                 Row(
                                   children: [
                                     Icon(Icons.account_balance_wallet, color: Colors.yellow[700],),
                                   Padding(
                                     padding: const EdgeInsets.only(left: 8.0),
                                     child: CustomText(text: 'Schedule ID: '),
                                   )],
                                   
                                 ),
                               
                             

                             prefixIconConstraints: BoxConstraints(maxWidth: 150,),
                             
                           
                         
                         
                       ),
                          value: value,
                          items: mockDropdown.map(buildMenuItem).toList(), onChanged: (value) => setState(() => this.value = value) ),
                        ),
                    
                 

                  
                  Padding(
                    padding: const EdgeInsets.only(left: 8.0),
                    child: ElevatedButton(onPressed: () {}, child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Transform.rotate(
                          angle: 180 * math.pi / 100,
                          child: Icon(Icons.send, color: Colors.green[200],)), const Padding(
                          padding: EdgeInsets.all(8.0),
                          child: CustomText(text: 'Connect Wallet'),
                        ),
                      ],
                    ),
                    style: ElevatedButton.styleFrom(
                      primary: containerColor,
                    ),),
                  ),
                ],
              ),],),
              Spacer(),
              Column(children: [
                Row(children: [
                   IconButton(onPressed: () {}, icon: Icon(Icons.search, color: Colors.grey[600],),),
              IconButton(onPressed: () {},icon: Icon(Icons.refresh_outlined, color: Colors.grey[600],),),
                ],),
                Row(
                  children: [

                InkWell(
                  onTap: () {},
                  child: Container(
                    width: 105,
                    padding: EdgeInsets.all(8.0),
                    
                    decoration: BoxDecoration(
                      color: containerColor,
                      borderRadius: BorderRadius.circular(10.0),
                      border: Border.all(color: Colors.green),
                    ),
                    child: Center(child: Row(
                      children: [
                        Transform.rotate(
                          angle: 180 * math.pi / 250,
                          child: Icon(Icons.arrow_forward_rounded, color: Colors.green[200],)),
                        CustomText(text: 'Recieve', color: Colors.green[200],),
                      ],
                    ),),
                  ),
                ),
                const SizedBox(
                  width: 20,
                ),
                
                InkWell(
                  onTap: () {},
                  child: Container(
                    width: 90,
                    padding: const EdgeInsets.all(8.0),
                    
                    decoration: BoxDecoration(
                      color: Colors.deepPurple[400],
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    child: Center(child: Row(
                      children: [
                        Transform.rotate(
                          angle: 180 * math.pi / 100,
                          child: const Icon(Icons.arrow_forward_rounded, color: light,)),
                        const CustomText(text: 'Send'),
                      ],
                    )),
                  ),
                ),],),

             
                ],),],)
            ),
            Padding(
              padding: const EdgeInsets.all(defaultPadding),
              child: Row(
                children: [
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(defaultPadding),
                      child: Container(
                        height: height * 0.7,
                        decoration: BoxDecoration(
                          color: containerColor,
                          borderRadius: BorderRadius.circular(10)
                        ),
                        
                        child: Column(
                          children: [
                            Row(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(defaultPadding),
                                  child: Column(
                                    children: const [
                                      Padding(
                                        padding: EdgeInsets.all(8.0),
                                        child: CustomText(text: 'Peepl'),
                                      ),
                                      Padding(
                                        padding: EdgeInsets.all(8.0),
                                        child: CustomText(text: 'No Fees'),
                                      ),
                                    ],
                                  ),
                                ),
                                const Spacer(),
                                const Padding(
                                  padding: EdgeInsets.all(defaultPadding),
                                  child: CustomText(
                                    text: 'Peepl Logo',
                                  ),
                                ),
                              ],
                            ),
                            const Padding(
                              padding: EdgeInsets.all(defaultPadding),
                              child: Divider(
                                thickness: 3,
                              ),
                            ),
                            const VestingDetails(
                              vestingDetails: 'Vested',
                              amount: '\$5000',
                            ),
                            VestingDetails(
                                vestingDetails: 'Schedule Count', amount: '1'),
                            VestingDetails(
                                vestingDetails: 'Schedule ID', amount: '00000'),
                            VestingDetails(
                                vestingDetails: 'Cycle ends in:',
                                amount: '00:00:00'),
                            Padding(
                              padding: const EdgeInsets.all(defaultPadding),
                              child: Divider(
                                thickness: 3,
                              ),
                            ),
                            CustomText(text: 'Peepl earned')
                          ],
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Container(
                      padding: const EdgeInsets.all(defaultPadding),
                      height: height * 0.7,
                      decoration: const BoxDecoration(
                        color: containerColor,
                        borderRadius: BorderRadius.all(Radius.circular(10))
                      ),
                      child: Column(children: [ Container(
                        height: 300,
                        width: 300,
                        decoration: BoxDecoration(
                          color: Colors.grey[900],
                          shape: BoxShape.circle,
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(10),
                          child: Stack(
                            children: [ SizedBox(
                              height: 300,
                              child: PieChart(PieChartData(sectionsSpace: 20,sections: [PieChartSectionData(color: Colors.lightBlue[100], showTitle: false, radius: 10), PieChartSectionData(color: Colors.purple[900], showTitle: false, radius: 10),PieChartSectionData(color: Colors.lightGreen[400], showTitle: false, radius: 10),],),),
                            ),

                            Positioned(
                              left: 25,
                              top: 25,

                              child: Container(
                                height: 230,
                                width: 230,
                                decoration: BoxDecoration(color: Colors.grey[850],
                                shape: BoxShape.circle),

                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: CustomText2(text: 'Vested Amount'),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: CustomText(text: '400', size: 40,),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: CustomText2(text: 'PPL'),
                                    ),
                                  ],
                                ),
                              ),
                            )
                          ],),
                        ),
                      )]),
                    ),
                  ),
                ],
              ),
            ),

            // child: SingleChildScrollView(
            //   padding: const EdgeInsets.all(defaultPadding),
            //   child: Column(
            //     children: [
            //       Builder(builder: (_) {
            //         var shown = 'h';
            //         if (h.isConnected && h.isInOperatingChain) {
            //           shown = '${h.currentAddress}';
            //         } else if (h.isConnected && !h.isInOperatingChain) {
            //           shown = 'Wrong Chain! Please connect to BSC.';
            //         } else if (h.isEnabled)
            //           return ElevatedButton(
            //             onPressed: () async => await h.connect(),
            //             child: Text('Connect'),
            //           );
            //         else
            //           shown = 'Your browser is not Supported';

            //         return Text(shown);
            //       }),
            //       h.isConnected && h.isInOperatingChain
            //           ? Column(
            //               children: [
            //                 ElevatedButton(
            //                   onPressed: () async =>
            //                       await h.getVestingContractInformation(),
            //                   child: Text('Get Vesting ID'),
            //                 ),
            //                 Container(
            //                   child: Text('Amount is ${h.withdrawableAmount}'),
            //                 ),
            //                 Container(
            //                     child: Text(
            //                         'Withdrawable amount is ${h.withdrawableAmount}')),
            //                 ElevatedButton(
            //                   onPressed: () async =>
            //                       await h.getTokenBalance(),
            //                   child: Text('Get token Amount'),
            //                 ),
            //                 Container(
            //                   child: Text('${h.yourTokenBalance}'),
            //                 )
            //               ],
            //             )
            //           : const SizedBox(
            //               height: defaultPadding,
            //             ),
            //       Row(
            //         crossAxisAlignment: CrossAxisAlignment.start,
            //         children: [
            //           Expanded(
            //             child: Container(
            //               decoration: const BoxDecoration(
            //                 color: containerColor,
            //                 borderRadius: BorderRadius.all(
            //                   Radius.circular(10),
            //                 ),
            //               ),
            //             ),
            //           ),
            //         ],
            //       ),
            //     ],
            //   ),
            // ),
            // ),
          ],
        ),
      ),
    );
  }
}

class VestingDetails extends StatelessWidget {
  final String vestingDetails;
  final String amount;

  const VestingDetails({
    Key? key,
    required this.vestingDetails,
    required this.amount,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(defaultPadding),
      child: Row(
        children: [
          CustomText(text: vestingDetails),
          Spacer(),
          CustomText(text: amount),
        ],
      ),
    );
  }
}
