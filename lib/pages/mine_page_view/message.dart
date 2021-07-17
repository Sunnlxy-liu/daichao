import 'package:daichao/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:daichao/utils/colors_utils.dart';

class MessagePage extends StatefulWidget {
  @override
  _MessagePageState createState() => _MessagePageState();
}

class _MessagePageState extends State<MessagePage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  Map<int, List> dataMessage = {
    0: ['msg_hot.png', '热门活动', '使用支付宝在线充值100积分', '2021-06-18', Color(0xFFFF9A00)],
    1: ['msg_system.png', '系统消息', '积分夺宝有新产品上架了', '2021-06-17', Color(0xFF00A29B)],
    2: ['msg_hot.png', '热门活动', '一大波优惠券正在发放中', '2021-06-16', Color(0xFFFF9A00)],
    3: ['msg_system.png', '积分还好物', '免息贷款产品更新了', '2021-06-15', Color(0xFF00A29B)],
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "系统消息",
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
            SizedBox(height: 12),
            Container(
              color: Colors.white,
              child: ListView.builder(
                padding: EdgeInsets.all(0),
                shrinkWrap: true, //范围内进行包裹（内容多高ListView就多高）
                physics: NeverScrollableScrollPhysics(),
                itemCount: 4,
                itemBuilder: (context, index) {
                  return _messageItems(index, dataMessage[index], dataMessage.length);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _messageItems(index, List msg, int itemTotal) {
    return Container(
      padding: EdgeInsets.only(top: 15, bottom: 15),
      margin: EdgeInsets.only(left: 15, right: 15),
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border(
          bottom: BorderSide(
            color: ColorUtils.lintSplitColor,
            width: 0.5,
            style: BorderStyle.solid,
          ),
        ),
      ),
      child: Row(
        children: [
          Container(
            width: 40,
            height: 40,
            padding: EdgeInsets.all(8),
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: msg[4],
            ),
            child: Image.asset(
              Utils.getImage(msg[0]),
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
                    msg[1],
                    style: TextStyle(fontSize: 16, color: ColorUtils.cl33),
                  ),
                ),
                SizedBox(height: 5),
                Container(
                  alignment: Alignment.centerLeft,
                  child: Text(msg[2], style: TextStyle(fontSize: 12, color: ColorUtils.cl99)),
                ),
              ],
            ),
          ),
          Container(
            height: 26,
            width: 86,
            alignment: Alignment.center,
            child: Text(
              msg[3],
              style: TextStyle(fontSize: 12, color: ColorUtils.cl99),
            ),
          )
        ],
      ),
    );
  }
}
