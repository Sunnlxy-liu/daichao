import 'dart:convert';
import 'package:daichao/model/base_model.dart';
import 'package:flutter/foundation.dart';

class LuckUsersModel extends BaseModel {
  final List<LucksList> lucksList;
  LuckUsersModel({
    this.lucksList,
  });

  LuckUsersModel copyWith({
    List<LucksList> lucksList,
  }) {
    return LuckUsersModel(
      lucksList: lucksList ?? this.lucksList,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'lucksList': lucksList?.map((x) => x.toMap())?.toList(),
    };
  }

  LuckUsersModel fromMap(Map<String, dynamic> map) {
    return LuckUsersModel(
      lucksList: List<LucksList>.from(map['lucksList']?.map((x) => LucksList.fromMap(x))),
    );
  }

  String toJson() => json.encode(toMap());

  factory LuckUsersModel.fromJson(String source) => LuckUsersModel().fromMap(json.decode(source));

  @override
  String toString() => 'LuckUsersModel(lucksList: $lucksList)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is LuckUsersModel && listEquals(other.lucksList, lucksList);
  }

  @override
  int get hashCode => lucksList.hashCode;
}

class LucksList {
  final String time;
  final String username;
  final String avatar;
  final String goodsname;
  LucksList({
    this.time,
    this.username,
    this.avatar,
    this.goodsname,
  });

  LucksList copyWith({
    String time,
    String username,
    String avatar,
    String goodsname,
  }) {
    return LucksList(
      time: time ?? this.time,
      username: username ?? this.username,
      avatar: avatar ?? this.avatar,
      goodsname: goodsname ?? this.goodsname,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'time': time,
      'username': username,
      'avatar': avatar,
      'goodsname': goodsname,
    };
  }

  factory LucksList.fromMap(Map<String, dynamic> map) {
    return LucksList(
      time: map['time'],
      username: map['username'],
      avatar: map['avatar'],
      goodsname: map['goodsname'],
    );
  }

  String toJson() => json.encode(toMap());

  factory LucksList.fromJson(String source) => LucksList.fromMap(json.decode(source));

  @override
  String toString() {
    return 'LucksList(time: $time, username: $username, avatar: $avatar, goodsname: $goodsname)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is LucksList &&
        other.time == time &&
        other.username == username &&
        other.avatar == avatar &&
        other.goodsname == goodsname;
  }

  @override
  int get hashCode {
    return time.hashCode ^ username.hashCode ^ avatar.hashCode ^ goodsname.hashCode;
  }
}
