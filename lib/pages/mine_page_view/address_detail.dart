import 'package:daichao/blocs/mine/my_address_bloc.dart';
import 'package:daichao/common/bloc/bloc_builder_wgt.dart';
import 'package:daichao/model/myaddress_model.dart';
import 'package:daichao/pages/mine_page_view/address_picker_page.dart';
import 'package:flutter/material.dart';
import 'package:daichao/utils/colors_utils.dart';
import 'package:daichao/utils/form_utils.dart';
import 'package:flutter_pickers/pickers.dart';

class AddressDetailPage extends StatefulWidget {
  final AddressList address;
  final String title;
  const AddressDetailPage({Key key, this.title, this.address}) : super(key: key);

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
  MyAddressBloc myaddressbloc = MyAddressBloc();
  // 所在区域  省 市 区
  String initProvince = '选择省';
  String initCity = '选择市';
  String initTown = '选择区县';
  AddressList uptData;
  int addressId = 0;
  @override
  void initState() {
    super.initState();
    uptData = widget.address;
    setState(() {
      if (widget.address != null) {
        _consigneeController = TextEditingController(text: uptData.name);
        _phoneNmberController = TextEditingController(text: uptData.mobile);
        _detailController = TextEditingController(text: uptData.address);
        initProvince = uptData.province;
        initCity = uptData.city;
        initTown = uptData.area;
        addressId = uptData.id;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          widget.title != null ? widget.title : "新增收货地址",
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
              child: BlocConsumerWgt<MyAddressBloc>(
                bloc: myaddressbloc,
                builder: (context, state) {
                  return RaisedButton(
                    onPressed: () {
                      myaddressbloc.add(
                        AddMyAddressEvent(
                          id: addressId,
                          name: _consigneeController.text.replaceAll(" ", ""),
                          mobile: _phoneNmberController.text.replaceAll(" ", ""),
                          country: '中国',
                          province: initProvince,
                          city: initCity,
                          area: initTown,
                          address: _detailController.text.replaceAll(" ", ""),
                        ),
                      );
                      Navigator.of(context).pop(true);
                    },
                    color: Colors.blue,
                    highlightColor: Colors.blue[700],
                    colorBrightness: Brightness.dark,
                    splashColor: Theme.of(context).accentColor,
                    child: Text(
                      "保存",
                      style: TextStyle(fontSize: 16, letterSpacing: 1),
                    ),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(22.5)),
                  );
                },
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
        child: InkWell(
          onTap: () {
            AddressPickerPage();
          },
          child: SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            physics: BouncingScrollPhysics(),
            child: Row(
              children: [
                Container(
                  width: 80,
                  child: Text(
                    fieldName,
                    style: TextStyle(fontSize: 15, color: Color(0xFF8f96a3)),
                  ),
                ),
                _checkLocation()
              ],
            ),
          ),
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

  Widget _checkLocation() {
    Widget textView = Text(
      spliceCityName(pname: initProvince, cname: initCity, tname: initTown),
      style: TextStyle(fontSize: 13, color: ColorsUtils.cl99),
    );

    return InkWell(
      onTap: () {
        Pickers.showAddressPicker(
          context,
          initProvince: initProvince,
          initCity: initCity,
          initTown: initTown,
          onConfirm: (p, c, t) {
            setState(() {
              initProvince = p;
              initCity = c;
              initTown = t ?? '';
            });
          },
        );
      },
      child: _outsideView(textView, initProvince, initCity, initTown),
    );
  }

  Widget _outsideView(Widget textView, initProvince, initCity, initTown) {
    return Container(
      // constraints: const BoxConstraints(minHeight: 42),
      // padding: EdgeInsets.fromLTRB(10, 0, 0, 0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          textView,
          SizedBox(width: 8),
          (initProvince != '' && initProvince != '选择省')
              ? InkWell(
                  child: Icon(Icons.close, size: 20, color: Colors.grey[500]),
                  onTap: () {
                    setState(() {
                      initProvince = '';
                      initCity = '';
                      initTown = '';
                    });
                  })
              : SizedBox(),
          SizedBox(width: 8),
          Icon(Icons.keyboard_arrow_down, size: 28, color: Colors.grey[500]),
        ],
      ),
    );
  }

  // 拼接城市
  String spliceCityName({String pname, String cname, String tname}) {
    if (strEmpty(pname)) return '不限';
    StringBuffer sb = StringBuffer();
    sb.write(pname);
    if (strEmpty(cname)) return sb.toString();
    sb.write(' - ');
    sb.write(cname);
    if (strEmpty(tname)) return sb.toString();
    sb.write(' - ');
    sb.write(tname);
    return sb.toString();
  }

  /// 字符串为空
  bool strEmpty(String value) {
    if (value == null) return true;

    return value.trim().isEmpty;
  }
}
