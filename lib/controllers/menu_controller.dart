import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nftapp/constants/style.dart';
import 'package:nftapp/routing/routes.dart';

class MenuController extends GetxController {
  static MenuController instance = Get.find();

  var activeItem = overviewPageDisplayName.obs;
  var hoverItem = "".obs;

  changeActiveItemTo(String itemName) {
    activeItem.value = itemName;
  }

  onHover(String itemName) {
    if (!isActive(itemName)) hoverItem.value = itemName;
  }

  isActive(String itemName) => activeItem.value == itemName;

  isHovering(String itemName) => hoverItem.value == itemName;

  Widget returnIconFor(String itemName) {
    switch (itemName) {
      case overviewPageDisplayName:
        return _customIcon(Icons.dashboard_outlined, itemName);
      case purchasePageDisplayName:
        return _customIcon(Icons.shopping_cart_outlined, itemName);
      case walletPageDisplayName:
        return _customIcon(Icons.account_balance_wallet_outlined, itemName);
      case chartingPageDisplayName:
        return _customIcon(Icons.show_chart_outlined, itemName);
      case timerPageDisplayName:
        return _customIcon(Icons.access_time_outlined, itemName);
      case settingsPageDisplayName:
        return _customIcon(Icons.settings_outlined, itemName);
      default:
        return _customIcon(Icons.settings_outlined, itemName);
    }
  }

  Widget _customIcon(IconData icon, String itemName) {
    if (isActive(itemName))
      return Icon(
        icon,
        size: 22,
        color: callToAction,
      );
    return Icon(
      icon,
      color: isHovering(itemName) ? callToAction : lightGrey,
    );
  }
}
