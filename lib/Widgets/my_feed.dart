import 'package:flutter/material.dart';
import 'package:like_button/like_button.dart';
import 'package:nftapp/Widgets/feed_gridView.dart';
import 'package:nftapp/constants/style.dart';
import 'package:nftapp/models/dummy_feed.dart';

class MyFeed extends StatelessWidget {
  const MyFeed({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final double height = MediaQuery.of(context).size.height;
    final double width = MediaQuery.of(context).size.width;

    return Column(
      children: [
        Card(
          child: Container(
            color: containerColor,
            height: height * 0.5,
            child: Container(
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.all(
                  Radius.circular(10),
                ),
                image: DecorationImage(
                  image: NetworkImage(
                      "https://m.media-amazon.com/images/I/71Kro3U5M-L._AC_SL1483_.jpg"),
                  fit: BoxFit.fill,
                ),
              ),
              alignment: Alignment.centerRight,
              padding: const EdgeInsets.all(defaultPadding),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Banksy Event",
                    style: TextStyle(fontSize: 40, fontWeight: FontWeight.w600),
                  ),
                  Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text(
                      "0.05 ETH",
                      style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.w600,
                        color: callToAction,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      "Organiser: ThyLaw",
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: InkWell(
                      onTap: () {},
                      child: Container(
                        width: width * 0.09,
                        padding: const EdgeInsets.all(defaultPadding * 0.75),
                        decoration: const BoxDecoration(
                          color: callToAction,
                          borderRadius: BorderRadius.all(
                            Radius.circular(10),
                          ),
                        ),
                        child: const Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: defaultPadding / 2),
                          child: Text(
                            "Buy Now",
                            style: TextStyle(),
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        const SizedBox(height: defaultPadding),
        FeedGridView(height: height, width: width),
      ],
    );
  }
}
