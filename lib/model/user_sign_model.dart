import 'dart:convert';

import 'package:daichao/model/base_model.dart';
import 'package:flutter/foundation.dart';

class UserSignModel extends BaseModel {
  final SignInfo signInfo;
  UserSignModel({
    this.signInfo,
  });

  UserSignModel copyWith({
    SignInfo signInfo,
  }) {
    return UserSignModel(
      signInfo: signInfo ?? this.signInfo,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'signInfo': signInfo.toMap(),
    };
  }

  UserSignModel fromMap(Map<String, dynamic> map) {
    return UserSignModel(
      signInfo: SignInfo.fromMap(map['signInfo']),
    );
  }

  String toJson() => json.encode(toMap());

  factory UserSignModel.fromJson(String source) => UserSignModel().fromMap(json.decode(source));

  @override
  String toString() => 'UserSignModel(signInfo: $signInfo)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is UserSignModel && other.signInfo == signInfo;
  }

  @override
  int get hashCode => signInfo.hashCode;
}

class SignInfo {
  final List<String> sevenDays;
  final int continueSign;
  final int tomorrowScore;
  final int newScore;
  final bool todayIsSigned;
  SignInfo({
    this.sevenDays,
    this.continueSign,
    this.tomorrowScore,
    this.newScore,
    this.todayIsSigned,
  });

  SignInfo copyWith({
    List<String> sevenDays,
    int continueSign,
    int tomorrowScore,
    int newScore,
    bool todayIsSigned,
  }) {
    return SignInfo(
      sevenDays: sevenDays ?? this.sevenDays,
      continueSign: continueSign ?? this.continueSign,
      tomorrowScore: tomorrowScore ?? this.tomorrowScore,
      newScore: newScore ?? this.newScore,
      todayIsSigned: todayIsSigned ?? this.todayIsSigned,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'sevenDays': sevenDays,
      'continueSign': continueSign,
      'tomorrowScore': tomorrowScore,
      'newScore': newScore,
      'todayIsSigned': todayIsSigned,
    };
  }

  factory SignInfo.fromMap(Map<String, dynamic> map) {
    return SignInfo(
        sevenDays: List<String>.from(map['sevenDays']),
        continueSign: map['continueSign']?.toInt(),
        tomorrowScore: map['tomorrowScore']?.toInt(),
        newScore: map['newScore']?.toInt(),
        todayIsSigned: map['todayIsSigned']);
  }

  String toJson() => json.encode(toMap());

  factory SignInfo.fromJson(String source) => SignInfo.fromMap(json.decode(source));

  @override
  String toString() {
    return 'SignInfo(sevenDays: $sevenDays, continueSign: $continueSign, tomorrowScore: $tomorrowScore, newScore: $newScore,todayIsSigned:$todayIsSigned,)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is SignInfo &&
        listEquals(other.sevenDays, sevenDays) &&
        other.continueSign == continueSign &&
        other.tomorrowScore == tomorrowScore &&
        other.newScore == newScore &&
        other.todayIsSigned == todayIsSigned;
  }

  @override
  int get hashCode {
    return sevenDays.hashCode ^
        continueSign.hashCode ^
        tomorrowScore.hashCode ^
        newScore.hashCode ^
        todayIsSigned.hashCode;
  }
}
