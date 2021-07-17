import 'package:daichao/common/net/net_api.dart';
import 'package:daichao/data/repository/user_repository.dart';
import 'package:daichao/model/user_info_model.dart';
import 'package:daichao/utils/toast_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:daichao/pages/mine_page_view/register.dart';
import 'package:daichao/pages/mine_page_view/widgets/password_wgt.dart';
import 'package:daichao/utils/colors_utils.dart';
import 'package:daichao/utils/form_utils.dart';
import 'package:daichao/utils/navigator_utils.dart';
import 'package:daichao/utils/style_utils.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController _phoneController = TextEditingController();
  TextEditingController _verifyCodeController = TextEditingController();
  TextStyle get _hintStyle => TextStyle(fontSize: 13, color: ColorsUtils.cl99);
  bool _checkInput = false;
  bool _isUserNameValidated = false;
  bool _isPasswordValidated = false;
  String _password = '';
  //获取Key用来获取Form表单组件
  GlobalKey<FormState> loginKey = new GlobalKey<FormState>();
  // AuthBloc _authBloc;
  @override
  void initState() {
    super.initState();
    // _authBloc = AuthBloc();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("登录"),
        centerTitle: false,
      ),
      body: Container(
        color: Colors.transparent,
        margin: EdgeInsets.only(top: 30, left: 16, right: 16, bottom: 30),
        child: Form(
          key: loginKey,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              _buildPhoneInput(context),
              PassWordWgt(
                onChange: (value) {
                  _password = value;
                },
              ),
              _loginBtnWgt(context),
              _registerBtnWgt(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildPhoneInput(context) {
    void _onUserNameChanged(String value) {
      setState(() {
        this._isUserNameValidated = FormUtils.isPhoneNumber(value);
      });
    }

    return Container(
      margin: EdgeInsets.only(top: 10.0),
      decoration: FormUtils.inputBottomBorderDecoration,
      child: TextFormField(
        decoration: InputDecoration(
          hintText: '请输入手机号',
          hintStyle: _hintStyle,
          border: InputBorder.none,
        ),
        inputFormatters: FormUtils.inputPhoneFormatter,
        keyboardType: TextInputType.phone,
        keyboardAppearance: Brightness.light,
        controller: _phoneController,
        onChanged: _onUserNameChanged,
      ),
    );
  }

  Widget _loginBtnWgt(context) {
    return Container(
      height: 38.0,
      margin: EdgeInsets.only(top: 30.0),
      child: new SizedBox.expand(
        child: new RaisedButton(
          onPressed: () async {
            // 登录
            ToastUtils.showLoadingToast(msg: "登录中");
            print("=====${_phoneController.text.replaceAll(" ", "")}====");
            print("=====$_password====");
            try {
              UserInfoModel model = await NetApi.doLogin(params: {
                "account": _phoneController.text.replaceAll(" ", ""),
                "password": _password,
              });
              // UserRespository().doLogin(model);
              ToastUtils.showToastMsg("登录成功");
            } catch (error) {
              ToastUtils.showToastMsg("登录失败，请重试");
            } finally {
              // ToastUtils.closeAllToast();
            }
          },
          color: Theme.of(context).primaryColor,
          child: new Text(
            '登录',
            style: StyleUtils.btnTextStyle,
          ),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5.0)),
        ),
      ),
    );
  }

  Widget _registerBtnWgt() {
    return Container(
      height: 38.0,
      margin: EdgeInsets.only(top: 30.0),
      child: new SizedBox.expand(
        child: new RaisedButton(
          onPressed: () {
            NavigatorUtils.pushPage(
              targPage: RegisterPage(),
            );
          },
          color: Theme.of(context).primaryColor,
          child: new Text(
            '注册',
            style: StyleUtils.btnTextStyle,
          ),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5.0)),
        ),
      ),
    );
  }
}
