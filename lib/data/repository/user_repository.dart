import 'package:daichao/common/net/net_api.dart';
import 'package:daichao/model/user_info_model.dart';
import 'package:daichao/model/user_model.dart';
import 'package:daichao/utils/sp_utils.dart';

class UserRespository {
  factory UserRespository() => _getInstance();
  static UserRespository _instance;
  UserRespository._();

  static UserRespository _getInstance() {
    if (_instance == null) {
      _instance = UserRespository._();
    }
    return _instance;
  }

  // UserModel _userModel;
  bool isLogin;

  // UserModel get userModel => _userModel;
  // void setUserModel(UserModel model) {
  //   _userModel = model;
  // }

  void onCreateData() {}
  /* *
   * 登出
   */
  void logout() {
    isLogin = false;
    // _userModel.isLogin = false;
    // _userModel.token = null;
    // 持久化
    // SpUtil.putObject("userModel", _userModel); // 持久化
    SpUtil.putBool("isLogin", false); // 持久化
  }

  /* *
   * 登录
   */
  void doLogin(UserInfoModel model) {
    isLogin = true;
    // _userModel.isLogin = true;
    // _userModel.token = model.userInfo.token;
    // _userModel.userInfo = model.userInfo;
    // 持久化
    // SpUtil.putObject("userModel", _userModel); // 持久化
    SpUtil.putObject("isLogin", true); // 持久化
  }
}
