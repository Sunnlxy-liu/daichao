import 'dart:convert';
import 'package:daichao/model/base_model.dart';
import 'package:flutter/foundation.dart';

class SuggestSpeedModel extends BaseModel {
  final List<MySuggestSpeedInfo> mySuggestSpeedInfo;
  SuggestSpeedModel({
    this.mySuggestSpeedInfo,
  });

  SuggestSpeedModel copyWith({
    List<MySuggestSpeedInfo> mySuggestSpeedInfo,
  }) {
    return SuggestSpeedModel(
      mySuggestSpeedInfo: mySuggestSpeedInfo ?? this.mySuggestSpeedInfo,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'mySuggestSpeedInfo': mySuggestSpeedInfo?.map((x) => x.toMap())?.toList(),
    };
  }

  SuggestSpeedModel fromMap(Map<String, dynamic> map) {
    return SuggestSpeedModel(
      mySuggestSpeedInfo:
          List<MySuggestSpeedInfo>.from(map['mySuggestSpeedInfo']?.map((x) => MySuggestSpeedInfo.fromMap(x))),
    );
  }

  String toJson() => json.encode(toMap());

  factory SuggestSpeedModel.fromJson(String source) => SuggestSpeedModel().fromMap(json.decode(source));

  @override
  String toString() => 'SuggestSpeedModel(mySuggestSpeedInfo: $mySuggestSpeedInfo)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is SuggestSpeedModel && listEquals(other.mySuggestSpeedInfo, mySuggestSpeedInfo);
  }

  @override
  int get hashCode => mySuggestSpeedInfo.hashCode;
}

class MySuggestSpeedInfo {
  final int createtime;
  final String speedName;
  final int status;
  MySuggestSpeedInfo({
    this.createtime,
    this.speedName,
    this.status,
  });

  MySuggestSpeedInfo copyWith({
    int createtime,
    String speedName,
    int status,
  }) {
    return MySuggestSpeedInfo(
      createtime: createtime ?? this.createtime,
      speedName: speedName ?? this.speedName,
      status: status ?? this.status,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'createtime': createtime,
      'speedName': speedName,
      'status': status,
    };
  }

  factory MySuggestSpeedInfo.fromMap(Map<String, dynamic> map) {
    return MySuggestSpeedInfo(
      createtime: map['createtime']?.toInt(),
      speedName: map['speedName'],
      status: map['status']?.toInt(),
    );
  }

  String toJson() => json.encode(toMap());

  factory MySuggestSpeedInfo.fromJson(String source) => MySuggestSpeedInfo.fromMap(json.decode(source));

  @override
  String toString() => 'MySuggestSpeedInfo(createtime: $createtime, speedName: $speedName, status: $status)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is MySuggestSpeedInfo &&
        other.createtime == createtime &&
        other.speedName == speedName &&
        other.status == status;
  }

  @override
  int get hashCode => createtime.hashCode ^ speedName.hashCode ^ status.hashCode;
}
