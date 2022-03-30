import 'package:flutter/material.dart';
import 'package:nftapp/Widgets/large_screen.dart';
import 'package:nftapp/Widgets/side_menu.dart';
import 'package:nftapp/Widgets/small_screen.dart';
import 'package:nftapp/Widgets/top_nav.dart';
import 'package:nftapp/helpers/responsiveness.dart';
import 'package:nftapp/pages/vestingPage/vestingPage.dart';

class SiteLayout extends StatelessWidget {
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        key: scaffoldKey,
        appBar: ResponsiveWidget.isSmallScreen(context)
            ? topNavigationBar(context, scaffoldKey)
            : null,
        drawer: ResponsiveWidget.isSmallScreen(context)
            ? Container(width: 100, child: Drawer(child: SideMenu()))
            : null,
        body: const ResponsiveWidget(
          largeScreen: LargeScreen(),
          smallScreen: SmallScreen(),
        ));
  }
}
