const RootRoute = "/";

const overviewPageDisplayName = "Overview";
const overviewPageRoute = "/overview";

const purchasePageDisplayName = "Purchase";
const purchasePageRoute = "/purchase";

const walletPageDisplayName = "Wallet";
const walletPageRoute = "/wallet";

const chartingPageDisplayName = "Chart";
const chartingPageRoute = "/chart";

const vestingPageDisplayName = "Vesting";
const vestingPageRoute = "/vesting";

const settingsPageDisplayName = "Settings";
const settingsPageRoute = "/settings";

class MenuItem {
  final String name;
  final String route;

  MenuItem(this.name, this.route);
}

List<MenuItem> sideMenuItems = [
  MenuItem(overviewPageDisplayName, overviewPageRoute),
  MenuItem(purchasePageDisplayName, purchasePageRoute),
  MenuItem(walletPageDisplayName, walletPageRoute),
  MenuItem(chartingPageDisplayName, chartingPageRoute),
  MenuItem(vestingPageDisplayName, vestingPageRoute),
  MenuItem(settingsPageDisplayName, settingsPageRoute),
];
