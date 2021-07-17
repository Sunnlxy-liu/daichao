import 'dart:convert';

import 'package:daichao/model/user_info_model.dart';

class UserModel {
  String token;
  bool isLogin;
  UserInfo userInfo;
  UserModel({
    this.isLogin = false,
    this.token,
    this.userInfo,
  });

  UserModel copyWith({
    String token,
    bool isLogin,
    UserInfo userInfo,
  }) {
    return UserModel(
      token: token ?? this.token,
      isLogin: isLogin ?? this.isLogin,
      userInfo: userInfo ?? this.userInfo,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'token': token,
      'isLogin': isLogin,
      'userInfo': userInfo.toMap(),
    };
  }

  UserModel fromMap(Map<String, dynamic> map) {
    return UserModel(
      token: map['token'],
      isLogin: map['isLogin'],
      userInfo: UserInfo.fromMap(map['userInfo']),
    );
  }

  String toJson() => json.encode(toMap());

  factory UserModel.fromJson(String source) => UserModel().fromMap(json.decode(source));

  @override
  String toString() => 'UserModel(userInfo: $userInfo)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is UserModel && other.userInfo == userInfo;
  }

  @override
  int get hashCode => userInfo.hashCode;
}
