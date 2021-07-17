import 'package:flutter/material.dart';
import 'package:daichao/utils/colors_utils.dart';
import 'package:daichao/utils/form_utils.dart';
import 'package:daichao/utils/utils.dart';

class MineRealNamePage extends StatefulWidget {
  const MineRealNamePage({Key key}) : super(key: key);

  @override
  _MineRealNamePageState createState() => _MineRealNamePageState();
}

class _MineRealNamePageState extends State<MineRealNamePage> {
  TextEditingController _realNameController = TextEditingController();
  TextEditingController _phoneNumberController = TextEditingController();
  TextEditingController _cardTypeController = TextEditingController();
  TextEditingController _cardNumberController = TextEditingController();
  bool _isRealNameValidated = false;
  bool _isPhoneNumberValidated = false;
  bool _isCardTypeValidated = false;
  bool _isCardNumberValidated = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "实名认证",
          style: TextStyle(
            fontSize: 18,
            color: Colors.white,
          ),
        ),
      ),
      backgroundColor: Theme.of(context).accentColor,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: MediaQuery.of(context).size.height - MediaQuery.of(context).padding.bottom - 160,
              margin: EdgeInsets.only(left: 15, right: 15, top: 15, bottom: 15),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.all(
                  Radius.circular(10),
                ),
              ),
              child: Column(
                children: [
                  _cardInfoWgt(),
                  _lineWgt(40.0, true),
                  _cardPicture(),
                  _lineWgt(40.0, false),
                  _schemeStatusWgt(),
                  Container(
                    padding: EdgeInsets.all(25),
                    alignment: Alignment.center,
                    child: SizedBox(
                      width: double.infinity,
                      height: 45,
                      child: RaisedButton(
                        color: Colors.blue,
                        highlightColor: Colors.blue[700],
                        colorBrightness: Brightness.dark,
                        splashColor: Theme.of(context).accentColor,
                        child: Text(
                          "提交申请",
                          style: TextStyle(fontSize: 16, letterSpacing: 1),
                        ),
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(22.5)),
                        onPressed: () {},
                      ),
                    ),
                  ),
                ],
              ),
            ),
            // _suggestFormWgt("收货人"),
          ],
        ),
      ),
    );
  }

  Widget _cardInfoWgt() {
    return Container(
      color: Color(0xFFF7F7F7),
      margin: EdgeInsets.all(12),
      padding: EdgeInsets.only(left: 15, right: 15),
      child: Column(
        children: [
          _realnameItem("真实姓名"),
          _phoneNumberItem("手机号"),
          _cardTypeItem("证件类型"),
          _cardNumberItem("证件号"),
        ],
      ),
    );
  }

  Widget _realnameItem(String fieldName) {
    void _onRealNameChanged(String value) {
      setState(() {
        this._isRealNameValidated = FormUtils.isUsername(value);
      });
    }

    return Container(
      height: 49,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(
            width: 0.5,
            color: Colors.white,
          ),
        ),
      ),
      child: Row(
        children: [
          Container(
            width: 80,
            child: Text(
              fieldName,
              style: TextStyle(fontSize: 15, color: Color(0xFF8f96a3)),
            ),
          ),
          Expanded(
            child: TextFormField(
              decoration: InputDecoration(
                hintText: '请输入真实姓名',
                hintStyle: TextStyle(fontSize: 13, color: ColorsUtils.cl99),
                border: InputBorder.none,
              ),
              style: TextStyle(fontSize: 14, color: ColorsUtils.cl33),
              inputFormatters: FormUtils.inputUsernameFormatter,
              keyboardType: TextInputType.text,
              keyboardAppearance: Brightness.light,
              controller: _realNameController,
              maxLines: 1,
              onChanged: _onRealNameChanged,
            ),
          ),
        ],
      ),
    );
  }

  Widget _phoneNumberItem(String fieldName) {
    void _onPhoneNumberChanged(String value) {
      setState(() {
        this._isPhoneNumberValidated = FormUtils.isPhoneNumber(value);
      });
    }

    return Container(
      height: 49,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(
            width: 0.5,
            color: Colors.white,
          ),
        ),
      ),
      child: Row(
        children: [
          Container(
            width: 80,
            child: Text(
              fieldName,
              style: TextStyle(fontSize: 15, color: Color(0xFF8f96a3)),
            ),
          ),
          Expanded(
            child: TextFormField(
              decoration: InputDecoration(
                hintText: '请输入手机号码',
                hintStyle: TextStyle(fontSize: 13, color: ColorsUtils.cl99),
                border: InputBorder.none,
              ),
              style: TextStyle(fontSize: 14, color: ColorsUtils.cl33),
              inputFormatters: FormUtils.inputPhoneFormatter,
              keyboardType: TextInputType.phone,
              keyboardAppearance: Brightness.light,
              controller: _phoneNumberController,
              maxLines: 1,
              onChanged: _onPhoneNumberChanged,
            ),
          ),
        ],
      ),
    );
  }

  Widget _cardTypeItem(String fieldName) {
    void _onCardTypeChanged(String value) {
      setState(() {
        this._isCardTypeValidated = FormUtils.isUsername(value);
      });
    }

    return Container(
      height: 49,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(
            width: 0.5,
            color: Colors.white,
          ),
        ),
      ),
      child: Row(
        children: [
          Container(
            width: 80,
            child: Text(
              fieldName,
              style: TextStyle(fontSize: 15, color: Color(0xFF8f96a3)),
            ),
          ),
          Expanded(
            child: TextFormField(
              decoration: InputDecoration(
                hintText: '请输入证件类型',
                hintStyle: TextStyle(fontSize: 13, color: ColorsUtils.cl99),
                border: InputBorder.none,
              ),
              style: TextStyle(fontSize: 14, color: ColorsUtils.cl33),
              inputFormatters: FormUtils.inputUsernameFormatter,
              keyboardType: TextInputType.text,
              keyboardAppearance: Brightness.light,
              controller: _cardTypeController,
              maxLines: 1,
              onChanged: _onCardTypeChanged,
            ),
          ),
        ],
      ),
    );
  }

  Widget _cardNumberItem(String fieldName) {
    void _onCardNumberChanged(String value) {
      setState(() {
        this._isCardNumberValidated = FormUtils.isUsername(value);
      });
    }

    return Container(
      height: 49,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(
            width: 0.5,
            color: Colors.white,
          ),
        ),
      ),
      child: Row(
        children: [
          Container(
            width: 80,
            child: Text(
              fieldName,
              style: TextStyle(fontSize: 15, color: Color(0xFF8f96a3)),
            ),
          ),
          Expanded(
            child: TextFormField(
              decoration: InputDecoration(
                hintText: '请输入身份证号',
                hintStyle: TextStyle(fontSize: 13, color: ColorsUtils.cl99),
                border: InputBorder.none,
              ),
              style: TextStyle(fontSize: 14, color: ColorsUtils.cl33),
              inputFormatters: FormUtils.inputUsernameFormatter,
              keyboardType: TextInputType.text,
              keyboardAppearance: Brightness.light,
              controller: _cardNumberController,
              maxLines: 1,
              onChanged: _onCardNumberChanged,
            ),
          ),
        ],
      ),
    );
  }

  Widget _lineWgt(double lineHeight, bool isShowRadius) {
    return Container(
      height: lineHeight,
      color: Colors.white,
      padding: EdgeInsets.only(top: 5, bottom: 5),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Offstage(
            offstage: !isShowRadius,
            child: Container(
              width: 7.5,
              height: 15,
              decoration: BoxDecoration(
                color: Theme.of(context).accentColor,
                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(7.5),
                  bottomRight: Radius.circular(7.5),
                ),
              ),
            ),
          ),
          Expanded(
            child: Container(
              alignment: Alignment.center,
              margin: EdgeInsets.only(left: 12, right: 12),
              height: 0.5,
              decoration: BoxDecoration(
                image: DecorationImage(
                  alignment: Alignment.center,
                  image: AssetImage(Utils.getImage('dotted_line_6x1.png')),
                  repeat: ImageRepeat.repeatX,
                ),
              ),
            ),
          ),
          Offstage(
            offstage: !isShowRadius,
            child: Container(
              width: 7.5,
              height: 15,
              decoration: BoxDecoration(
                color: Theme.of(context).accentColor,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(7.5),
                  bottomLeft: Radius.circular(7.5),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget _cardPicture() {
    return Container(
      margin: EdgeInsets.only(left: 12, right: 12),
      child: Column(
        children: [
          Container(
            alignment: Alignment.centerLeft,
            child: Text(
              "上传身份照片",
              style: TextStyle(color: ColorsUtils.cl12, fontSize: 16),
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 15),
            child: Row(
              children: [
                Expanded(
                  child: Container(
                    margin: EdgeInsets.only(right: 8.75),
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      color: Color(0xFFE7EFFF),
                      borderRadius: BorderRadius.all(
                        Radius.circular(6),
                      ),
                    ),
                    child: Column(
                      children: [
                        SizedBox(height: 10),
                        Container(
                          height: 80,
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              alignment: Alignment.center,
                              image: AssetImage(Utils.getImage('card1.png')),
                            ),
                          ),
                        ),
                        SizedBox(height: 10),
                        Container(
                          height: 25,
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                            color: Theme.of(context).accentColor,
                            borderRadius: BorderRadius.only(
                              bottomLeft: Radius.circular(6),
                              bottomRight: Radius.circular(6),
                            ),
                          ),
                          child: Text(
                            "拍摄正面",
                            style: TextStyle(fontSize: 14, color: Colors.white),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Expanded(
                  child: Container(
                    margin: EdgeInsets.only(left: 8.75),
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      color: Color(0xFFE7EFFF),
                      borderRadius: BorderRadius.all(
                        Radius.circular(6),
                      ),
                    ),
                    child: Column(
                      children: [
                        SizedBox(height: 10),
                        Container(
                          height: 80,
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              alignment: Alignment.center,
                              image: AssetImage(Utils.getImage('card2.png')),
                            ),
                          ),
                        ),
                        SizedBox(height: 10),
                        Container(
                          height: 25,
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                            color: Theme.of(context).accentColor,
                            borderRadius: BorderRadius.only(
                              bottomLeft: Radius.circular(6),
                              bottomRight: Radius.circular(6),
                            ),
                          ),
                          child: Text(
                            "拍摄正面",
                            style: TextStyle(fontSize: 14, color: Colors.white),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _schemeStatusWgt() {
    return Container(
      margin: EdgeInsets.only(left: 15, right: 15),
      height: 20,
      child: Row(
        children: [
          InkWell(
            onTap: () {},
            child: Icon(
              IconData(0xe656, fontFamily: 'Appicon'),
              color: ColorsUtils.cl99,
              size: 12,
            ),
          ),
          SizedBox(width: 5),
          Text(
            "已阅读并同意",
            style: TextStyle(
              fontSize: 12,
              color: Color(0xFF9d9d9d),
            ),
          ),
          InkWell(
            onTap: () {},
            child: Text(
              "《贷超超市用户使用手册》",
              style: TextStyle(fontSize: 12, color: Theme.of(context).accentColor),
            ),
          )
        ],
      ),
    );
  }
}
