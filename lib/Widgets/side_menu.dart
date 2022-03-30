import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:nftapp/Widgets/horizontal_menu_item.dart';
import 'package:nftapp/Widgets/side_menu_item.dart';
import 'package:nftapp/Widgets/vertical_menu_item.dart';
import 'package:nftapp/constants/controllers.dart';
import 'package:nftapp/constants/style.dart';
import 'package:nftapp/helpers/responsiveness.dart';
import 'package:nftapp/pages/settings/setting.dart';
import 'package:nftapp/pages/vestingPage/vestingPage.dart';
import 'package:nftapp/routing/routes.dart';

class SideMenu extends StatelessWidget {
  const SideMenu({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(35),
          color: containerColor,
          boxShadow: const [BoxShadow()]),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
              Padding(
                padding: const EdgeInsets.symmetric(
                    horizontal: defaultPadding, vertical: 40),
                child: SizedBox(
                  width: 70,
                  height: 70,
                  child: SvgPicture.asset(
                    "assets/images/peepl_logo.svg",
                  ),
                ),
              ),
            ] +
            sideMenuItems
                .map(
                  (item) => SideMenuItem(
                    itemName: item.name,
                    onTap: () {
                      //TODO:Remove later because no logout function
                      if (item.route == settingsPageRoute) {
                        menuController
                            .changeActiveItemTo(overviewPageDisplayName);
                        Get.offAllNamed(settingsPageRoute);
                      }
                      if (!menuController.isActive(item.name)) {
                        menuController.changeActiveItemTo(item.name);
                        if (ResponsiveWidget.isSmallScreen(context)) Get.back();
                        navigationController.navigateTo(item.route);
                      }
                    },
                  ),
                )
                .toList() +
            [
              const SizedBox(
                height: 30,
              )
            ],
      ),
    );
  }
}
