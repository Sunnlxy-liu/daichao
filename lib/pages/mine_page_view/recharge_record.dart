import 'package:flutter/material.dart';
import 'package:daichao/utils/colors_utils.dart';
import 'package:daichao/utils/utils.dart';

class RechargeRecordPage extends StatefulWidget {
  @override
  _RechargeRecordPageState createState() => _RechargeRecordPageState();
}

class _RechargeRecordPageState extends State<RechargeRecordPage> {
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
    List data = [];
    Map<int, List> recordData = {
      0: [0, '充值记录', 1000, '2021-06-03'],
      1: [0, '充值记录', 200, '2021-06-05'],
      2: [1, '消费记录', 30, '2021-05-16'],
      3: [1, '消费记录', 800, '2021-06-01'],
      4: [0, '充值记录', 1000, '2021-06-03'],
      5: [1, '消费记录', 200, '2021-06-05'],
      6: [1, '消费记录', 30, '2021-05-16'],
      7: [1, '消费记录', 800, '2021-06-01'],
    };

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "充值/消费记录",
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
        child: data.length > 0
            ? noRechargeDataWgt()
            : Column(
                children: [
                  ListView.builder(
                    padding: EdgeInsets.all(0),
                    shrinkWrap: true, //范围内进行包裹（内容多高ListView就多高）
                    physics: NeverScrollableScrollPhysics(),
                    itemCount: 8,
                    itemBuilder: (context, index) {
                      return _rechargeRecordItem(index, recordData.length, recordData[index]);
                    },
                  ),
                ],
              ),
      ),
    );
  }

  Widget _rechargeRecordItem(int index, int len, List data) {
    return Container(
      color: Colors.white,
      child: Container(
        margin: EdgeInsets.only(left: 15, right: 15),
        padding: EdgeInsets.only(top: 12, bottom: 12),
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border(
            bottom: BorderSide(
              width: 0.5,
              color: index + 1 == len ? Colors.white : Color(0xFFDFDFDF),
            ),
          ),
        ),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  data[1],
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: ColorsUtils.cl12,
                  ),
                ),
                SizedBox(
                  width: 5,
                ),
                Text(
                  data[3],
                  style: TextStyle(
                    color: Color(0xFF9b9b9b),
                    fontSize: 12,
                  ),
                ),
                Spacer(),
                Text(
                  data[0] == 0 ? '+' + data[2].toString() : '-' + data[2].toString(), //  已还清3870ff  待还款29d355 已逾期ff3333
                  style: TextStyle(
                    fontSize: 16,
                    color: data[0] == 0 ? Color(0xFF0079fe) : Color(0xFFfe5a00),
                  ),
                ),
                Text(
                  '积分', //  已还清3870ff  待还款29d355 已逾期ff3333
                  style: TextStyle(
                    fontSize: 12,
                    color: data[0] == 0 ? Color(0xFF0079fe) : Color(0xFFfe5a00),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 3,
            ),
            Row(
              children: [
                Text(
                  data[0] == 0 ? "使用支付宝在线充值" + data[2].toString() + "积分" : "积分夺宝消费" + data[2].toString() + "积分",
                  style: TextStyle(
                    fontSize: 14,
                    color: Color(0xFF636363),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget noRechargeDataWgt() {
    return Center(
      child: Container(
        alignment: Alignment.center,
        height: MediaQuery.of(context).size.height * 0.68,
        width: MediaQuery.of(context).size.width * 0.5,
        child: Image.asset(
          Utils.getImage('no_recharge.png'),
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
