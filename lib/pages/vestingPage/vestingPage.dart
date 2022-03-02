import 'package:flutter/material.dart';
import 'package:get/state_manager.dart';
import 'package:nftapp/Widgets/header.dart';
import 'package:nftapp/Widgets/home_controller.dart';
import 'package:nftapp/Widgets/side_menu.dart';
import 'package:nftapp/constants/style.dart';

import 'package:nftapp/pages/dashboard/dashboard_screen.dart';

class VestingPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    /*
    Todo: Add logic for switching screens in LargeScreen Widget
     */
    return GetBuilder<HomeController>(
      init: HomeController(),
      builder: (h) => Scaffold(
        body: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ConstrainedBox(
              constraints: const BoxConstraints(minWidth: 50, maxWidth: 100),
              child: SideMenu(),
            ),
            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.all(defaultPadding),
                child: Column(
                  children: [
                    Builder(builder: (_) {
                      var shown = 'h';
                      if (h.isConnected && h.isInOperatingChain) {
                        shown = '${h.currentAddress}';
                      } else if (h.isConnected && !h.isInOperatingChain) {
                        shown = 'Wrong Chain! Please connect to BSC.';
                      } else if (h.isEnabled)
                        return ElevatedButton(
                          onPressed: () async => await h.connect(),
                          child: Text('Connect'),
                        );
                      else
                        shown = 'Your browser is not Supported';

                      return Text(shown);
                    }),
                    h.isConnected && h.isInOperatingChain
                        ? Column(
                            children: [
                              ElevatedButton(
                                onPressed: () async =>
                                    await h.getVestingContractInformation(),
                                child: Text('Get Vesting ID'),
                              ),
                              Container(
                                child: Text('Amount is ${h.vestingId}'),
                              ),
                              Container(
                                  child: Text(
                                      'Withdrawable amount is ${h.withdrawableAmount}')),
                              ElevatedButton(
                                onPressed: () async => await h
                                    .computeAmountReleasable(h.vestingId),
                                child: Text('Get Vested Amount'),
                              ),
                              Container(
                                child: Text('${h.amountReleasable}'),
                              )
                            ],
                          )
                        : const SizedBox(
                            height: defaultPadding,
                          ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                          child: Container(
                            decoration: const BoxDecoration(
                              color: containerColor,
                              borderRadius: BorderRadius.all(
                                Radius.circular(10),
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
      ),
    );
  }
}
