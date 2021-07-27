import 'package:daichao/blocs/mine/user_sign_bloc.dart';
import 'package:daichao/common/bloc/base_state.dart';
import 'package:daichao/common/bloc/bloc_builder_wgt.dart';
import 'package:flutter/material.dart';
import 'package:daichao/pages/mine_page_view/mine_payment.dart';
import 'package:daichao/utils/colors_utils.dart';
import 'package:daichao/utils/navigator_utils.dart';
import 'package:daichao/utils/utils.dart';
import 'package:flutter_screenutil/screen_util.dart';

class MineSignPage extends StatefulWidget {
  @override
  _MineSignPageState createState() => _MineSignPageState();
}

class _MineSignPageState extends State<MineSignPage> {
  SignBloc singBloc;

  @override
  void initState() {
    super.initState();
    singBloc = SignBloc();
  }

  @override
  void dispose() {
    super.dispose();
  }

  Map<int, List> taskLists = {
    0: ['每日签到', '去签到', '10', '用户每天签到都能得到积分', 'sign_task.jpg'],
    1: ['邀请用户', '去邀请', '10', '用户邀请好友可以获得积分', 'sign_user.jpg'],
    2: ['充值购买积分', '去购买', '100', '额外奖励100积分', 'sign_integral.jpg'],
    3: ['申请贷款', '去申请', '100', '用户申请贷款奖励100积分', 'sign_loan.jpg'],
  };

  Map<int, List> systemLists = {
    0: ['实名认证', '去认证', '10', '用户每天签到都能得到积分', 'sign_name.jpg'],
    1: ['个人信息核验', '去核验', '10', '用户邀请好友可以获得积分', 'sign_info.jpg'],
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorsUtils.pageBcakgroundColor,
      appBar: AppBar(
        elevation: 0,
        title: Text(
          "签到",
          style: TextStyle(color: Colors.white, fontSize: ScreenUtil().setSp(18)),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: BlocConsumerWgt<SignBloc>(
            bloc: singBloc..add(GetSignInfoEvent()),
            listenIf: [SuccessSignState, ShowToastState, NoDataState],
            builder: (context, state) {
              if (state is SuccessSignState) {
                return Column(
                  children: [
                    _topBar(context, state),
                    SizedBox(
                      height: 24,
                    ),
                    _signListWgt(context, "每日任务", taskLists),
                    _signListWgt(context, "系统认证", systemLists),
                  ],
                );
              }
              return Container();
            }),
      ),
    );
  }

