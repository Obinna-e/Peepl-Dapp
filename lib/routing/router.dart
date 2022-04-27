import 'package:flutter/material.dart';

import 'package:nftapp/pages/dashboard/dashboard_screen.dart';

import 'package:nftapp/routing/routes.dart';

Route<dynamic> generateRoute(RouteSettings settings) {
  switch (settings.name) {
    case overviewPageRoute:
      return _getPageRoute(DashboardScreen());

    default:
      return _getPageRoute(DashboardScreen());
  }
}

PageRoute _getPageRoute(Widget child) {
  return MaterialPageRoute(builder: (context) => child);
}
