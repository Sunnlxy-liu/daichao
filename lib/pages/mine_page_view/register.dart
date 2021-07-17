import 'package:daichao/common/net/net_api.dart';
import 'package:daichao/data/repository/user_repository.dart';
import 'package:daichao/model/user_info_model.dart';
import 'package:daichao/utils/toast_utils.dart';
import 'package:daichao/widgets/appbar_wgt.dart';
import 'package:flutter/material.dart';
import 'package:daichao/utils/colors_utils.dart';
import 'package:daichao/utils/form_utils.dart';
import 'package:daichao/utils/style_utils.dart';
import 'package:intl/intl.dart';

class RegisterPage extends StatefulWidget {
  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final _usernameController = TextEditingController();
  final _idCardController = TextEditingController();
  final _phoneController = TextEditingController();
  GlobalKey<FormState> registerKey = new GlobalKey<FormState>();
  TextStyle get _getHintTextStyle => TextStyle(fontSize: 14, color: ColorsUtils.cl99);
  TextStyle get _getCaptionStyle => TextStyle(fontSize: 15, color: Color(0xFF202020));
  TextStyle get _textStyle03 => TextStyle(fontSize: 12, color: ColorsUtils.cl66);
  bool _checkInput = true;
  int sex = 1;
  DateTime selectedDate = DateTime.now();

  bool _isUserNameValidated = false;
  bool _isIdCardValidated = false;
  bool _isPhoneValidated = false;
  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  void updateSexValue(int v) {
    setState(() {
      sex = v;
    });
  }

