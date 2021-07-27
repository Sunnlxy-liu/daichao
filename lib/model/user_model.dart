import 'package:daichao/model/user_info_model.dart';

class UserModel {
  String token;
  bool isLogin;
  UserInfo userInfo;
  UserModel({
    this.isLogin = false,
    this.token = "",
    this.userInfo,
  });

  Map<String, dynamic> toJson() {
    return {
      'token': token,
      'isLogin': isLogin,
      'userInfo': userInfo?.toMap(),
    };
  }

  UserModel fromMap(Map<String, dynamic> map) {
    if (map == null) return null;
    return UserModel(
      token: map['token'],
      isLogin: map['isLogin'],
      userInfo: UserInfo.fromMap(map['userInfo']),
    );
  }
}
