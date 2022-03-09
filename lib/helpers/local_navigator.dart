import 'package:flutter/material.dart';
import 'package:nftapp/constants/controllers.dart';
import 'package:nftapp/routing/router.dart';
import 'package:nftapp/routing/routes.dart';

Navigator localNavigator() => Navigator(
      key: navigationController.navigationKey,
      initialRoute: OverViewPageRoute,
      onGenerateRoute: generateRoute,
    );
