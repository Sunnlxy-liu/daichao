import 'dart:io';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:daichao/blocs/mine/loot_order_bloc.dart';
import 'package:daichao/common/bloc/base_state.dart';
import 'package:daichao/common/bloc/bloc_builder_wgt.dart';
import 'package:daichao/model/loot_order_model.dart';
import 'package:daichao/utils/colors_utils.dart';
import 'package:daichao/widgets/page_no_data_wgt.dart';
import 'package:daichao/widgets/tab_page_view_wgt.dart';
import 'package:flutter/material.dart';

class MineLootRecordPage extends StatefulWidget {
  const MineLootRecordPage({Key key}) : super(key: key);

  @override
  _MineLootRecordPageState createState() => _MineLootRecordPageState();
}

class _MineLootRecordPageState extends State<MineLootRecordPage> with SingleTickerProviderStateMixin {
  MyLootOrderBloc mylootOrderBloc;
  @override
  void initState() {
    super.initState();
    mylootOrderBloc = MyLootOrderBloc();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorsUtils.pageBcakgroundColor,
      appBar: AppBar(
        elevation: 0,
        brightness: Brightness.light,
        backgroundColor: Colors.white,
        centerTitle: true,
        title: Text(
          "夺宝订单",
          style: TextStyle(color: ColorsUtils.cl20, fontSize: 18),
        ),
        leading: Icon(
          IconData(0xe639, fontFamily: "Appicon"),
          color: ColorsUtils.cl20,
        ),
      ),
      body: DefaultTabController(
        length: 4,
        child: Container(
          child: Column(
            children: [
              Container(
                height: 38,
                color: Colors.white,
                child: TabBar(
                  indicatorWeight: 1,
                  indicatorSize: TabBarIndicatorSize.label,
                  labelColor: Theme.of(context).primaryColor,
                  unselectedLabelColor: Colors.grey,
                  labelPadding: EdgeInsets.only(
                    left: 0,
                    right: 0,
                  ),
                  indicator: TabIndicatorWgt(
                    indicatorWidth: 16, // 定制indication的宽度,不设置则按照默认
                    insets: EdgeInsets.only(
                      left: 0,
                      right: 0,
                      bottom: 0,
                    ), // 两边间距，不设置默认为0
                    borderSide: BorderSide(width: 3.0, color: Theme.of(context).accentColor), // 高度和颜色
                  ),
                  unselectedLabelStyle: TextStyle(fontSize: Platform.isIOS ? 13 : 14),
                  labelStyle: TextStyle(fontSize: Platform.isIOS ? 13 : 14),
                  tabs: [
                    Tab(
                      text: "全部",
                    ),
                    Tab(
                      text: "待付款",
                    ),
                    Tab(
                      text: "待开奖",
                    ),
                    Tab(
                      text: "已开奖",
                    ),
                  ],
                ),
              ),
              Expanded(
                child: TabBarView(
                  children: [
                    //全部
                    MyAllLootOrderView(bloc: mylootOrderBloc),
                    //待付款
                    MyNoPayLootOrderView(bloc: mylootOrderBloc),
                    //待开奖
                    MyNoOpendLootOrderView(bloc: mylootOrderBloc),
                    //已开奖
                    MyOpendLootOrderView(bloc: mylootOrderBloc)
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class MyAllLootOrderView extends StatefulWidget {
  final MyLootOrderBloc bloc;
  const MyAllLootOrderView({Key key, this.bloc}) : super(key: key);

  @override
  _MyAllLootOrderViewState createState() => _MyAllLootOrderViewState();
}

class _MyAllLootOrderViewState extends State<MyAllLootOrderView> {
  MyLootOrderBloc mylootOrderBloc;
  @override
  void initState() {
    super.initState();
    mylootOrderBloc = widget.bloc;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: SingleChildScrollView(
        child: BlocConsumerWgt<MyLootOrderBloc>(
          bloc: mylootOrderBloc..add(GetMyLootOrderEvent(index: 0)),
          listenIf: [SuccessLootOrderState, NoDataState],
          builder: (context, state) {
            if (state is NoDataState) {
              return Center(
                child: Container(
                  child: NoDataWgt(msg: state.msg),
                ),
              );
            }
            if (state is SuccessLootOrderState) {
              return Column(
                children: [
                  ListView.builder(
                    padding: EdgeInsets.all(0),
                    shrinkWrap: true, //范围内进行包裹（内容多高ListView就多高）
                    physics: NeverScrollableScrollPhysics(),
                    itemCount: state.model.length,
                    itemBuilder: (context, index) {
                      return MyLootOrderItemWgt(data: state.model[index], isShowPayButton: false);
                    },
                  ),
                ],
              );
            }
            return Container();
          },
        ),
      ),
    );
  }
}

//待付款

class MyNoPayLootOrderView extends StatefulWidget {
  final MyLootOrderBloc bloc;
  const MyNoPayLootOrderView({Key key, this.bloc}) : super(key: key);

  @override
  _MyNoPayLootOrderViewState createState() => _MyNoPayLootOrderViewState();
}

class _MyNoPayLootOrderViewState extends State<MyNoPayLootOrderView> {
  MyLootOrderBloc mylootOrderBloc;
  @override
  void initState() {
    super.initState();
    mylootOrderBloc = widget.bloc;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: SingleChildScrollView(
        child: BlocConsumerWgt<MyLootOrderBloc>(
          bloc: mylootOrderBloc..add(GetMyLootOrderEvent(index: 1)),
          listenIf: [SuccessNoPayOrderState, NoDataState],
          builder: (context, state) {
            if (state is NoDataState) {
              return Center(
                child: Container(
                  child: NoDataWgt(msg: state.msg),
                ),
              );
            }
            if (state is SuccessNoPayOrderState) {
              return Column(
                children: [
                  ListView.builder(
                    padding: EdgeInsets.all(0),
                    shrinkWrap: true, //范围内进行包裹（内容多高ListView就多高）
                    physics: NeverScrollableScrollPhysics(),
                    itemCount: state.model.length,
                    itemBuilder: (context, index) {
                      return MyLootOrderItemWgt(data: state.model[index], isShowPayButton: true);
                    },
                  ),
                ],
              );
            }
            return Container();
          },
        ),
      ),
    );
  }
}

//待开奖
class MyNoOpendLootOrderView extends StatefulWidget {
  final MyLootOrderBloc bloc;
  const MyNoOpendLootOrderView({Key key, this.bloc}) : super(key: key);

  @override
  _MyNoOpendLootOrderViewState createState() => _MyNoOpendLootOrderViewState();
}

class _MyNoOpendLootOrderViewState extends State<MyNoOpendLootOrderView> {
  MyLootOrderBloc mylootOrderBloc;
  @override
  void initState() {
    super.initState();
    mylootOrderBloc = widget.bloc;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: SingleChildScrollView(
        child: BlocConsumerWgt<MyLootOrderBloc>(
          bloc: mylootOrderBloc..add(GetMyLootOrderEvent(index: 2)),
          listenIf: [SuccessUnOpendState, NoDataState],
          builder: (context, state) {
            if (state is NoDataState) {
              return Center(
                child: Container(
                  child: NoDataWgt(msg: state.msg),
                ),
              );
            }
            if (state is SuccessUnOpendState) {
              return Column(
                children: [
                  ListView.builder(
                    padding: EdgeInsets.all(0),
                    shrinkWrap: true, //范围内进行包裹（内容多高ListView就多高）
                    physics: NeverScrollableScrollPhysics(),
                    itemCount: state.model.length,
                    itemBuilder: (context, index) {
                      return MyLootOrderItemWgt(data: state.model[index], isShowPayButton: false);
                    },
                  ),
                ],
              );
            }
            return Container();
          },
        ),
      ),
    );
  }
}

//已开奖

class MyOpendLootOrderView extends StatefulWidget {
  final MyLootOrderBloc bloc;
  const MyOpendLootOrderView({Key key, this.bloc}) : super(key: key);

  @override
  _MyOpendLootViewState createState() => _MyOpendLootViewState();
}

class _MyOpendLootViewState extends State<MyOpendLootOrderView> {
  MyLootOrderBloc mylootOrderBloc;
  @override
  void initState() {
    super.initState();
    mylootOrderBloc = widget.bloc;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: SingleChildScrollView(
        child: BlocConsumerWgt<MyLootOrderBloc>(
          bloc: mylootOrderBloc..add(GetMyLootOrderEvent(index: 3)),
          listenIf: [SuccessOpendedOrderState, NoDataState],
          builder: (context, state) {
            if (state is NoDataState) {
              return Center(
                child: Container(
                  child: NoDataWgt(msg: state.msg),
                ),
              );
            }
            if (state is SuccessOpendedOrderState) {
              return Column(
                children: [
                  ListView.builder(
                    padding: EdgeInsets.all(0),
                    shrinkWrap: true, //范围内进行包裹（内容多高ListView就多高）
                    physics: NeverScrollableScrollPhysics(),
                    itemCount: state.model.length,
                    itemBuilder: (context, index) {
                      return MyLootOrderItemWgt(data: state.model[index], isShowPayButton: false);
                    },
                  ),
                ],
              );
            }
            return Container();
          },
        ),
      ),
    );
  }
}

class MyLootOrderItemWgt extends StatefulWidget {
  final MyLootInfo data;
  final bool isShowPayButton;
  const MyLootOrderItemWgt({Key key, this.data, this.isShowPayButton}) : super(key: key);

  @override
  _MyLootOrderItemWgtState createState() => _MyLootOrderItemWgtState();
}

class _MyLootOrderItemWgtState extends State<MyLootOrderItemWgt> {
  MyLootInfo data;
  bool isShowPayButton;
  @override
  void initState() {
    super.initState();
    data = widget.data;
    isShowPayButton = widget.isShowPayButton;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: 15, right: 15, top: 8),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.all(Radius.circular(5)),
      ),
      padding: EdgeInsets.only(left: 15, right: 15, top: 8, bottom: 8),
      child: Column(
        children: [
          Container(
            height: 40,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(data.gsname),
                Text(
                  data.status == 1
                      ? '待开奖'
                      : data.status == 2
                          ? '已开奖'
                          : data.status == -1
                              ? '待付款'
                              : '',
                  style: TextStyle(fontSize: 12, color: Theme.of(context).accentColor),
                ),
              ],
            ),
          ),
          Container(
            height: 0.5,
            color: ColorsUtils.lintSplitColor,
          ),
          Container(
            height: 115,
            child: Row(
              children: [
                Container(
                  width: 110,
                  height: 115,
                  padding: EdgeInsets.all(15),
                  child: ClipRRect(
                    borderRadius: BorderRadius.all(Radius.circular(3)),
                    child: CachedNetworkImage(
                      imageUrl: data.thumbImage,
                      placeholder: (context, url) => Image.asset(
                        "assets/images/card.jpg",
                        fit: BoxFit.cover,
                      ),
                      errorWidget: (context, url, error) => Image.asset(
                        "assets/images/card.jpg",
                        fit: BoxFit.cover,
                      ),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Expanded(
                  child: Container(
                    height: 115,
                    alignment: Alignment.center,
                    padding: EdgeInsets.only(top: 10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          data.gname,
                          style: TextStyle(
                            fontSize: 12,
                            color: Color(0xFF8f96a3),
                          ),
                        ),
                        SizedBox(
                          height: 8,
                        ),
                        Text(
                          "下单时间" +
                              DateTime.fromMillisecondsSinceEpoch(data.createTime * 1000)
                                  .toLocal()
                                  .toString()
                                  .substring(0, 16),
                          style: TextStyle(
                            fontSize: 12,
                            color: Color(0xFF8f96a3),
                          ),
                        ),
                        SizedBox(
                          height: 8,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              child: Row(
                                children: [
                                  Baseline(
                                    baseline: 12.0,
                                    baselineType: TextBaseline.alphabetic,
                                    child: Text(
                                      "¥",
                                      style: TextStyle(
                                        color: Theme.of(context).accentColor,
                                        fontSize: 12,
                                      ),
                                    ),
                                  ),
                                  Baseline(
                                    baseline: 12.0,
                                    baselineType: TextBaseline.alphabetic,
                                    child: Text(
                                      data.price,
                                      style: TextStyle(
                                        color: Theme.of(context).accentColor,
                                        fontSize: 16,
                                      ),
                                    ),
                                  ),
                                  Baseline(
                                    baseline: 12.0,
                                    baselineType: TextBaseline.alphabetic,
                                    child: Text(
                                      " ×" + data.total.toString(),
                                      style: TextStyle(
                                        color: Color(0xFF8f96a3),
                                        fontSize: 12,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Visibility(
                              visible: isShowPayButton,
                              child: Container(
                                height: 26,
                                child: OutlinedButton(
                                  style: OutlinedButton.styleFrom(
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(18.0),
                                    ),
                                    side: BorderSide(
                                      width: 0.5,
                                      color: Theme.of(context).accentColor,
                                    ),
                                  ),
                                  onPressed: () {},
                                  child: Container(
                                    child: Text(
                                      "立即支付",
                                      style: TextStyle(fontSize: 12, color: Theme.of(context).accentColor),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          Container(
            height: 0.5,
            color: ColorsUtils.lintSplitColor,
          ),
          Container(
            padding: EdgeInsets.only(top: 5),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "开奖时间：" +
                          DateTime.fromMillisecondsSinceEpoch(data.openTime * 1000)
                              .toLocal()
                              .toString()
                              .substring(0, 16),
                      style: TextStyle(
                        color: Color(0xFF8f96a3),
                        fontSize: 12,
                      ),
                    ),
                    Text(
                      "参与人数：" + data.participateTotal.toString() + "人次",
                      style: TextStyle(
                        color: Color(0xFF8f96a3),
                        fontSize: 12,
                      ),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "中奖人数：" + data.winTotal.toString() + "人",
                      style: TextStyle(
                        color: Color(0xFF8f96a3),
                        fontSize: 12,
                      ),
                    ),
                    Text(
                      "中奖率：" + data.winRate.toString() + "%",
                      style: TextStyle(
                        color: Color(0xFF8f96a3),
                        fontSize: 12,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
