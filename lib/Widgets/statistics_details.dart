import 'package:flutter/material.dart';
import 'package:nftapp/Widgets/sales_chart.dart';
import 'package:nftapp/Widgets/statistics_text.dart';
import 'package:nftapp/constants/style.dart';

class StatisticsDetails extends StatelessWidget {
  const StatisticsDetails({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: containerColor,
        borderRadius: BorderRadius.all(
          Radius.circular(10),
        ),
      ),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(
              defaultPadding,
            ),
            child: Row(
              children: [
                const Text(
                  "Statistics",
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const Spacer(),
                InkWell(
                  onTap: () {},
                  child: const Text(
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
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                StatsText(
                  title: "Artworks Sold",
                  value: "187",
                  hasBackground: true,
                ),
                StatsText(
                  title: "Failed Purchases",
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
          const LineChartSample2(),
        ],
      ),
    );
  }
}
