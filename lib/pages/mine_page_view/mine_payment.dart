import 'package:flutter/material.dart';
import 'package:daichao/utils/colors_utils.dart';
import 'package:daichao/utils/form_utils.dart';
import 'package:daichao/utils/utils.dart';

class MinePaymentPage extends StatefulWidget {
  const MinePaymentPage({Key key}) : super(key: key);

  @override
  _MinePaymentPageState createState() => _MinePaymentPageState();
}

class _MinePaymentPageState extends State<MinePaymentPage> {
  TextEditingController _payAmountController = TextEditingController();
  bool _isPayMountValidated = false;
  //获取Key用来获取Form表单组件
  GlobalKey<FormState> paymentKey = new GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "支付",
          style: TextStyle(
            fontSize: 18,
            color: ColorsUtils.cl12,
          ),
        ),
        leading: BackButton(color: ColorsUtils.cl12),
        brightness: Brightness.light,
        backgroundColor: Colors.white,
      ),
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Form(
              key: paymentKey,
              child: Column(
                children: [
                  Container(
                    height: 58,
                    padding: EdgeInsets.only(left: 15, right: 15, bottom: 11.5, top: 11.5),
                    color: Color(0xFFF8FAFF),
                    child: Row(
                      children: [
                        Container(
                          width: 25,
                          height: 25,
                          child: Image.asset(
                            Utils.getImage('pay_icon.png'),
                            fit: BoxFit.cover,
                          ),
                        ),
                        SizedBox(width: 15),
                        Container(
                          child: Text(
                            "余额：",
                            style: TextStyle(
                              color: Color(0xFF0079fe),
                              fontSize: 16,
                            ),
                          ),
                        ),
                        Container(
                          child: Text(
                            "66.00",
                            style: TextStyle(
                              color: Color(0xFF0079fe),
                              fontSize: 17,
                            ),
                          ),
                        ),
                        Container(
                          child: Text(
                            "元",
                            style: TextStyle(
                              color: Color(0xFF0079fe),
                              fontSize: 16,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    height: 52,
                    color: Colors.white,
                    alignment: Alignment.centerLeft,
                    padding: EdgeInsets.only(left: 15, right: 15, bottom: 11.5, top: 11.5),
                    child: Text(
                      "充值金额",
                      style: TextStyle(
                        color: Color(0xFF0079fe),
                        fontSize: 16,
                      ),
                    ),
                  ),
                  _buildPayAmountInput(context),
                  Container(
                    height: 52,
                    color: Colors.white,
                    alignment: Alignment.centerLeft,
                    padding: EdgeInsets.only(left: 15, right: 15, bottom: 11.5, top: 11.5),
                    child: Text(
                      "充值方式",
                      style: TextStyle(
                        color: Color(0xFF0079fe),
                        fontSize: 16,
                      ),
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.only(left: 15, right: 15, bottom: 11.5, top: 11.5),
                    color: Color(0xFFF8FAFF),
                    child: Column(
                      children: [
                        Container(
                          padding: EdgeInsets.only(left: 12, right: 16),
                          height: 60,
                          child: Row(
                            children: [
                              Container(
                                child: Icon(
                                  IconData(0xe61b, fontFamily: "Appicon"),
                                  color: Color(0xFFd81e06),
                                  size: 26,
                                ),
                              ),
                              SizedBox(width: 5),
                              Container(
                                child: Text(
                                  "招商银行",
                                  style: TextStyle(fontSize: 16, color: ColorsUtils.cl33),
                                ),
                              ),
                              Spacer(),
                              Icon(
                                IconData(0xe63b, fontFamily: "Appicon"),
                                color: Theme.of(context).primaryColor,
                                size: 22,
                              ),
                            ],
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.only(left: 12, right: 16),
                          height: 60,
                          child: Row(
                            children: [
                              Container(
                                child: Icon(
                                  IconData(0xe6cc, fontFamily: "Appicon"),
                                  color: Color(0xFF1296db),
                                  size: 26,
                                ),
                              ),
                              SizedBox(width: 5),
                              Container(
                                child: Text(
                                  "支付宝",
                                  style: TextStyle(fontSize: 16, color: ColorsUtils.cl33),
                                ),
                              ),
                              Spacer(),
                              Icon(
                                IconData(0xe63b, fontFamily: "Appicon"),
                                color: Theme.of(context).primaryColor,
                                size: 22,
                              ),
                            ],
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.only(left: 12, right: 16),
                          height: 60,
                          child: Row(
                            children: [
                              Container(
                                child: Icon(
                                  IconData(0xe607, fontFamily: "Appicon"),
                                  color: Color(0xFF1afa29),
                                  size: 26,
                                ),
                              ),
                              SizedBox(width: 5),
                              Container(
                                child: Text(
                                  "微信",
                                  style: TextStyle(fontSize: 16, color: ColorsUtils.cl33),
                                ),
                              ),
                              Spacer(),
                              Icon(
                                IconData(0xe63b, fontFamily: "Appicon"),
                                color: Theme.of(context).primaryColor,
                                size: 22,
                              ),
                            ],
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.only(left: 12, right: 16),
                          height: 60,
                          child: Row(
                            children: [
                              SizedBox(width: 31),
                              Container(
                                child: Text(
                                  "其他方式",
                                  style: TextStyle(fontSize: 16, color: ColorsUtils.cl33),
                                ),
                              ),
                              Spacer(),
                              Text(
                                "其他银行，绑定新卡",
                                style: TextStyle(fontSize: 12, color: Color(0xFF99a9ef)),
                              ),
                              Icon(
                                IconData(0xe638, fontFamily: "Appicon"),
                                color: ColorUtils.cl99,
                                size: 16,
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 50),
                  Offstage(
                    offstage: false,
                    child: Container(
                      padding: EdgeInsets.all(25),
                      alignment: Alignment.center,
                      color: Colors.white,
                      child: SizedBox(
                        width: double.infinity,
                        height: 45,
                        child: RaisedButton(
                          color: Colors.blue,
                          highlightColor: Colors.blue[700],
                          colorBrightness: Brightness.dark,
                          splashColor: Theme.of(context).accentColor,
                          child: Text(
                            "支付",
                            style: TextStyle(fontSize: 18, letterSpacing: 4),
                          ),
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(22.5)),
                          onPressed: () {},
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

  Widget _buildPayAmountInput(context) {
    void _onAmountChanged(String value) {
      setState(() {
        this._isPayMountValidated = FormUtils.isAmountNumber(value);
      });
    }

    return Container(
      height: 58,
      padding: EdgeInsets.only(left: 15, right: 15, bottom: 11.5, top: 11.5),
      decoration: BoxDecoration(
        color: Color(0xFFF8FAFF),
      ),
      child: Row(
        children: [
          Icon(
            IconData(0xe63f, fontFamily: "Appicon"),
            color: ColorsUtils.cl12,
            size: 22,
          ),
          SizedBox(width: 10),
          Expanded(
            child: TextFormField(
              decoration: InputDecoration(
                hintText: '请输入1元以上的金额',
                hintStyle: TextStyle(fontSize: 13, color: ColorsUtils.cl99),
                border: InputBorder.none,
              ),
              inputFormatters: FormUtils.inputAmountFormatter,
              keyboardType: TextInputType.number,
              keyboardAppearance: Brightness.light,
              controller: _payAmountController,
              maxLines: 1,
              onChanged: _onAmountChanged,
            ),
          ),
        ],
      ),
    );
  }
}
