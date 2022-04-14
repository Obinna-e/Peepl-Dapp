import 'package:flutter/material.dart';
import 'package:nftapp/pages/charts/chart.dart';
import 'package:nftapp/pages/dashboard/dashboard_screen.dart';
import 'package:nftapp/pages/purchase/purchase.dart';
import 'package:nftapp/pages/settings/setting.dart';

import 'package:nftapp/pages/wallet/wallets.dart';
import 'package:nftapp/routing/routes.dart';

Route<dynamic> generateRoute(RouteSettings settings) {
  switch (settings.name) {
    case overviewPageRoute:
      return _getPageRoute(DashboardScreen());
    case purchasePageRoute:
      return _getPageRoute(PurchasePage());
    case walletPageRoute:
      return _getPageRoute(WalletPage());
    case chartingPageRoute:
      return _getPageRoute(ChartsPage());
    case settingsPageRoute:
      return _getPageRoute(SettingsPage());
    default:
      return _getPageRoute(DashboardScreen());
  }
}

PageRoute _getPageRoute(Widget child) {
  return MaterialPageRoute(builder: (context) => child);
}
