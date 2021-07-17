import 'package:daichao/pages/mine_page_view/mine_sign.dart';
import 'package:flutter/material.dart';
import 'package:daichao/pages/mine_page_view/recharge_record.dart';
import 'package:daichao/utils/colors_utils.dart';
import 'package:daichao/utils/navigator_utils.dart';
import 'package:daichao/utils/utils.dart';
import 'package:flutter_screenutil/screen_util.dart';

class MineTaskPage extends StatefulWidget {
  @override
  _MineTaskPageState createState() => _MineTaskPageState();
}

class _MineTaskPageState extends State<MineTaskPage> {
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
          "任务",
          style: TextStyle(color: Colors.white, fontSize: ScreenUtil().setSp(18)),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            _topBar(context),
            SizedBox(
              height: 15,
            ),
            _integralMenus(context),
            Container(
              height: 40,
              alignment: Alignment.center,
              child: Text(
                "——  更多活动敬请期待  ——",
                style: TextStyle(fontSize: 11, color: ColorUtils.cl99),
              ),
            ),
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
              height: 102,
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
                child: Row(
                  children: [
                    Expanded(
                      child: Column(
                        children: [
                          Container(
                            width: 30,
                            height: 30,
                            child: Image.asset(
                              Utils.getImage('task_loot.jpg'),
                              fit: BoxFit.cover,
                            ),
                          ),
                          Container(
                            alignment: Alignment.center,
                            height: 30,
                            child: Text(
                              '积分夺宝',
                              style: TextStyle(color: ColorsUtils.cl33, fontSize: ScreenUtil().setSp(13)),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                      child: Column(
                        children: [
                          Container(
                            width: 30,
                            height: 30,
                            child: Image.asset(
                              Utils.getImage('task_detail.jpg'),
                              fit: BoxFit.cover,
                            ),
                          ),
                          Container(
                            alignment: Alignment.center,
                            height: 30,
                            child: Text(
                              '积分明细',
                              style: TextStyle(color: ColorsUtils.cl33, fontSize: ScreenUtil().setSp(13)),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                      child: Column(
                        children: [
                          Container(
                            width: 30,
                            height: 30,
                            child: Image.asset(
                              Utils.getImage('task_integral.jpg'),
                              fit: BoxFit.cover,
                            ),
                          ),
                          Container(
                            alignment: Alignment.center,
                            height: 30,
                            child: Text(
                              '积分任务',
                              style: TextStyle(color: ColorsUtils.cl33, fontSize: ScreenUtil().setSp(13)),
                            ),
                          ),
                        ],
                      ),
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

  Widget _integralMenus(context) {
    Map<int, List> menus = {
      0: [
        'sign_task.jpg',
        '签到赚积分',
        '用户每天签到都能获得积分',
        '去签到',
        MineSignPage(),
        Color(0xFF12D1B9),
      ],
      1: [
        'sign_integral.jpg',
        '任务赚积分',
        '用户做任务都能获得积分',
        '去参加',
        RechargeRecordPage(),
        Color(0xFFEDA649),
      ],
      2: [
        'sign_loan.jpg',
        '积分还好物',
        '积分可以用来换好物',
        '去兑换',
        RechargeRecordPage(),
        Color(0xFF2D8BF2),
      ],
    };

    return Container(
      margin: EdgeInsets.only(left: 15, right: 15),
      child: Column(
        children: [
          ListView.builder(
            padding: EdgeInsets.all(0),
            shrinkWrap: true, //范围内进行包裹（内容多高ListView就多高）
            physics: NeverScrollableScrollPhysics(),
            itemCount: menus.length,
            itemBuilder: (context, index) {
              return _taskItems(index, menus[index], menus.length);
            },
          ),
        ],
      ),
    );
  }

  Widget _taskItems(index, List menu, int itemTotal) {
    return Container(
      margin: EdgeInsets.only(bottom: 15),
      padding: EdgeInsets.all(15),
      decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.all(Radius.circular(10))),
      child: Row(
        children: [
          Container(
            width: 40,
            height: 40,
            child: Image.asset(
              Utils.getImage(menu[0]),
              fit: BoxFit.cover,
            ),
          ),
          SizedBox(width: 12),
          Expanded(
            child: Column(
              children: [
                Container(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    menu[1],
                    style: TextStyle(fontSize: 16, color: ColorUtils.cl33),
                  ),
                ),
                SizedBox(height: 5),
                Container(
                  alignment: Alignment.centerLeft,
                  child: Text(menu[2], style: TextStyle(fontSize: 12, color: ColorUtils.cl99)),
                ),
              ],
            ),
          ),
          InkWell(
            onTap: () {
              NavigatorUtils.pushPage(
                targPage: menu[4],
              );
            },
            child: Container(
              height: 26,
              width: 70,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                color: menu[5],
                borderRadius: BorderRadius.all(Radius.circular(13)),
              ),
              child: Text(
                menu[3],
                style: TextStyle(fontSize: 12, color: Colors.white),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
