import 'dart:convert';

import 'package:daichao/model/base_model.dart';
import 'package:flutter/foundation.dart';

class BannerAdverModel extends BaseModel {
  final List<AdverList> adverList;
  BannerAdverModel({
    this.adverList,
  });

  BannerAdverModel copyWith({
    List<AdverList> adverList,
  }) {
    return BannerAdverModel(
      adverList: adverList ?? this.adverList,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'adverList': adverList?.map((x) => x.toMap())?.toList(),
    };
  }

  BannerAdverModel fromMap(Map<String, dynamic> map) {
    return BannerAdverModel(
      adverList: List<AdverList>.from(map['adverList']?.map((x) => AdverList.fromMap(x))),
    );
  }

  String toJson() => json.encode(toMap());

  factory BannerAdverModel.fromJson(String source) => BannerAdverModel().fromMap(json.decode(source));

  @override
  String toString() => 'BannerAdverModel(adverList: $adverList)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is BannerAdverModel && listEquals(other.adverList, adverList);
  }

  @override
  int get hashCode => adverList.hashCode;
}

class AdverList {
  final String name;
  final String coverImage;
  final String link;
  AdverList({
    this.name,
    this.coverImage,
    this.link,
  });

  AdverList copyWith({
    String name,
    String coverImage,
    String link,
  }) {
    return AdverList(
      name: name ?? this.name,
      coverImage: coverImage ?? this.coverImage,
      link: link ?? this.link,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'coverImage': coverImage,
      'link': link,
    };
  }

  factory AdverList.fromMap(Map<String, dynamic> map) {
    return AdverList(
      name: map['name'],
      coverImage: map['coverImage'],
      link: map['link'],
    );
  }

  String toJson() => json.encode(toMap());

  factory AdverList.fromJson(String source) => AdverList.fromMap(json.decode(source));

  @override
  String toString() => 'AdverList(name: $name, coverImage: $coverImage, link: $link)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is AdverList && other.name == name && other.coverImage == coverImage && other.link == link;
  }

  @override
  int get hashCode => name.hashCode ^ coverImage.hashCode ^ link.hashCode;
}
