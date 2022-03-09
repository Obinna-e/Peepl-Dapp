import 'package:flutter/material.dart';
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
    double _width = MediaQuery.of(context).size.width;
    return Container(
      color: containerColor,
      child: ListView(
        children: [
          Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              SizedBox(
                height: 40,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    width: 55,
                    height: 60,
                    decoration: const BoxDecoration(
                      image: const DecorationImage(
                          image: AssetImage(
                            "assets/icons/penguin.png",
                          ),
                          fit: BoxFit.cover),
                    ),
                  ),
                  SizedBox(
                    width: _width / 48,
                  ),
                ],
              ),
            ],
          ),
          SizedBox(
            height: 40,
          ),
          Column(
            mainAxisSize: MainAxisSize.min,
            children: sideMenuItems
                .map((item) => SideMenuItem(
                      itemName: item.name,
                      onTap: () {
                        //Remove later because no logout function
                        if (item.route == SettingsPageRoute) {
                          menuController
                              .changeActiveItemTo(OverViewPageDisplayName);
                          Get.offAllNamed(SettingsPageRoute);
                        }
                        if (!menuController.isActive(item.name)) {
                          menuController.changeActiveItemTo(item.name);
                          if (ResponsiveWidget.isSmallScreen(context))
                            Get.back();
                          navigationController.navigateTo(item.route);
                        }
                      },
                    ))
                .toList(),
          )
        ],
      ),
    );
  }
}