  Future<void> _selectDate() async //异步
  {
    final DateTime date = await showDatePicker(
      //等待异步处理的结果
      //等待返回
      context: context,
      initialDate: selectedDate,
      firstDate: DateTime(1900),
      lastDate: DateTime(2100),
    );
    if (date == null) return; //点击DatePicker的cancel

    setState(() {
      //点击DatePicker的OK
      selectedDate = date;
      _checkInput = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarWidget(
        titleText: "新用户注册",
      ),
      body: SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.only(top: 20, left: 36, right: 36, bottom: 30),
          child: Form(
            key: registerKey,
            child: Column(
              children: [
                _buildUsernameInput(context),
                _buildPhoneInput(context),
                _buildSexInput(context),
                _buildIdCardInput(context),
                _buildBirthdayInput(context),
                _registerBtnWgt(context),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildUsernameInput(context) {
    return Container(
      height: 60,
      margin: EdgeInsets.only(top: 10),
      padding: EdgeInsets.only(left: 5, right: 5),
      decoration: FormUtils.inputBottomBorderDecoration,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 20,
            child: Text(
              '用户名',
              style: _getCaptionStyle,
              textAlign: TextAlign.left,
            ),
          ),
          Expanded(
            child: TextFormField(
              decoration: InputDecoration(
                hintText: '请输入您的用户名',
                hintStyle: _getHintTextStyle,
                border: InputBorder.none,
              ),
              keyboardType: TextInputType.text,
              keyboardAppearance: Brightness.light,
              controller: _usernameController,
              inputFormatters: FormUtils.inputUsernameFormatter,
              onChanged: (String value) {
                setState(() {
                  this._isUserNameValidated = value.length > 3;
                });
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildIdCardInput(context) {
    return Container(
      height: 60,
      margin: EdgeInsets.only(top: 20),
      padding: EdgeInsets.only(left: 5, right: 5),
      decoration: FormUtils.inputBottomBorderDecoration,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 20,
            child: Text(
              '身份证号',
              style: _getCaptionStyle,
              textAlign: TextAlign.left,
            ),
          ),
          Expanded(
            flex: 1,
            child: TextFormField(
              decoration: InputDecoration(
                hintText: '请输入身份证号',
                hintStyle: _getHintTextStyle,
                border: InputBorder.none,
              ),
              keyboardType: TextInputType.number,
              keyboardAppearance: Brightness.light,
              controller: _idCardController,
              inputFormatters: FormUtils.inputIdCardFormatter,
              onChanged: (String value) {
                setState(() {
                  this._isIdCardValidated = value.length > 12;
                });
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSexInput(context) {
    return Container(
      height: 60,
      margin: EdgeInsets.only(top: 20),
      padding: EdgeInsets.only(left: 5, right: 5),
      // decoration: FormUtils.inputBottomBorderDecoration,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 30,
            child: Text(
              '性别',
              style: _getCaptionStyle,
              textAlign: TextAlign.left,
            ),
          ),
          Expanded(
            flex: 1,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                _sexBtnWgt('男', 1),
                SizedBox(width: 15),
                _sexBtnWgt('女', 0),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _sexBtnWgt(String text, int value) {
    return Container(
      height: 25,
      width: 70,
      alignment: Alignment.center,
      child: OutlinedButton(
        style: OutlinedButton.styleFrom(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(50.0),
          ),
          side: BorderSide(
            width: 0.5,
            color: sex == value ? Theme.of(context).primaryColor : ColorsUtils.cl99,
          ),
        ),
        child: Text(
          text,
          style: TextStyle(
            color: sex == value ? Theme.of(context).primaryColor : ColorsUtils.cl99,
            fontSize: 13,
            height: 1.2,
          ),
        ),
        onPressed: () {
          updateSexValue(value);
        },
      ),
    );
  }

  Widget _buildBirthdayInput(context) {
    return Container(
      height: 60,
      margin: EdgeInsets.only(top: 20),
      padding: EdgeInsets.only(left: 5, right: 5),
      decoration: FormUtils.inputBottomBorderDecoration,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 20,
            child: Text(
              '生日',
              style: _getCaptionStyle,
              textAlign: TextAlign.left,
            ),
          ),
          Expanded(
            flex: 1,
            child: InkWell(
              onTap: _selectDate,
              child: Row(
                children: <Widget>[
                  // Text(DateFormat.yMMMd().format(selectedDate)), // May 10, 2019
                  Text(DateFormat.yMd().format(selectedDate)), // 5/10/2019
                  Icon(Icons.arrow_drop_down),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  //推荐人手机号码
  Widget _buildPhoneInput(context) {
    return Container(
      height: 60,
      margin: EdgeInsets.only(top: 20),
      padding: EdgeInsets.only(left: 5, right: 5),
      decoration: FormUtils.inputBottomBorderDecoration,
      child:
          Column(mainAxisAlignment: MainAxisAlignment.start, crossAxisAlignment: CrossAxisAlignment.start, children: [
        Container(
          height: 20,
          child: Text(
            '密码',
            style: _getCaptionStyle,
            textAlign: TextAlign.left,
          ),
        ),
        Expanded(
          flex: 1,
          child: TextFormField(
            decoration: InputDecoration(
              hintText: '请输入您的密码',
              hintStyle: _getHintTextStyle,
              border: InputBorder.none,
            ),
            keyboardType: TextInputType.phone,
            keyboardAppearance: Brightness.light,
            controller: _phoneController,
            // inputFormatters: FormUtils.inputPhoneFormatter,
            onChanged: (String value) {
              setState(() {
                this._isPhoneValidated = FormUtils.isPhoneNumber(value);
              });
            },
          ),
        ),
      ]),
    );
  }

  //注册按钮
  Widget _registerBtnWgt(context) {
    return Container(
      height: 40.0,
      margin: EdgeInsets.only(top: 50.0),
      child: new SizedBox.expand(
        child: new RaisedButton(
          onPressed: _checkInput
              ? () {
                  // 执行注册
                  _doRegister(context);
                }
              : null,
          color: Theme.of(context).primaryColor,
          child: new Text(
            '完  成',
            style: StyleUtils.btnTextStyle,
          ),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(100.0)),
        ),
      ),
    );
  }

  void _doRegister(context) async {
    String name = _usernameController.text.trim();
    String cardId = _idCardController.text.trim();
    String phone = _phoneController.text.trim();
    String birthday = selectedDate.toString().substring(0, 10);
    if (name == "" || cardId == "") {
      ToastUtils.showToastMsg("用户名或者密码不能为空！");
    } else {
      // 请求接口
      ToastUtils.showLoadingToast(msg: "注册中...");
      try {
        UserInfoModel model = await NetApi.doRegister(
          params: {
            "register_type": "pwd",
            "username": name,
            "password": phone,
            "gender": sex,
            "birthday": birthday,
            "passportnumber": cardId,
          },
        );
        ToastUtils.showToastMsg("注册成功");
        // 保存用户信息
        UserRespository().doLogin(model);
        //
        Navigator.pop(context);
      } catch (error) {
        ToastUtils.showToastMsg("注册失败:${error.msg}");
      }
    }
  }
}
