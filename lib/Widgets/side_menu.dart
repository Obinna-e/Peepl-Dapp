import 'package:flutter/material.dart';
import 'package:nftapp/constants/style.dart';

class SideMenu extends StatelessWidget {
  const SideMenu({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            DrawerHeader(
              child: Image.asset(
                "assets/icons/penguin.png",
                height: 80,
                width: 80,
              ),
            ),
            DrawerListTile(
              icon: Icons.dashboard_outlined,
              press: () {},
            ),
            DrawerListTile(
              press: () {},
              icon: Icons.shopping_cart_outlined,
            ),
            DrawerListTile(
              icon: Icons.account_balance_wallet_outlined,
              press: () {},
            ),
            DrawerListTile(
              icon: Icons.show_chart_outlined,
              press: () {},
            ),
            DrawerListTile(
              icon: Icons.access_time_outlined,
              press: () {},
            ),
            DrawerListTile(
              icon: Icons.settings_outlined,
              press: () {},
            ),
          ],
        ),
      ),
    );
  }
}

class DrawerListTile extends StatelessWidget {
  const DrawerListTile({
    Key? key,
    required this.icon,
    required this.press,
  }) : super(key: key);

  final IconData icon;
  final VoidCallback press;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: IconButton(
        onPressed: press,
        icon: Icon(icon),
        color: Colors.white70,
        focusColor: callToAction,
        hoverColor: callToAction,
      ),
    );
  }
}
