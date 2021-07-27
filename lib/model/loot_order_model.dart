import 'dart:convert';

import 'package:daichao/model/base_model.dart';
import 'package:flutter/foundation.dart';

class LootOrderModel extends BaseModel {
  final List<MyLootInfo> myLootInfo;
  LootOrderModel({
    this.myLootInfo,
  });

  LootOrderModel copyWith({
    List<MyLootInfo> myLootInfo,
  }) {
    return LootOrderModel(
      myLootInfo: myLootInfo ?? this.myLootInfo,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'myLootInfo': myLootInfo?.map((x) => x.toMap())?.toList(),
    };
  }

  LootOrderModel fromMap(Map<String, dynamic> map) {
    return LootOrderModel(
      myLootInfo: List<MyLootInfo>.from(map['myLootInfo']?.map((x) => MyLootInfo.fromMap(x))),
    );
  }

  String toJson() => json.encode(toMap());

  factory LootOrderModel.fromJson(String source) => LootOrderModel().fromMap(json.decode(source));

  @override
  String toString() => 'LootOrderModel(myLootInfo: $myLootInfo)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is LootOrderModel && listEquals(other.myLootInfo, myLootInfo);
  }

  @override
  int get hashCode => myLootInfo.hashCode;
}

class MyLootInfo {
  final int id;
  final String gname;
  final String gsname;
  final String keywords;
  final String thumbImage;
  final String price;
  final int total;
  final int participateTotal;
  final int winTotal;
  final int status;
  final int winRate;
  final int openTime;
  final int createTime;
  MyLootInfo({
    this.id,
    this.gname,
    this.gsname,
    this.keywords,
    this.thumbImage,
    this.price,
    this.total,
    this.participateTotal,
    this.winTotal,
    this.status,
    this.winRate,
    this.openTime,
    this.createTime,
  });

  MyLootInfo copyWith({
    int id,
    String gname,
    String gsname,
    String keywords,
    String thumbImage,
    String price,
    int total,
    int participateTotal,
    int winTotal,
    int status,
    int winRate,
    int openTime,
    int createTime,
  }) {
    return MyLootInfo(
      id: id ?? this.id,
      gname: gname ?? this.gname,
      gsname: gsname ?? this.gsname,
      keywords: keywords ?? this.keywords,
      thumbImage: thumbImage ?? this.thumbImage,
      price: price ?? this.price,
      total: total ?? this.total,
      participateTotal: participateTotal ?? this.participateTotal,
      winTotal: winTotal ?? this.winTotal,
      status: status ?? this.status,
      winRate: winRate ?? this.winRate,
      openTime: openTime ?? this.openTime,
      createTime: createTime ?? this.createTime,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'gname': gname,
      'gsname': gsname,
      'keywords': keywords,
      'thumbImage': thumbImage,
      'price': price,
      'total': total,
      'participateTotal': participateTotal,
      'winTotal': winTotal,
      'status': status,
      'winRate': winRate,
      'openTime': openTime,
      'createTime': createTime,
    };
  }

  factory MyLootInfo.fromMap(Map<String, dynamic> map) {
    return MyLootInfo(
      id: map['id']?.toInt(),
      gname: map['gname'],
      gsname: map['gsname'],
      keywords: map['keywords'],
      thumbImage: map['thumbImage'],
      price: map['price'],
      total: map['total']?.toInt(),
      participateTotal: map['participateTotal']?.toInt(),
      winTotal: map['winTotal']?.toInt(),
      status: map['status']?.toInt(),
      winRate: map['winRate']?.toInt(),
      openTime: map['openTime']?.toInt(),
      createTime: map['createTime']?.toInt(),
    );
  }

  String toJson() => json.encode(toMap());

  factory MyLootInfo.fromJson(String source) => MyLootInfo.fromMap(json.decode(source));

  @override
  String toString() {
    return 'MyLootInfo(id: $id, gname: $gname, gsname: $gsname, keywords: $keywords, thumbImage: $thumbImage, price: $price, total: $total, participateTotal: $participateTotal, winTotal: $winTotal, status: $status, winRate: $winRate, openTime: $openTime, createTime: $createTime)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is MyLootInfo &&
        other.id == id &&
        other.gname == gname &&
        other.gsname == gsname &&
        other.keywords == keywords &&
        other.thumbImage == thumbImage &&
        other.price == price &&
        other.total == total &&
        other.participateTotal == participateTotal &&
        other.winTotal == winTotal &&
        other.status == status &&
        other.winRate == winRate &&
        other.openTime == openTime &&
        other.createTime == createTime;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        gname.hashCode ^
        gsname.hashCode ^
        keywords.hashCode ^
        thumbImage.hashCode ^
        price.hashCode ^
        total.hashCode ^
        participateTotal.hashCode ^
        winTotal.hashCode ^
        status.hashCode ^
        winRate.hashCode ^
        openTime.hashCode ^
        createTime.hashCode;
  }
}
