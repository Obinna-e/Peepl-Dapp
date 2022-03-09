import 'package:flutter/material.dart';
import 'package:nftapp/pages/charts/chart.dart';
import 'package:nftapp/pages/dashboard/dashboard_screen.dart';
import 'package:nftapp/pages/purchase/purchase.dart';
import 'package:nftapp/pages/settings/setting.dart';
import 'package:nftapp/pages/vestingPage/vestingPage.dart';
import 'package:nftapp/pages/wallet/wallets.dart';
import 'package:nftapp/routing/routes.dart';

Route<dynamic> generateRoute(RouteSettings settings) {
  switch (settings.name) {
    case OverViewPageRoute:
      return _getPageRoute(DashboardScreen());
    case PurchasePageRoute:
      return _getPageRoute(PurchasePage());
    case WalletPageRoute:
      return _getPageRoute(WalletPage());
    case ChartingPageRoute:
      return _getPageRoute(ChartsPage());
    case TimerPageRoute:
      return _getPageRoute(VestingPage());
    case SettingsPageRoute:
      return _getPageRoute(SettingsPage());
    default:
      return _getPageRoute(DashboardScreen());
  }
}

PageRoute _getPageRoute(Widget child) {
  return MaterialPageRoute(builder: (context) => child);
}
