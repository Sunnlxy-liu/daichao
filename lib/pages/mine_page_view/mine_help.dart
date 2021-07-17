import 'package:daichao/pages/mine_page_view/mine_feedback_speed.dart';
import 'package:daichao/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:daichao/pages/mine_page_view/mine_feedback.dart';
import 'package:daichao/utils/colors_utils.dart';
import 'package:daichao/utils/navigator_utils.dart';
import 'package:flutter_screenutil/screen_util.dart';

class MineHelpPage extends StatefulWidget {
  @override
  _MineHelpPageState createState() => _MineHelpPageState();
}

class _MineHelpPageState extends State<MineHelpPage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorsUtils.pageBcakgroundColor,
      appBar: AppBar(
        elevation: 0,
        title: Text(
          "帮助中心",
          style: TextStyle(color: Colors.white, fontSize: ScreenUtil().setSp(18)),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            _topBar(context),
            SizedBox(
              height: 18,
            ),
            _articleListWgt(context, "热门问题"),
            _articleListWgt(context, "常见问题"),
          ],
        ),
      ),
    );
  }

  Widget _topBar(context) {
    return Container(
      height: 118 + MediaQuery.of(context).padding.top + 15,
      child: Stack(
        children: [
          Container(
            height: 118,
            decoration: BoxDecoration(
              color: Theme.of(context).accentColor,
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(20),
                bottomRight: Radius.circular(20),
              ),
            ),
            child: Container(
              margin: EdgeInsets.only(top: 18),
              alignment: Alignment.topCenter,
              child: Text(
                "Hi,很高兴为您服务~",
                style: TextStyle(fontSize: 16, color: Colors.white),
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              height: 93,
              margin: EdgeInsets.only(left: 15, right: 15),
              child: Container(
                padding: EdgeInsets.only(left: 12, right: 12, top: 22, bottom: 12),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.all(
                    Radius.circular(10),
                  ),
                  // boxShadow: [
                  //   BoxShadow(
                  //     color: Color(0xFFF2F2F2),
                  //     offset: Offset(0.0, 1.5), //阴影xy轴偏移量
                  //     blurRadius: 0.5, //阴影模糊程度
                  //     spreadRadius: 0.5, //阴影扩散程度
                  //   ),
                  // ],
                ),
                child: Column(
                  children: [
                    Row(
                      children: [
                        Expanded(
                          child: InkWell(
                            child: Column(
                              children: [
                                Container(
                                  width: 48,
                                  height: 35,
                                  alignment: Alignment.center,
                                  child: Image.asset(
                                    'assets/images/mine_account_bind.png',
                                    fit: BoxFit.cover,
                                  ),
                                ),
                                Container(
                                  alignment: Alignment.center,
                                  child: Text(
                                    "账号绑定",
                                    style: TextStyle(fontSize: 12, color: ColorsUtils.cl33),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        Expanded(
                          child: InkWell(
                            onTap: () {
                              NavigatorUtils.pushPage(targPage: MineFeedbackPage());
                            },
                            child: Column(
                              children: [
                                Container(
                                  width: 48,
                                  height: 35,
                                  alignment: Alignment.center,
                                  child: Image.asset(
                                    Utils.getImage('mine_suggets_feedback.png'),
                                    fit: BoxFit.cover,
                                  ),
                                ),
                                Container(
                                  alignment: Alignment.center,
                                  child: Text(
                                    "意见反馈",
                                    style: TextStyle(fontSize: 12, color: ColorsUtils.cl33),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        Expanded(
                          child: InkWell(
                            onTap: () {
                              NavigatorUtils.pushPage(targPage: MineFeedbackSpeedPage());
                            },
                            child: Column(
                              children: [
                                Container(
                                  width: 48,
                                  height: 35,
                                  alignment: Alignment.center,
                                  child: Image.asset(
                                    Utils.getImage('mine_feedback_speed.png'),
                                    fit: BoxFit.cover,
                                  ),
                                ),
                                Container(
                                  alignment: Alignment.center,
                                  child: Text(
                                    "反馈进度",
                                    style: TextStyle(fontSize: 12, color: ColorsUtils.cl33),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _articleListWgt(context, String title) {
    return Container(
        color: Colors.white,
        margin: EdgeInsets.only(bottom: 10),
        padding: EdgeInsets.only(left: 18, right: 18, bottom: 12),
        child: Column(
          children: [
            Container(
              height: 55,
              alignment: Alignment.centerLeft,
              child: Text(
                title,
                style: TextStyle(
                  fontSize: 16,
                  color: ColorsUtils.cl12,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            ListView.builder(
              padding: EdgeInsets.all(0),
              shrinkWrap: true, //范围内进行包裹（内容多高ListView就多高）
              physics: NeverScrollableScrollPhysics(),
              itemCount: 6,
              itemBuilder: (context, index) {
                return _articleItems();
              },
            ),
          ],
        ));
    ;
  }

  Widget _articleItems() {
    return InkWell(
      onTap: () {
        // NavigatorUtils.pushPage(
        //   targPage: menu[2],
        // );
      },
      child: Container(
        height: 32,
        alignment: Alignment.centerLeft,
        color: Colors.white,
        child: Text(
          "如何更新个人信息?",
          style: TextStyle(fontSize: 14, color: ColorsUtils.cl66),
        ),
      ),
    );
  }
}
