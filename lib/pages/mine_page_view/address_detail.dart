import 'package:flutter/material.dart';
import 'package:daichao/utils/colors_utils.dart';
import 'package:daichao/utils/form_utils.dart';

class AddressDetailPage extends StatefulWidget {
  const AddressDetailPage({Key key}) : super(key: key);

  @override
  _AddressDetailPageState createState() => _AddressDetailPageState();
}

class _AddressDetailPageState extends State<AddressDetailPage> {
  TextEditingController _consigneeController = TextEditingController();
  TextEditingController _phoneNmberController = TextEditingController();
  TextEditingController _detailController = TextEditingController();
  bool _isConsigneeValidated = false;
  bool _isphoneNmberValidated = false;
  bool _isDetailValidated = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "收货地址管理",
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
      body: Column(
        children: [
          Container(height: 10),
          _addressConsigneeItem("收货人"),
          _addressPhoneNumberItem("手机号码"),
          _addressItem("地址"),
          _addressDetailItem("详细地址"),
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
                  "保存",
                  style: TextStyle(fontSize: 16, letterSpacing: 1),
                ),
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(22.5)),
                onPressed: () {},
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget _addressConsigneeItem(String fieldName) {
    void _onConsigneeChanged(String value) {
      setState(() {
        this._isConsigneeValidated = FormUtils.isUsername(value);
      });
    }

    return Container(
      color: Colors.white,
      child: Container(
        margin: EdgeInsets.only(left: 15, right: 15),
        height: 49,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          border: Border(
            bottom: BorderSide(
              width: 0.5,
              color: Color(0xFFE6E6E6),
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
                  hintText: '请输入收货人姓名',
                  hintStyle: TextStyle(fontSize: 13, color: ColorsUtils.cl99),
                  border: InputBorder.none,
                ),
                style: TextStyle(fontSize: 14, color: ColorsUtils.cl33),
                inputFormatters: FormUtils.inputUsernameFormatter,
                keyboardType: TextInputType.text,
                keyboardAppearance: Brightness.light,
                controller: _consigneeController,
                maxLines: 1,
                onChanged: _onConsigneeChanged,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _addressPhoneNumberItem(String fieldName) {
    void _onPhoneNumnerChanged(String value) {
      setState(() {
        this._isphoneNmberValidated = FormUtils.isPhoneNumber(value);
      });
    }

    return Container(
      color: Colors.white,
      child: Container(
        margin: EdgeInsets.only(left: 15, right: 15),
        height: 49,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          border: Border(
            bottom: BorderSide(
              width: 0.5,
              color: Color(0xFFE6E6E6),
            ),
          ),
        ),
        child: Row(
          children: [
            Container(
              width: 80,
              child: Text(
                fieldName,
                style: TextStyle(fontSize: 14, color: Color(0xFF8f96a3)),
              ),
            ),
            Expanded(
              child: TextFormField(
                decoration: InputDecoration(
                  hintText: '请输入收货人电话号码',
                  hintStyle: TextStyle(fontSize: 13, color: ColorsUtils.cl99),
                  border: InputBorder.none,
                ),
                style: TextStyle(fontSize: 14, color: ColorsUtils.cl33),
                inputFormatters: FormUtils.inputPhoneFormatter,
                keyboardType: TextInputType.phone,
                keyboardAppearance: Brightness.light,
                controller: _phoneNmberController,
                maxLines: 1,
                onChanged: _onPhoneNumnerChanged,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _addressItem(String fieldName) {
    void _onConsigneeChanged(String value) {
      setState(() {
        this._isConsigneeValidated = FormUtils.isUsername(value);
      });
    }

    return Container(
      color: Colors.white,
      child: Container(
        margin: EdgeInsets.only(left: 15, right: 15),
        height: 49,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          border: Border(
            bottom: BorderSide(
              width: 0.5,
              color: Color(0xFFE6E6E6),
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
            Container(
              child: Text(
                "请选择",
                style: TextStyle(fontSize: 13, color: ColorsUtils.cl99),
              ),
            ),
            Spacer(),
            Container(
              alignment: Alignment.centerRight,
              width: 40,
              height: 40,
              child: Icon(
                IconData(0xe638, fontFamily: 'Appicon'),
                color: ColorsUtils.cl99,
                size: 18,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _addressDetailItem(String fieldName) {
    void _onDetailChanged(String value) {
      setState(() {
        this._isDetailValidated = FormUtils.isAddress(value);
      });
    }

    return Container(
      color: Colors.white,
      child: Container(
        margin: EdgeInsets.only(left: 15, right: 15),
        height: 80,
        alignment: Alignment.topCenter,
        child: Row(
          children: [
            Container(
              width: 80,
              child: Text(
                fieldName,
                style: TextStyle(fontSize: 14, color: Color(0xFF8f96a3)),
              ),
            ),
            Expanded(
              child: TextFormField(
                decoration: InputDecoration(
                  hintText: '小区、门牌号等',
                  hintStyle: TextStyle(fontSize: 13, color: ColorsUtils.cl99),
                  border: InputBorder.none,
                ),
                style: TextStyle(fontSize: 14, color: ColorsUtils.cl33),
                inputFormatters: FormUtils.inputAddressFormatter,
                keyboardType: TextInputType.multiline,
                minLines: 1,
                maxLines: 4,
                keyboardAppearance: Brightness.light,
                controller: _detailController,
                onChanged: _onDetailChanged,
              ),
            ),
          ],
        ),
      ),
    );
  }

  // show() async {
  //   Result result = await CityPickers.showCityPicker(
  //     context: context,
  //   );
  //   // type 2 Result result2 = await CityPickers.showFullPageCityPicker( context: context, );
  // }
}
