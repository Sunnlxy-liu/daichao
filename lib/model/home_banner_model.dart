import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:daichao/model/base_model.dart';

class HomeBannerModel extends BaseModel {
  final int code;
  final List<AdverList> adverList;
  HomeBannerModel({
    this.code,
    this.adverList,
  });

  HomeBannerModel copyWith({
    int code,
    List<AdverList> adverList,
  }) {
    return HomeBannerModel(
      code: code ?? this.code,
      adverList: adverList ?? this.adverList,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'code': code,
      'adverList': adverList?.map((x) => x.toMap())?.toList(),
    };
  }

  HomeBannerModel fromMap(Map<String, dynamic> map) {
    return HomeBannerModel(
      code: map['code']?.toInt(),
      adverList: List<AdverList>.from(map['adverList']?.map((x) => AdverList.fromMap(x))),
    );
  }

  String toJson() => json.encode(toMap());

  HomeBannerModel fromJson(String source) => fromMap(json.decode(source));

  @override
  String toString() => 'HomeBannerModel(code: $code, adverList: $adverList)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is HomeBannerModel && other.code == code && listEquals(other.adverList, adverList);
  }

  @override
  int get hashCode => code.hashCode ^ adverList.hashCode;
}

class AdverList {
  final String name;
  final String coverimage;
  final String link_address;
  AdverList({
    this.name,
    this.coverimage,
    this.link_address,
  });

  AdverList copyWith({
    String name,
    String coverimage,
    String link_address,
  }) {
    return AdverList(
      name: name ?? this.name,
      coverimage: coverimage ?? this.coverimage,
      link_address: link_address ?? this.link_address,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'coverimage': coverimage,
      'link_address': link_address,
    };
  }

  factory AdverList.fromMap(Map<String, dynamic> map) {
    return AdverList(
      name: map['name'],
      coverimage: map['coverimage'],
      link_address: map['link_address'],
    );
  }

  String toJson() => json.encode(toMap());

  AdverList fromJson(String source) => AdverList.fromMap(json.decode(source));

  @override
  String toString() => 'AdverList(name: $name, coverimage: $coverimage, link_address: $link_address)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is AdverList &&
        other.name == name &&
        other.coverimage == coverimage &&
        other.link_address == link_address;
  }

  @override
  int get hashCode => name.hashCode ^ coverimage.hashCode ^ link_address.hashCode;
}
