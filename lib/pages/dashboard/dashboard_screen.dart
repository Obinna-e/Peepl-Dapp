import 'package:flutter/material.dart';
import 'package:nftapp/Widgets/header.dart';
import 'package:nftapp/constants/style.dart';

class DashboardScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        padding: const EdgeInsets.all(defaultPadding),
        child: Column(
          children: [
            Header(),
            SizedBox(
              height: defaultPadding,
            ),
            Row(
              children: [
                Expanded(
                  flex: 5,
                  child: Container(
                    height: 500,
                    color: Colors.white,
                  ),
                ),
                SizedBox(
                  width: defaultPadding,
                ),
                Expanded(
                  flex: 2,
                  child: Container(
                    height: 500,
                    decoration: BoxDecoration(
                      color: containerColor,
                      borderRadius: const BorderRadius.all(
                        Radius.circular(10),
                      ),
                    ),
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(defaultPadding),
                          child: Row(
                            children: [
                              Text(
                                "Statistics",
                                style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                              Spacer(),
                              InkWell(
                                onTap: () {},
                                child: Text(
                                  "View More",
                                  style: TextStyle(
                                    fontSize: 12,
                                    fontWeight: FontWeight.w500,
                                    color: viewMore,
                                    decoration: TextDecoration.underline,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        StatsText(
                          title: "Artwork Sold",
                          value: "187",
                          hasBackground: true,
                        ),
                        StatsText(
                          title: "Artwork Cancel",
                          value: "5",
                          hasBackground: false,
                        ),
                        StatsText(
                          title: "Total Earnings",
                          value: "262 ETH",
                          hasBackground: true,
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}

class StatsText extends StatelessWidget {
  StatsText({
    Key? key,
    required this.title,
    required this.value,
    required this.hasBackground,
  }) : super(key: key);

  final String title;
  final String value;
  bool hasBackground;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(defaultPadding),
      decoration: BoxDecoration(
        color: hasBackground ? innerStatsContainer : containerColor,
        borderRadius: BorderRadius.all(
          Radius.circular(10),
        ),
      ),
      child: Row(
        children: [
          Text(title),
          const Spacer(),
          Text(value),
        ],
      ),
    );
  }
}
