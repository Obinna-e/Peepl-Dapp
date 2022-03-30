import 'package:flutter/material.dart';
import 'package:nftapp/Widgets/customText.dart';
import 'package:nftapp/Widgets/glassmorphism.dart';

class TokenRateItems extends StatefulWidget {
  final Colors? color;
  final String symbol;
  final String tokenName;
  final String price;
  const TokenRateItems({
    Key? key,
    required this.symbol,
    required this.tokenName,
    required this.price,
    this.color,
  }) : super(key: key);

  @override
  State<TokenRateItems> createState() => _TokenRateItemsState();
}

class _TokenRateItemsState extends State<TokenRateItems> {
  bool _isBlur = false;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(5.0),
      child: Center(
        child: GestureDetector(
          onTap: () {
            setState(() {
              _isBlur = !_isBlur;
            });
          },
          child: GlassMorphism(
            blur: _isBlur ? 20 : 0.001,
            opacity: 0.05,
            child: SizedBox(
              height: 70,
              width: 250,
              child: Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: GlassMorphism(
                      blur: _isBlur ? 20 : 0.001,
                      opacity: 0.08,
                      color: Colors.green.withOpacity(0.2),
                      // ignore: sized_box_for_whitespace
                      child: const SizedBox(
                        height: 50,
                        width: 50,
                      ),
                    ),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      IntrinsicHeight(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            CustomText(text: widget.symbol),
                            const VerticalDivider(
                              width: 20,
                              color: Colors.grey,
                            ),
                            CustomText2(text: widget.tokenName),
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      CustomText(text: widget.price),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
