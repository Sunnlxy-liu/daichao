import 'package:cached_network_image/cached_network_image.dart';
import 'package:daichao/pages/mine_page_view/message.dart';
import 'package:daichao/pages/mine_page_view/mine_loan_record.dart';
import 'package:daichao/pages/mine_page_view/mine_task.dart';
import 'package:flutter/material.dart';
import 'package:daichao/data/repository/user_repository.dart';
import 'package:daichao/pages/mine_page_view/login.dart';
import 'package:daichao/pages/mine_page_view/mine_information.dart';
import 'package:daichao/pages/mine_page_view/mine_integral.dart';
import 'package:daichao/pages/mine_page_view/mine_realname.dart';
import 'package:daichao/pages/mine_page_view/setting.dart';
import 'package:daichao/utils/colors_utils.dart';
import 'package:daichao/utils/navigator_utils.dart';
import 'package:daichao/utils/utils.dart';
import 'package:flutter_screenutil/screen_util.dart';

class MineIndexPage extends StatefulWidget {
  @override
  _MineIndexPageState createState() => _MineIndexPageState();
}

class _MineIndexPageState extends State<MineIndexPage> {
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
      body: SingleChildScrollView(
        child: Column(
          children: [
            _topInfo(),
            _cardUserInfo(context),
            _myLootRecorde(context),
            _pageMenusWgt(context),
          ],
        ),
      ),
    );
  }

  Widget _topInfo() {
    return Container(
      height: 164 + MediaQuery.of(context).padding.top + 15,
      child: Stack(
        children: [
          ClipPath(
            clipper: OvalBottomBorderClipper(),
            child: Container(
              height: 180,
              color: Theme.of(context).accentColor,
              child: Column(
                children: [
                  Container(
                    height: 50,
                  ),
                ],
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              height: 162,
              margin: EdgeInsets.only(left: 10, right: 10),
              child: Stack(
                children: [
                  Align(
                    alignment: Alignment.center,
                    child: Container(
                      padding: EdgeInsets.only(
                        left: 12,
                        right: 12,
                        top: 24,
                        bottom: 12,
                      ),
                      margin: EdgeInsets.only(left: 8, right: 8),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.all(
                          Radius.circular(8),
                        ),
                      ),
                      child: Column(
                        children: [
                          Row(
                            children: [
                              SizedBox(width: 12),
                              InkWell(
                                onTap: () {
                                  NavigatorUtils.pushPage(targPage: MineInformationPage());
                                },
                                child: Container(
                                  width: 62,
                                  height: 62,
                                  margin: EdgeInsets.only(
                                    right: 10,
                                  ),
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    border: Border.all(
                                      width: 2,
                                      color: Colors.white,
                                    ),
                                  ),
                                  child: ClipOval(
                                    child: CachedNetworkImage(
                                      imageUrl: "http://liuxuyang.cc/assets/img/headicon.png",
                                      placeholder: (context, url) => Image.asset(
                                        "assets/images/headicon.png",
                                        fit: BoxFit.cover,
                                      ),
                                      errorWidget: (context, url, error) => Image.asset(
                                        "assets/images/headicon.png",
                                        fit: BoxFit.cover,
                                      ),
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                              ),
                              Expanded(
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Row(
                                      children: [
                                        Container(
                                          height: 28,
                                          child: Text(
                                            '刘徐阳',
                                            style: TextStyle(
                                              fontSize: 16,
                                              color: Colors.black,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                        ),
                                        SizedBox(
                                          width: 5,
                                        ),
                                        Container(
                                          width: 50,
                                          height: 16.5,
                                          padding: EdgeInsets.only(left: 3, right: 3),
                                          alignment: Alignment.center,
                                          decoration: BoxDecoration(
                                            image: DecorationImage(
                                              image: AssetImage(Utils.getImage('mine_user_level.png')),
                                              fit: BoxFit.cover,
                                            ),
                                          ),
                                          child: Row(
                                            mainAxisAlignment: MainAxisAlignment.center,
                                            children: [
                                              SizedBox(
                                                width: 12,
                                              ),
                                              Text(
                                                '01',
                                                style: TextStyle(color: Colors.white, fontSize: 12, height: 1.2),
                                              )
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                    SizedBox(
                                      height: 10,
                                    ),
                                    Row(
                                      children: [
                                        Baseline(
                                          baseline: 12.0,
                                          baselineType: TextBaseline.alphabetic,
                                          child: Text(
                                            "最后登陆时间：",
                                            style: TextStyle(
                                              color: ColorUtils.cl99,
                                              fontSize: 12,
                                            ),
                                          ),
                                        ),
                                        Baseline(
                                          baseline: 12.0,
                                          baselineType: TextBaseline.alphabetic,
                                          child: Text(
                                            '2021年6月12 15:33',
                                            style: TextStyle(
                                              color: ColorUtils.cl99,
                                              fontSize: 12,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                    SizedBox(
                                      height: 10,
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: 15),
                          Row(
                            children: [
                              Expanded(
                                child: Container(
                                  alignment: Alignment.center,
                                  child: Column(
                                    children: [
                                      Text(
                                        '--',
                                        style: TextStyle(
                                          color: ColorUtils.cl20,
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      Text(
                                        "信用评分",
                                        style: TextStyle(
                                          color: ColorUtils.cl33,
                                          fontSize: 13,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              Container(
                                width: 0.5,
                                height: 26,
                                color: Color(0xFFdbdbdb),
                              ),
                              Expanded(
                                child: Container(
                                  child: Column(
                                    children: [
                                      Text(
                                        '--',
                                        style: TextStyle(
                                          color: ColorUtils.cl20,
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      Text(
                                        "贷款次数",
                                        style: TextStyle(
                                          color: ColorUtils.cl33,
                                          fontSize: 13,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              Container(
                                width: 0.5,
                                height: 26,
                                color: Color(0xFFdbdbdb),
                              ),
                              Expanded(
                                child: Container(
                                  child: Column(
                                    children: [
                                      Text(
                                        '--',
                                        style: TextStyle(
                                          color: ColorUtils.cl20,
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      Text(
                                        "我的积分",
                                        style: TextStyle(
                                          color: ColorUtils.cl33,
                                          fontSize: 13,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              Container(
                                width: 0.5,
                                height: 26,
                                color: Color(0xFFdbdbdb),
                              ),
                              Expanded(
                                child: Container(
                                  child: Column(
                                    children: [
                                      Text(
                                        "去夺宝",
                                        style: TextStyle(
                                          fontSize: 14,
                                          color: Color(0xFFfb3a5e),
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      Text(
                                        "积分夺宝",
                                        style: TextStyle(
                                          color: ColorUtils.cl33,
                                          fontSize: 13,
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
                  Positioned(
                    right: 2,
                    top: 20,
                    child: InkWell(
                      onTap: () {
                        NavigatorUtils.pushPage(targPage: SettingPage());
                      },
                      child: Container(
                        height: 30,
                        width: 60,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage(Utils.getImage('mine_setting.png')),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  // Widget _topBar() {
  //   return BlocConsumerWgt<AuthBloc>(
  //     bloc: AuthBloc(),
  //     buildIf: [UserInfoState],
  //     builder: (context, state) {
  //       if (state is UserInfoState) {

  //       }
  //       return Container();
  //     },
  //   );
  // }

  Widget _cardUserInfo(context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.all(Radius.circular(10)),
        boxShadow: [
          BoxShadow(
            color: Color(0xffdddddd),
            offset: Offset(0.0, 3.0),
            blurRadius: 3.0,
          )
        ],
      ),
      margin: EdgeInsets.only(left: 18, right: 18, top: 18),
      padding: EdgeInsets.all(12),
      // height: 100,
      child: Column(
        children: [
          Container(
            child: Row(
              children: [
                SizedBox(
                  width: 12,
                ),
                Container(
                  height: 40,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Text(
                            "张伟明",
                            style: TextStyle(fontSize: 16, color: ColorsUtils.cl12),
                          ),
                          SizedBox(width: 5),
                          Container(
                            alignment: Alignment.center,
                            height: 16,
                            width: 16,
                            child: Image.asset(
                              Utils.getImage('mine_edit.png'),
                              fit: BoxFit.cover,
                            ),
                          ),
                        ],
                      ),
                      Container(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          "已实名",
                          style: TextStyle(fontSize: 12, color: Color(0xFF42b236)),
                        ),
                      )
                    ],
                  ),
                ),

                SizedBox(
                  width: 20,
                ),
                Container(
                  alignment: Alignment.center,
                  height: 30,
                  width: 30,
                  child: Image.asset(
                    Utils.getImage('mine_username.png'),
                    fit: BoxFit.cover,
                  ),
                ),
                Spacer(),
                // Container(
                //   width: 28,
                //   height: 30,
                //   child: Image.asset(
                //     Utils.getImage('mine_telphone.png'),
                //     fit: BoxFit.cover,
                //   ),
                // ),
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.only(left: 12, right: 12, top: 12, bottom: 12),
            height: 1,
            decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage(Utils.getImage('dotted_line.png')),
                  // fit: BoxFit.fill,
                  repeat: ImageRepeat.repeatX),
            ),
          ),
          Row(
            children: [
              _cardItemWgt("信用报告", "已认证", true, 'mine_report.png'),
              _cardItemWgt("电话号码", "已认证", true, 'mine_mobile.png'),
            ],
          ),
          Row(
            children: [
              _cardItemWgt("职业信息", "未认证", false, 'mine_occupation.png'),
              _cardItemWgt("个人资料", "80%完成", true, 'mine_data.png'),
            ],
          ),
          // _barMenuItem(),
          // _barMenuItem(),
          // _barMenuItem(),
          // _barMenuItem(),
        ],
      ),
    );
  }

  Widget _cardItemWgt(String type, String status, bool isConfirm, String imgIcon) {
    return Expanded(
      child: Container(
        height: 56,
        alignment: Alignment.center,
        child: Row(
          children: [
            SizedBox(width: 12),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    type,
                    style: TextStyle(fontSize: 15, color: ColorsUtils.cl12),
                  ),
                  Text(
                    status,
                    style: TextStyle(fontSize: 12, color: isConfirm ? Color(0xFF42b236) : ColorsUtils.cl99),
                  ),
                ],
              ),
            ),
            Container(
              height: 30,
              width: 30,
              child: Image.asset(
                Utils.getImage(imgIcon),
                fit: BoxFit.cover,
              ),
            ),
            SizedBox(width: 12),
          ],
        ),
      ),
    );
  }

  Widget _myLootRecorde(context) {
    return Container(
      margin: EdgeInsets.only(left: 18, right: 18, top: 9),
      child: Column(
        children: [
          _titleOfModularWgt("我的获奖", "更多"),
          Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.all(Radius.circular(10)),
            ),
            child: ListView.builder(
              padding: EdgeInsets.all(0),
              shrinkWrap: true, //范围内进行包裹（内容多高ListView就多高）
              physics: NeverScrollableScrollPhysics(),
              itemCount: 3,
              itemBuilder: (context, index) {
                return _luckUserItem(index);
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _luckUserItem(int index) {
    return GestureDetector(
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(Radius.circular(10)),
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              alignment: Alignment.center,
              width: 44,
              height: 44,
              margin: EdgeInsets.only(
                left: 18,
                right: 18,
                top: 18,
                bottom: 18,
              ),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(
                  Radius.circular(4),
                ),
              ),
              child: CachedNetworkImage(
                imageUrl: "http://liuxuyang.cc/assets/img/ex1.jpg",
                placeholder: (context, url) => Image.asset(
                  "assets/images/ex1.jpg",
                  fit: BoxFit.cover,
                ),
                errorWidget: (context, url, error) => Image.asset(
                  "assets/images/ex1.jpg",
                  fit: BoxFit.cover,
                ),
                fit: BoxFit.cover,
              ),
            ),
            Expanded(
              child: Container(
                height: 79.5,
                margin: EdgeInsets.only(right: 17),
                decoration: BoxDecoration(
                  border: Border(
                    bottom: BorderSide(
                      width: 0.5,
                      color: index == 2 ? Colors.white : Color(0xFFDFDFDF),
                    ),
                  ),
                ),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          child: Container(
                            padding: EdgeInsets.only(
                              top: 18,
                            ),
                            child: Column(
                              children: [
                                Row(
                                  children: [
                                    Container(
                                      height: 22,
                                      child: Text(
                                        "飞利浦28英寸 IPS技术10",
                                        style: TextStyle(
                                          fontSize: 14,
                                          color: ColorUtils.cl20,
                                          height: 1.5,
                                        ),
                                        textAlign: TextAlign.start,
                                        maxLines: 2,
                                      ),
                                    )
                                  ],
                                ),
                                SizedBox(height: 5),
                                Row(
                                  children: [
                                    Baseline(
                                      baseline: 14.0,
                                      baselineType: TextBaseline.alphabetic,
                                      child: Icon(
                                        IconData(0xe714, fontFamily: "Appicon"),
                                        color: Theme.of(context).primaryColor,
                                        size: 12,
                                      ),
                                    ),
                                    SizedBox(
                                      width: 5,
                                    ),
                                    Baseline(
                                      baseline: 16.0,
                                      baselineType: TextBaseline.alphabetic,
                                      child: Text(
                                        "2021.06.01",
                                        style: TextStyle(
                                          color: ColorUtils.cl99,
                                          fontSize: 13,
                                        ),
                                      ),
                                    ),
                                  ],
                                )
                              ],
                            ),
                          ),
                        ),
                        Container(
                          alignment: Alignment.center,
                          // height: 70,
                          // width: 20,
                          child: Container(
                            height: 18,
                            alignment: Alignment.center,
                            padding: EdgeInsets.only(
                              left: 6,
                              right: 6,
                            ),
                            margin: EdgeInsets.only(top: 4),
                            decoration: BoxDecoration(
                              color: Color(0xFFF6F6F6), //Color(0xFFFFF5E6)
                              borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(11),
                                bottomRight: Radius.circular(9),
                                topRight: Radius.circular(9),
                              ),
                            ),
                            child: Text(
                              "已领取", //未领取
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                color: ColorsUtils.cl99, //Color(0xFFff7404)
                                fontSize: 11,
                                height: 1.5,
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
      //tap事件触发
      onTap: () {},
    );
  }

  Widget _pageMenusWgt(context) {
    Map<int, List> menus = {
      0: ['mine_recorde', '贷款记录', MineLoanRecordPage()],
      1: ['mine_integral', '积分充值', MineIntegralPage()],
      2: ['mine_task', '我的任务', MineTaskPage()],
      3: ['mine_infomation', '个人信息', MineInformationPage()],
      4: ['mine_confirm', '实名认证', MineRealNamePage()],
      5: ['mine_message', '消息中心', MessagePage()],
    };
    return Container(
      margin: EdgeInsets.only(left: 18, right: 18, top: 18, bottom: 18),
      padding: EdgeInsets.only(left: 12, right: 12, top: 3, bottom: 3),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.all(Radius.circular(10)),
      ),
      child: GridView.builder(
        padding: EdgeInsets.only(top: 0),
        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          //横轴元素个数
          crossAxisCount: 3,
          //子组件宽高长度比例
          childAspectRatio: 1.3,
        ),
        itemCount: menus.length,
        itemBuilder: (BuildContext context, int index) {
          return _pageMenuItem(menus[index]);
        },
      ),
    );
  }

  Widget _pageMenuItem(List name) {
    return InkWell(
      onTap: () {
        // if (UserRespository.isLogined) {
        //   NavigatorUtils.pushPage(
        //     targPage: name[2],
        //   );
        // } else {
        //   NavigatorUtils.pushPage(
        //     targPage: LoginPage(),
        //   );
        // }
      },
      child: Container(
        alignment: Alignment.center,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: 30,
              height: 30,
              child: Image.asset(
                Utils.getImage(name[0] + '.png'),
                // "assets/images/renzhengtop.png",
                fit: BoxFit.cover,
              ),
            ),
            Container(
              alignment: Alignment.center,
              height: 20,
              child: Text(
                name[1],
                style: TextStyle(color: ColorsUtils.cl33, fontSize: ScreenUtil().setSp(13)),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _titleOfModularWgt(String title, String rightTitle) {
    return Container(
      height: 40,
      color: Colors.transparent,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: TextStyle(
              fontSize: 16,
              color: Color(0xFF202020),
              fontWeight: FontWeight.w500,
            ),
          ),
          InkWell(
            child: Text(
              rightTitle,
              style: TextStyle(
                fontSize: ScreenUtil().setSp(13),
                color: ColorsUtils.cl99,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class OvalBottomBorderClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = Path();
    path.lineTo(0, 0);
    path.lineTo(0, size.height - 24);
    path.quadraticBezierTo(
      size.width / 4,
      size.height,
      size.width / 2,
      size.height,
    );
    path.quadraticBezierTo(
      size.width - size.width / 4,
      size.height,
      size.width,
      size.height - 24,
    );
    path.lineTo(size.width, 0);
    path.lineTo(0, 0);
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return true;
  }
}
