import 'dart:io';

import 'package:daichao/utils/utils.dart';
import 'package:flutter/material.dart';

class WelcomePage extends StatelessWidget {
  const WelcomePage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.only(
            top: MediaQuery.of(context).padding.top,
            left: 15,
            right: 15,
          ),
          alignment: Alignment.center,
          child: Column(
            children: [
              _welcomeWordsWgt(),
              _selectLanguageWgt(),
            ],
          ),
        ),
      ),
    );
  }

  // 欢迎页问好语
  Widget _welcomeWordsWgt() {
    return Container(
      alignment: Alignment.centerLeft,
      height: 150,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            padding: EdgeInsets.only(
              left: 15,
              right: 15,
            ),
            alignment: Alignment.centerLeft,
            child: Text(
              "您好！",
              style: TextStyle(
                fontSize: 26,
                color: Color(0xFF333333),
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Container(
            padding: EdgeInsets.only(
              left: 15,
              right: 15,
            ),
            alignment: Alignment.centerLeft,
            child: Text(
              "欢迎来到贷款超市",
              style: TextStyle(
                fontSize: 26,
                color: Color(0xFF333333),
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
    );
  }

  //欢迎页 选择语言
  Widget _selectLanguageWgt() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Container(
          alignment: Alignment.centerLeft,
          padding: EdgeInsets.only(left: 15),
          child: Text(
            "选择语言",
            style: TextStyle(fontSize: 14, color: Color(0xFF999999)),
          ),
        ),
        Container(
          child: ScrollConfiguration(
            behavior: MyBehavior(), //自定义behavior
            child: ListView(
              shrinkWrap: true,
              children: [
                _languageCountryItem('中文', 'welcome_cn.png'),
                _languageCountryItem('日本语', 'welcome_jp.png'),
                _languageCountryItem('English', 'welcome_en.png'),
                _languageCountryItem('Francais', 'welcome_fr.png'),
              ],
            ), //你的滚动布局组件
          ),
        ),
      ],
    );
  }

  Widget _languageCountryItem(String language, String flag) {
    return Container(
      height: 80,
      alignment: Alignment.centerLeft,
      padding: EdgeInsets.only(top: 20),
      child: Row(
        children: [
          Expanded(
            flex: 1,
            child: Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(Utils.getImage(flag)),
                  // fit: BoxFit.fill,
                ),
              ),
              alignment: Alignment.center,
              height: 40,
              width: 40,
            ),
          ),
          Expanded(
            flex: 4,
            child: Container(
              height: 60,
              alignment: Alignment.centerLeft,
              decoration: BoxDecoration(
                border: Border(bottom: BorderSide(width: 0.5, color: Color(0xFFdddddd))),
              ),
              child: Row(
                children: [
                  Text(
                    language,
                    style: TextStyle(fontSize: 16, color: Color(0xFF333333)),
                  ),
                  Spacer(),
                  Icon(
                    Icons.arrow_forward_ios,
                    size: 20,
                    color: Color(0xFF999999),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}

class MyBehavior extends ScrollBehavior {
  @override
  Widget buildViewportChrome(BuildContext context, Widget child, AxisDirection axisDirection) {
    if (Platform.isAndroid || Platform.isFuchsia) {
      return child;
    } else {
      return super.buildViewportChrome(context, child, axisDirection);
    }
  }
}
