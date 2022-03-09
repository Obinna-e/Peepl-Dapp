const RootRoute = "/";

const OverViewPageDisplayName = "Overview";
const OverViewPageRoute = "/overview";

const PurchasePageDisplayName = "Purchase";
const PurchasePageRoute = "/purchase";

const WalletPageDisplayName = "Wallet";
const WalletPageRoute = "/wallet";

const ChartingPageDisplayName = "Chart";
const ChartingPageRoute = "/chart";

const TimerPageDisplayName = "Timer";
const TimerPageRoute = "/timer";

const SettingsPageDisplayName = "Settings";
const SettingsPageRoute = "/settings";

class MenuItem {
  final String name;
  final String route;

  MenuItem(this.name, this.route);
}

List<MenuItem> sideMenuItems = [
  MenuItem(OverViewPageDisplayName, OverViewPageRoute),
  MenuItem(PurchasePageDisplayName, PurchasePageRoute),
  MenuItem(WalletPageDisplayName, WalletPageRoute),
  MenuItem(ChartingPageDisplayName, ChartingPageRoute),
  MenuItem(TimerPageDisplayName, TimerPageRoute),
  MenuItem(SettingsPageDisplayName, SettingsPageRoute),
];