  Widget _topBar(context, SuccessSignState state) {
    return Container(
      height: 170 + MediaQuery.of(context).padding.top + 15,
      child: Stack(
        children: [
          Container(
            height: 150,
            decoration: BoxDecoration(
              color: Theme.of(context).accentColor,
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(20),
                bottomRight: Radius.circular(20),
              ),
            ),
            child: Container(
              margin: EdgeInsets.only(left: 15),
              alignment: Alignment.topLeft,
              child: Row(
                children: [
                  Baseline(
                    baseline: 20,
                    baselineType: TextBaseline.alphabetic,
                    child: Text(
                      "已连续签到",
                      style: TextStyle(fontSize: 14, color: Colors.white),
                    ),
                  ),
                  Baseline(
                    baseline: 20,
                    baselineType: TextBaseline.alphabetic,
                    child: Text(
                      state.model.signInfo.continueSign.toString(),
                      style: TextStyle(fontSize: 20, color: Color(0xFFfed74f)),
                    ),
                  ),
                  Baseline(
                    baseline: 20,
                    baselineType: TextBaseline.alphabetic,
                    child: Text(
                      "天，",
                      style: TextStyle(fontSize: 14, color: Colors.white),
                    ),
                  ),
                  Baseline(
                    baseline: 20,
                    baselineType: TextBaseline.alphabetic,
                    child: Text(
                      "明天签到+" + state.model.signInfo.tomorrowScore.toString() + "积分",
                      style: TextStyle(fontSize: 14, color: Colors.white),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              height: 150,
              margin: EdgeInsets.only(left: 14, right: 14),
              child: Container(
                padding: EdgeInsets.only(
                  left: 12,
                  right: 12,
                ),
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
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          _signCoinWgt(state.model.signInfo.sevenDays[0] == "1" ? true : false, "1"),
                          _signCoinWgt(state.model.signInfo.sevenDays[1] == "1" ? true : false, "2"),
                          _signCoinWgt(state.model.signInfo.sevenDays[2] == "1" ? true : false, "3"),
                          _signCoinWgt(state.model.signInfo.sevenDays[3] == "1" ? true : false, "4"),
                          _signCoinWgt(state.model.signInfo.sevenDays[4] == "1" ? true : false, "5"),
                          _signCoinWgt(state.model.signInfo.sevenDays[5] == "1" ? true : false, "6"),
                          _signCoinWgt(state.model.signInfo.sevenDays[6] == "1" ? true : false, "7"),

                          // ListView.builder(
                          //   padding: EdgeInsets.all(0),
                          //   shrinkWrap: true,
                          //   physics: NeverScrollableScrollPhysics(),
                          //   itemCount: state.model.signInfo.sevenDays.length,
                          //   itemBuilder: (context, index) {
                          //     return ;
                          //   },
                          // ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SizedBox(width: 12),
                        Baseline(
                          baseline: 35,
                          baselineType: TextBaseline.alphabetic,
                          child: Text(
                            state.model.signInfo.newScore.toString(),
                            style: TextStyle(
                              fontSize: 35,
                              color: Color(0xFFff8900),
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        Baseline(
                          baseline: 25,
                          baselineType: TextBaseline.alphabetic,
                          child: Text(
                            "积分",
                            style: TextStyle(fontSize: 12, color: ColorsUtils.cl66),
                          ),
                        ),
                        Spacer(),
                        TextButton(
                          onPressed: () {
                            if (!state.model.signInfo.todayIsSigned) {
                              singBloc..add(DoSignEvent());
                            }
                          },
                          child: Text(
                            state.model.signInfo.todayIsSigned ? '已签到' : "签到",
                            style: TextStyle(fontSize: 14),
                          ),
                          style: ButtonStyle(
                            backgroundColor: MaterialStateProperty.all(
                                state.model.signInfo.todayIsSigned ? Colors.grey : Color(0xFFff8900)),
                            foregroundColor: MaterialStateProperty.all(Colors.white),
                            textStyle: MaterialStateProperty.all(TextStyle(fontSize: 30)),
                            // shape: MaterialStateProperty.all(OutlinedBorder(side: BorderSide(color: Colors.red))),
                            shape: MaterialStateProperty.all(
                              RoundedRectangleBorder(
                                side: BorderSide(color: Colors.red, width: 10),
                                borderRadius: BorderRadius.circular(25),
                              ),
                            ),
                            side: MaterialStateProperty.all(
                              BorderSide(
                                color: state.model.signInfo.todayIsSigned ? Colors.grey : Color(0xFFff8900),
                                width: 0.5,
                              ),
                            ),
                          ),
                        ),
                        // RaisedButton(

                        //   // key: ,
                        //   color: Color(0xFFff8900),
                        //   highlightColor: Color(0xFFff8900),
                        //   colorBrightness: Brightness.dark,
                        //   splashColor: Color(0xFFff8900),
                        //   child: Text(
                        //     state.model.signInfo.todayIsSigned ?'已签到' :"签到",
                        //     style: TextStyle(fontSize: 14),
                        //   ),
                        //   shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
                        //   onPressed: () {
                        //     NavigatorUtils.pushPage(
                        //       targPage: MinePaymentPage(),
                        //     );
                        //   },
                        // ),
                        SizedBox(width: 12),
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

  Widget _signCoinWgt(bool isSgined, String dayNumber) {
    return Expanded(
      child: Column(
        children: [
          Container(
            width: 44,
            height: 42.5,
            decoration: BoxDecoration(
              image: DecorationImage(
                alignment: Alignment.center,
                image: AssetImage(
                  //signed_seven
                  dayNumber == '7'
                      ? Utils.getImage('signed_seven.jpg')
                      : isSgined
                          ? Utils.getImage('signed_coin.jpg')
                          : Utils.getImage('un_sign_coin.jpg'),
                ),
              ),
            ),
          ),
          SizedBox(height: 5),
          Container(
            alignment: Alignment.center,
            child: Text(
              "第$dayNumber天",
              style: TextStyle(
                fontSize: 11,
                color: isSgined ? Color(0xFFff8900) : ColorsUtils.cl66,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _signListWgt(context, String title, datas) {
    return Container(
      color: Colors.white,
      margin: EdgeInsets.only(bottom: 10),
      padding: EdgeInsets.only(top: 10, left: 18, right: 18),
      child: Column(
        children: [
          Container(
            height: 40,
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
            itemCount: datas.length,
            itemBuilder: (context, index) {
              return _signItems(index, datas.length, datas[index]);
            },
          ),
        ],
      ),
    );
  }

  Widget _signItems(int index, int len, List signData) {
    return Container(
      height: 80,
      alignment: Alignment.centerLeft,
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border(
          bottom: BorderSide(
            width: 0.5,
            color: index + 1 == len ? Colors.white : Color(0xFFE6E6E6),
          ),
        ),
      ),
      child: Row(
        children: [
          Container(
            width: 43,
            height: 43,
            child: Image.asset(
              Utils.getImage(signData[4]),
              fit: BoxFit.cover,
            ),
          ),
          SizedBox(width: 8),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  child: Row(
                    children: [
                      Text(
                        signData[0],
                        style: TextStyle(color: ColorUtils.cl33, fontSize: 16, fontWeight: FontWeight.bold),
                      ),
                      SizedBox(width: 3),
                      Container(
                        width: 20,
                        height: 20,
                        child: Image.asset(
                          Utils.getImage('coin.jpg'),
                          fit: BoxFit.cover,
                        ),
                      ),
                      Text(
                        '+' + signData[2],
                        style: TextStyle(color: Color(0xFFfa5046), fontSize: 17),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 6),
                Container(
                  child: Text(
                    signData[3],
                    style: TextStyle(fontSize: 12, color: ColorsUtils.cl99),
                  ),
                )
              ],
            ),
          ),
          Container(
            height: 30,
            child: RaisedButton(
              // key: ,
              color: Theme.of(context).accentColor,
              highlightColor: Theme.of(context).accentColor,
              colorBrightness: Brightness.dark,
              splashColor: Theme.of(context).accentColor,
              child: Text(
                signData[1],
                style: TextStyle(fontSize: 12),
              ),
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
              onPressed: () {
                NavigatorUtils.pushPage(
                  targPage: MinePaymentPage(),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
