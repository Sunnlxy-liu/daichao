import 'package:daichao/pages/mine_page_view/mine_sign.dart';
import 'package:daichao/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:daichao/pages/mine_page_view/recharge_record.dart';
import 'package:daichao/utils/colors_utils.dart';
import 'package:daichao/utils/navigator_utils.dart';
import 'package:flutter_screenutil/screen_util.dart';

class MineFeedbackSpeedPage extends StatefulWidget {
  @override
  _MineFeedbackSpeedPageState createState() => _MineFeedbackSpeedPageState();
}

class _MineFeedbackSpeedPageState extends State<MineFeedbackSpeedPage> {
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
        centerTitle: true,
        elevation: 0,
        title: Text(
          "反馈进度",
          style: TextStyle(color: Colors.white, fontSize: ScreenUtil().setSp(18)),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              // height: 84 + MediaQuery.of(context).padding.top + 15,
              child: Stack(
                children: [
                  Container(
                    height: 98,
                    padding: EdgeInsets.only(top: 40),
                    decoration: BoxDecoration(
                      color: Theme.of(context).accentColor,
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(20),
                        bottomRight: Radius.circular(20),
                      ),
                    ),
                  ),
                  Align(
                    alignment: Alignment.topCenter,
                    child: Container(
                      margin: EdgeInsets.only(left: 15, right: 15, top: 15),
                      child: Container(
                        padding: EdgeInsets.only(left: 22, right: 22, top: 22, bottom: 12),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.all(
                            Radius.circular(10),
                          ),
                        ),
                        child: Column(
                          children: [
                            _speedItem(),
                            _speedItem(),
                            _speedItem(),
                            _speedItem(),
                            _speedItem(),
                            _speedItem(),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _speedItem() {
    return Container(
      height: 55,
      child: Row(
        children: [
          Container(
            width: 16,
            height: 55,
            padding: EdgeInsets.only(top: 3),
            child: Column(
              children: [
                Container(
                  width: 15,
                  height: 15,
                  decoration: BoxDecoration(color: Color(0xFFBEBEBE), shape: BoxShape.circle),
                ),
                SizedBox(height: 1),
                Container(
                  width: 1,
                  height: 36,
                  color: ColorUtils.lintSplitColor,
                ),
              ],
            ),
          ),
          SizedBox(width: 10),
          Expanded(
            child: Column(
              children: [
                Container(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "2021-06-17 18:58:01",
                    style: TextStyle(fontSize: 14, color: ColorUtils.cl99),
                  ),
                ),
                Container(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "提交成功",
                    style: TextStyle(fontSize: 14, color: ColorUtils.cl99),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
