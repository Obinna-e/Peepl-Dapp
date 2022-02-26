import 'package:flutter/material.dart';
import 'package:nftapp/constants/style.dart';

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
        borderRadius: const BorderRadius.all(
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
