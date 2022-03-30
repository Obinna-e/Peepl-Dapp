import 'package:flutter/material.dart';
import 'package:nftapp/Widgets/side_menu.dart';
import 'package:nftapp/helpers/local_navigator.dart';
import 'package:nftapp/pages/dashboard/dashboard_screen.dart';
import '../constants/style.dart';

class LargeScreen extends StatelessWidget {
  const LargeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const SideMenu(),
          Expanded(
            child: localNavigator(),
          ),
        ],
      ),
    );
  }
}
