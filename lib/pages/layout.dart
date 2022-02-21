import 'package:flutter/material.dart';
import 'package:nftapp/Widgets/large_screen.dart';
import 'package:nftapp/Widgets/small_screen.dart';
import 'package:nftapp/Widgets/top_nav.dart';
import 'package:nftapp/helpers/responsiveness.dart';

class SiteLayout extends StatelessWidget {
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        // appBar: topNavigationBar(context, scaffoldKey),
        body: ResponsiveWidget(
      largeScreen: LargeScreen(),
      smallScreen: SmallScreen(),
    ));
  }
}
