import 'package:flutter/material.dart';
import 'package:nftapp/Widgets/header.dart';
import 'package:nftapp/Widgets/my_feed.dart';
import 'package:nftapp/Widgets/statistics_details.dart';
import 'package:nftapp/constants/style.dart';
import 'package:nftapp/helpers/abi.dart';

class DashboardScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        padding: const EdgeInsets.all(defaultPadding),
        child: Column(
          children: [
            const Header(),
            const SizedBox(
              height: defaultPadding,
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Expanded(flex: 5, child: MyFeed()),
                const SizedBox(
                  width: defaultPadding,
                ),
                const Expanded(
                  flex: 2,
                  child: StatisticsDetails(),
                ),
              ],
            ),

            ElevatedButton(onPressed: showTrue, child: Text('show human'),),
          ],
        ),
      ),
    );
  }
}
