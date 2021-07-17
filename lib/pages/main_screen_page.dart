import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:daichao/data/data.dart';
import 'package:daichao/pages/loan_page_view/loan_page.dart';
import 'package:daichao/pages/loot_page_view/loot_page.dart';
import 'package:daichao/pages/main_page_view/home_page.dart';
import 'package:daichao/utils/toast_utils.dart';
import 'package:daichao/widgets/main_menus_wgt.dart';

import 'mine_page_view/mine_index_page.dart';

class MainScreenPage extends StatelessWidget {
  final List<TabMenu> tabs = [
    // 各个页面的状态保存已在封装类中处理，此处无需再担心，具体可看上面的组件定义。
    TabMenu(icon: IconData(0xe60b, fontFamily: "Appicon"), text: "首页", view: HomePage()),
    TabMenu(icon: IconData(0xe62a, fontFamily: "Appicon"), text: "贷款", view: LoanPage()),
    TabMenu(icon: IconData(0xe608, fontFamily: "Appicon"), text: "夺宝", view: LootPage()),
    TabMenu(icon: IconData(0xe60e, fontFamily: "Appicon"), text: "我的", view: MineIndexPage()),
  ];
  DateTime lastTime;
  @override
  Widget build(BuildContext context) {
    return Material(
      child: WillPopScope(
        onWillPop: () async {
          // 点击返回键的操作
          if (lastTime == null || DateTime.now().difference(lastTime) > Duration(seconds: 2)) {
            lastTime = DateTime.now();
            ToastUtils.showToastMsg('再按一次返回键将退出应用');
            return false;
          } else {
            lastTime = DateTime.now();
            // 退出app
            await SystemChannels.platform.invokeMethod('SystemNavigator.pop');
            return true;
          }
        },
        child: MainMenusWgt(
          tabs: tabs,
          isScrollable: false,
          key: mainMenusKey,
        ),
      ),
    );
  }
}
