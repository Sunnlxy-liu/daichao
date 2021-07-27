import 'package:flutter/material.dart';
import 'package:daichao/pages/mine_page_view/address_list.dart';
import 'package:daichao/pages/mine_page_view/mine_help.dart';
import 'package:daichao/utils/colors_utils.dart';
import 'package:daichao/utils/navigator_utils.dart';
import 'package:daichao/widgets/select_theme_color_wgt.dart';

class SettingPage extends StatefulWidget {
  const SettingPage({Key key}) : super(key: key);

  @override
  _SettingPageState createState() => _SettingPageState();
}

class _SettingPageState extends State<SettingPage> {
  GlobalKey<FormState> addressListKey = new GlobalKey<FormState>();

  Map<int, List> menus = {
    0: [
      '收货地址管理',
    ],
    1: [
      '检查版本',
    ],
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "设置",
          style: TextStyle(
            fontSize: 18,
            color: ColorsUtils.cl12,
          ),
        ),
        leading: BackButton(color: ColorsUtils.cl12),
        brightness: Brightness.light,
        backgroundColor: Colors.white,
      ),
      backgroundColor: ColorsUtils.pageBcakgroundColor,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: 7,
            ),
            InkWell(
              onTap: () {
                NavigatorUtils.pushPage(targPage: MineHelpPage());
              },
              child: _settingItem("帮助中心"),
            ),
            InkWell(
              onTap: () {
                NavigatorUtils.pushPage(targPage: AddressListPage());
              },
              child: _settingItem("收货地址管理"),
            ),
            InkWell(
              onTap: () {
                // VersionUpdateUtils.checkVersion(needLoading: true);
              },
              child: _settingItem("检查版本"),
            ),
            Container(
              color: Colors.white,
              child: Container(
                margin: EdgeInsets.only(left: 15, right: 15),
                decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border(
                    bottom: BorderSide(
                      width: 0.5,
                      color: Color(0xFFE6E6E6),
                    ),
                  ),
                ),
                child: SelectThemeColorWgt(),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _settingItem(String name) {
    return Container(
      color: Colors.white,
      child: Container(
        margin: EdgeInsets.only(left: 15, right: 15),
        height: 55,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border(
            bottom: BorderSide(
              width: 0.5,
              color: Color(0xFFE6E6E6),
            ),
          ),
        ),
        child: Row(
          children: [
            Text(
              name,
              style: TextStyle(fontSize: 15, color: Color(0xFF0d162b)),
            ),
            Spacer(),
            SizedBox(width: 3),
            Icon(
              IconData(0xe638, fontFamily: "Appicon"),
              color: Color(0xFF878792),
              size: 15,
            ),
          ],
        ),
      ),
    );
  }
}
