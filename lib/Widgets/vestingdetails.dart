import 'package:flutter/material.dart';
import 'package:nftapp/Widgets/customText.dart';
import 'package:nftapp/constants/style.dart';

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
          const Spacer(),
          CustomText(text: amount),
        ],
      ),
    );
  }
}
