import 'package:daichao/data/repository/user_repository.dart';
import 'package:flutter/material.dart';
import 'package:daichao/pages/mine_page_view/mine_payment.dart';
import 'package:daichao/pages/mine_page_view/recharge_record.dart';
import 'package:daichao/utils/colors_utils.dart';
import 'package:daichao/utils/navigator_utils.dart';
import 'package:daichao/utils/utils.dart';
import 'package:flutter_screenutil/screen_util.dart';

class MineIntegralPage extends StatefulWidget {
  @override
  _MineIntegralPageState createState() => _MineIntegralPageState();
}

class _MineIntegralPageState extends State<MineIntegralPage> {
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
          "积分",
          style: TextStyle(color: Colors.white, fontSize: ScreenUtil().setSp(18)),
        ),
        centerTitle: true,
        actions: [
          InkWell(
            onTap: () {},
            child: Container(
              alignment: Alignment.center,
              margin: EdgeInsets.only(right: 24),
              child: Text(
                "账单",
                style: TextStyle(fontSize: ScreenUtil().setSp(14), color: Colors.white),
              ),
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            _topBar(context),
            SizedBox(
              height: 15,
            ),
            _integralMenus(context),
          ],
        ),
      ),
    );
  }

  Widget _topBar(context) {
    return Container(
      height: 84 + MediaQuery.of(context).padding.top + 15,
      child: Stack(
        children: [
          Container(
            height: 98,
            decoration: BoxDecoration(
              color: Theme.of(context).accentColor,
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(20),
                bottomRight: Radius.circular(20),
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              height: 108,
              margin: EdgeInsets.only(left: 15, right: 15),
              child: Container(
                padding: EdgeInsets.only(left: 22, right: 22, top: 22, bottom: 12),
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
                        Text(
                          "我的积分",
                          style: TextStyle(
                            fontSize: 14,
                            color: ColorUtils.cl33,
                          ),
                        )
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          UserRespository().userModel.userInfo.score.toString(),
                          style: TextStyle(
                            fontSize: 35,
                            color: Color(0xFFff8900),
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        RaisedButton(
                          // key: ,
                          color: Color(0xFFff8900),
                          highlightColor: Color(0xFFff8900),
                          colorBrightness: Brightness.dark,
                          splashColor: Color(0xFFff8900),
                          child: Text(
                            "充值",
                            style: TextStyle(fontSize: 14),
                          ),
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
                          onPressed: () {
                            NavigatorUtils.pushPage(
                              targPage: MinePaymentPage(),
                            );
                          },
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _integralMenus(context) {
    Map<int, List> menus = {
      0: ['mine_recorde', '充值记录', RechargeRecordPage()],
      1: ['mine_integral', '消费记录', RechargeRecordPage()],
      2: ['mine_task', '积分任务', RechargeRecordPage()],
    };

    return Column(
      children: [
        ListView.builder(
          padding: EdgeInsets.all(0),
          shrinkWrap: true, //范围内进行包裹（内容多高ListView就多高）
          physics: NeverScrollableScrollPhysics(),
          itemCount: menus.length,
          itemBuilder: (context, index) {
            return _integralItems(index, menus[index], menus.length);
          },
        ),
      ],
    );
  }

  Widget _integralItems(index, List menu, int itemTotal) {
    return InkWell(
      onTap: () {
        NavigatorUtils.pushPage(
          targPage: menu[2],
        );
      },
      child: Container(
        padding: EdgeInsets.only(left: 15, right: 15, top: 15),
        color: Colors.white,
        child: Container(
          padding: EdgeInsets.only(bottom: 15),
          decoration: BoxDecoration(
            border: Border(
              bottom: BorderSide(
                width: 0.5,
                color: index + 1 == itemTotal ? Colors.white : Color(0xFFDFDFDF),
              ),
            ),
          ),
          margin: EdgeInsets.only(left: 12, right: 12),
          child: Row(
            children: [
              Text(menu[1]),
              Spacer(),
              Icon(
                IconData(0xe638, fontFamily: "Appicon"),
                color: ColorUtils.cl99,
                size: 18,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
