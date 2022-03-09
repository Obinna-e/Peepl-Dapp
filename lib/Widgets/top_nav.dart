import 'package:flutter/material.dart';
import 'package:nftapp/Widgets/customText.dart';
import 'package:nftapp/Widgets/header.dart';
import 'package:nftapp/constants/style.dart';
import 'package:nftapp/helpers/responsiveness.dart';

AppBar topNavigationBar(BuildContext context, GlobalKey<ScaffoldState> key) =>
    AppBar(
      leading: IconButton(
        onPressed: () {
          key.currentState?.openDrawer();
        },
        icon: const Icon(Icons.menu),
      ),
      title: Row(children: [
        const Visibility(
          child: CustomText(
            text: "Normi",
            color: lightGrey,
            size: 20,
            weight: FontWeight.bold,
          ),
        ),
        Expanded(
          child: Container(),
        ),
        IconButton(
          onPressed: () {},
          icon: Icon(
            Icons.settings,
            color: Colors.white,
          ),
        ),
        Stack(
          children: [
            IconButton(
              onPressed: () {},
              icon: Icon(Icons.notifications),
            ),
            Positioned(
              top: 7,
              right: 7,
              child: Container(
                width: 12,
                height: 12,
                padding: EdgeInsets.all(4),
                decoration: BoxDecoration(
                    color: callToAction,
                    borderRadius: BorderRadius.circular(30),
                    border: Border.all(color: Colors.white, width: 2)),
              ),
            ),
          ],
        ),
        Container(
          width: 1,
          height: 22,
          color: lightGrey,
        ),
        SizedBox(
          width: 24,
        ),
        CustomText(
          text: "Connect Wallet",
          color: lightGrey,
        ),
        SizedBox(
          width: 16,
        ),
        Container(
          decoration: BoxDecoration(color: Colors.white),
        )
      ]),
      elevation: 0,
      backgroundColor: Colors.blue,
    );
