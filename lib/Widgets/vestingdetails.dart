import 'package:flutter/material.dart';
import 'package:nftapp/Widgets/customText.dart';
import 'package:nftapp/constants/style.dart';

class VestingDetails extends StatelessWidget {
  final String vestingDetails;
  final String? note;
  final String amount;
  final Color? color;

  const VestingDetails({
    Key? key,
    required this.vestingDetails,
    required this.amount,
    this.note,
    this.color,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        left: 30,
        right: 30,
        top: 10,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Container(
                    height: 15,
                    width: 5,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10.0),
                        color: color ?? light),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  CustomText(
                    text: vestingDetails,
                  ),
                ],
              ),
              const SizedBox(height: 5),
              CustomText2(
                text: note ?? '',
              ),
            ],
          ),
          const Spacer(),
          Column(
            children: [
              CustomText(text: amount),
            ],
          ),
        ],
      ),
    );
  }
}
