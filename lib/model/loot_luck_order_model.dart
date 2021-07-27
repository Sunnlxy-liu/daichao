import 'dart:convert';
import 'package:daichao/model/base_model.dart';
import 'package:flutter/foundation.dart';

class LootLuckModel extends BaseModel {
  final List<MyLuckLootInfo> myLuckLootInfo;
  LootLuckModel({
    this.myLuckLootInfo,
  });

  LootLuckModel copyWith({
    List<MyLuckLootInfo> myLuckLootInfo,
  }) {
    return LootLuckModel(
      myLuckLootInfo: myLuckLootInfo ?? this.myLuckLootInfo,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'myLuckLootInfo': myLuckLootInfo?.map((x) => x.toMap())?.toList(),
    };
  }

  LootLuckModel fromMap(Map<String, dynamic> map) {
    return LootLuckModel(
      myLuckLootInfo: List<MyLuckLootInfo>.from(map['myLuckLootInfo']?.map((x) => MyLuckLootInfo.fromMap(x))),
    );
  }

  String toJson() => json.encode(toMap());

  factory LootLuckModel.fromJson(String source) => LootLuckModel().fromMap(json.decode(source));

  @override
  String toString() => 'LootLuckModel(myLuckLootInfo: $myLuckLootInfo)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is LootLuckModel && listEquals(other.myLuckLootInfo, myLuckLootInfo);
  }

  @override
  int get hashCode => myLuckLootInfo.hashCode;
}

class MyLuckLootInfo {
  final int id;
  final String gsname;
  final String thumbImage;
  final String status;
  final int createTime;
  MyLuckLootInfo({
    this.id,
    this.gsname,
    this.thumbImage,
    this.status,
    this.createTime,
  });

  MyLuckLootInfo copyWith({
    int id,
    String gsname,
    String thumbImage,
    String status,
    int createTime,
  }) {
    return MyLuckLootInfo(
      id: id ?? this.id,
      gsname: gsname ?? this.gsname,
      thumbImage: thumbImage ?? this.thumbImage,
      status: status ?? this.status,
      createTime: createTime ?? this.createTime,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'gsname': gsname,
      'thumbImage': thumbImage,
      'status': status,
      'createTime': createTime,
    };
  }

  factory MyLuckLootInfo.fromMap(Map<String, dynamic> map) {
    return MyLuckLootInfo(
      id: map['id']?.toInt(),
      gsname: map['gsname'],
      thumbImage: map['thumbImage'],
      status: map['status'],
      createTime: map['createTime']?.toInt(),
    );
  }

  String toJson() => json.encode(toMap());

  factory MyLuckLootInfo.fromJson(String source) => MyLuckLootInfo.fromMap(json.decode(source));

  @override
  String toString() {
    return 'MyLuckLootInfo(id: $id, gsname: $gsname, thumbImage: $thumbImage, status: $status, createTime: $createTime)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is MyLuckLootInfo &&
        other.id == id &&
        other.gsname == gsname &&
        other.thumbImage == thumbImage &&
        other.status == status &&
        other.createTime == createTime;
  }

  @override
  int get hashCode {
    return id.hashCode ^ gsname.hashCode ^ thumbImage.hashCode ^ status.hashCode ^ createTime.hashCode;
  }
}
