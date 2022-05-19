import 'package:decimal/decimal.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nftapp/Widgets/customText.dart';
import 'package:nftapp/Widgets/large_home_page.dart';
import 'package:nftapp/Widgets/small_home_page.dart';
import 'package:nftapp/controllers/home_controller.dart';

import 'package:nftapp/helpers/responsiveness.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(
      init: HomeController(),
      builder: (h) => Scaffold(
        body: Builder(
          builder: (_) {
            if (h.isEnabled) {
              return SingleChildScrollView(
                  child: ResponsiveWidget.isSmallScreen(context) ? const SmallHomePage() : const LargeHomePage());
            } else if (h.isConnected && !h.isInOperatingChain) {
              return const Center(child: CustomText(text: 'Wrong Chain! Please connect to FUSE Network'));
            } else {
              return const Center(child: CustomText(text: 'Your browser is not Supported'));
            }
          },
        ),
      ),
    );
  }
}
