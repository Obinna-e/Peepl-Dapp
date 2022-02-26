import 'package:flutter/material.dart';
import 'package:like_button/like_button.dart';
import 'package:nftapp/constants/style.dart';
import 'package:nftapp/models/dummy_feed.dart';

class FeedGridView extends StatelessWidget {
  const FeedGridView({
    Key? key,
    required this.height,
    required this.width,
  }) : super(key: key);

  final double height;
  final double width;

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
        shrinkWrap: true,
        itemCount: demoListedItem.length,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
          crossAxisSpacing: defaultPadding,
          mainAxisExtent: height * 0.55,
        ),
        itemBuilder: (context, index) => Card(
              elevation: 0,
              child: Container(
                color: containerColor,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Expanded(
                      flex: 2,
                      child: Container(
                        decoration: BoxDecoration(
                          image: DecorationImage(
                              image: NetworkImage(demoListedItem[index].svgSrc),
                              fit: BoxFit.fitWidth),
                        ),
                        // child: Image.network(

                        //   fit: BoxFit.fill,
                        // ),
                      ),
                    ),
                    Expanded(
                      flex: 2,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(defaultPadding),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Text(demoListedItem[index].title),
                                const Spacer(),
                                const LikeButton(),
                                const SizedBox(
                                  width: 8,
                                ),
                                Text(demoListedItem[index].likes),
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(defaultPadding),
                            child: Row(
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    const Padding(
                                      padding: EdgeInsets.only(
                                        bottom: 8.0,
                                      ),
                                      child: Text("Current Bid"),
                                    ),
                                    Text(
                                      "${demoListedItem[index].currentBid} ETH",
                                      style: const TextStyle(
                                        color: callToAction,
                                      ),
                                    ),
                                  ],
                                ),
                                const Spacer(),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    const Padding(
                                      padding: EdgeInsets.only(
                                        bottom: 8.0,
                                      ),
                                      child: Text("Ending In"),
                                    ),
                                    Text(
                                      "${demoListedItem[index].endingTime}",
                                      style: const TextStyle(
                                        color: callToAction,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(defaultPadding),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                InkWell(
                                  onTap: () {},
                                  child: Container(
                                    width: width * 0.09,
                                    padding: const EdgeInsets.all(
                                        defaultPadding * 0.75),
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
                                        "Place A Bid",
                                        style: TextStyle(),
                                        textAlign: TextAlign.center,
                                      ),
                                    ),
                                  ),
                                ),
                                InkWell(
                                  onTap: () {},
                                  child: Container(
                                    width: width * 0.09,
                                    padding: const EdgeInsets.all(
                                        defaultPadding * 0.75),
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
                                        "History",
                                        style: TextStyle(),
                                        textAlign: TextAlign.center,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ));
  }
}
