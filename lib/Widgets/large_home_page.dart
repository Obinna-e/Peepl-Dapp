import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nftapp/Widgets/customText.dart';
import 'package:nftapp/Widgets/header.dart';
import 'package:nftapp/constants/style.dart';
import 'package:nftapp/controllers/contract_controller.dart';
import 'package:nftapp/controllers/home_controller.dart';
import 'package:nftapp/helpers/responsiveness.dart';

class LargeHomePage extends StatefulWidget {
  const LargeHomePage({Key? key}) : super(key: key);

  @override
  State<LargeHomePage> createState() => _LargeHomePageState();
}

class _LargeHomePageState extends State<LargeHomePage> {
  late double itemHeight;
  late double itemWidth;
  HomeController homeController = Get.put(HomeController());
  ContractController contractController = Get.put(ContractController());

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const Header(),
        GridView.count(
          crossAxisCount: 2,
          childAspectRatio: !ResponsiveWidget.isSmallScreen(context) ? 4.8 / 2 : 1 / 2,
          crossAxisSpacing: 0,
          shrinkWrap: true,
          padding: EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.width * 0.2),
          children: [
            Column(
              children: const [
                CustomText(text: 'Your Schedule Id'),
                CustomText(
                  text: " _contractController.currentScheduleID",
                  color: textColorBlack,
                )
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
                Expanded(
                  child: CustomText2(
                    text: 'YYYY-MM-DD',
                    color: textColorGrey,
                  ),
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
                Expanded(
                  child: CustomText2(
                    text: 'YYYY-MM-DD',
                    color: textColorGrey,
                  ),
                ),
              ],
            ),
          ],
        ),
      ],
    );
  }
}
