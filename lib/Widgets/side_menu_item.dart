import 'package:flutter/material.dart';
import 'package:nftapp/Widgets/horizontal_menu_item.dart';
import 'package:nftapp/Widgets/vertical_menu_item.dart';
import 'package:nftapp/helpers/responsiveness.dart';

class SideMenuItem extends StatelessWidget {
  final String itemName;
  final Function()? onTap;

  const SideMenuItem({Key? key, required this.itemName, this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (ResponsiveWidget.isCustomScreen(context)) {
      return VerticalMenuItem(
        itemName: itemName,
        onTap: onTap,
      );
    }

    return HorizontalMenuItem(
      itemName: itemName,
      onTap: onTap,
    );
  }
}
