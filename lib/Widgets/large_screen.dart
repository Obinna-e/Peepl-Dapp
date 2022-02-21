import 'package:flutter/material.dart';
import 'package:nftapp/Widgets/side_menu.dart';
import 'package:nftapp/pages/dashboard/dashboard_screen.dart';
import '../constants/style.dart';

class LargeScreen extends StatelessWidget {
  const LargeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ConstrainedBox(
            constraints: const BoxConstraints(minWidth: 50, maxWidth: 100),
            child: SideMenu(),
          ),
          Expanded(
            child: DashboardScreen(),
          ),
        ],
      ),
    );
  }
}
