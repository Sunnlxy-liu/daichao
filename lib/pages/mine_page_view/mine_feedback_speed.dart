import 'package:daichao/blocs/mine/suggest_bloc.dart';
import 'package:daichao/common/bloc/base_state.dart';
import 'package:daichao/common/bloc/bloc_builder_wgt.dart';
import 'package:daichao/model/suggest_speed_model.dart';
import 'package:daichao/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:daichao/utils/colors_utils.dart';
import 'package:flutter_screenutil/screen_util.dart';

class MineFeedbackSpeedPage extends StatefulWidget {
  @override
  _MineFeedbackSpeedPageState createState() => _MineFeedbackSpeedPageState();
}

class _MineFeedbackSpeedPageState extends State<MineFeedbackSpeedPage> {
  SuggestBloc suggestBloc = SuggestBloc();
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
                        child: BlocConsumerWgt<SuggestBloc>(
                            bloc: SuggestBloc()..add(SuggestSpeedEvent()),
                            listenIf: [SuccessSuggestSpeedState, NoDataState],
                            builder: (context, state) {
                              if (state is SuccessSuggestSpeedState) {
                                return Column(
                                  children: [
                                    ListView.builder(
                                      padding: EdgeInsets.all(0),
                                      shrinkWrap: true, //范围内进行包裹（内容多高ListView就多高）
                                      physics: NeverScrollableScrollPhysics(),
                                      itemCount: state.model.mySuggestSpeedInfo.length,
                                      itemBuilder: (context, index) {
                                        return _speedItem(state.model.mySuggestSpeedInfo[index]);
                                      },
                                    )
                                  ],
                                );
                              }
                              return Container();
                            }),
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

  Widget _speedItem(MySuggestSpeedInfo data) {
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
                  decoration: BoxDecoration(
                      color: data.status == 1 ? Theme.of(context).accentColor : Color(0xFFBEBEBE),
                      shape: BoxShape.circle),
                ),
                SizedBox(height: 1),
                Container(
                  width: 1,
                  height: 36,
                  color: data.status == 1 ? Theme.of(context).accentColor : ColorUtils.lintSplitColor,
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
                    DateTime.fromMillisecondsSinceEpoch(data.createtime * 1000).toLocal().toString().substring(0, 16),
                    style: TextStyle(fontSize: 14, color: ColorUtils.cl99),
                  ),
                ),
                Container(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    data.speedName,
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
