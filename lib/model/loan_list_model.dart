import 'dart:convert';
import 'package:daichao/model/base_model.dart';
import 'package:flutter/foundation.dart';

class LoanListModel extends BaseModel {
  final int total;
  final List<LoanList> loanList;
  LoanListModel({
    this.total,
    this.loanList,
  });

  LoanListModel copyWith({
    int total,
    List<LoanList> loanList,
  }) {
    return LoanListModel(
      total: total ?? this.total,
      loanList: loanList ?? this.loanList,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'total': total,
      'loanList': loanList?.map((x) => x.toMap())?.toList(),
    };
  }

  LoanListModel fromMap(Map<String, dynamic> map) {
    return LoanListModel(
      total: map['total']?.toInt(),
      loanList: List<LoanList>.from(map['loanList']?.map((x) => LoanList.fromMap(x))),
    );
  }

  String toJson() => json.encode(toMap());

  factory LoanListModel.fromJson(String source) => LoanListModel().fromMap(json.decode(source));

  @override
  String toString() => 'LoanListModel(total: $total, loanList: $loanList)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is LoanListModel && other.total == total && listEquals(other.loanList, loanList);
  }

  @override
  int get hashCode => total.hashCode ^ loanList.hashCode;
}

class LoanList {
  final int id;
  final String name;
  final int maxamount;
  final String dailyInterest;
  final String interestYear;
  final double rateYear;
  final String tags;
  final String keywords;
  final String thumbImage;
  final String cname;
  LoanList({
    this.id,
    this.name,
    this.maxamount,
    this.dailyInterest,
    this.interestYear,
    this.rateYear,
    this.tags,
    this.keywords,
    this.thumbImage,
    this.cname,
  });

  LoanList copyWith({
    int id,
    String name,
    int maxamount,
    String dailyInterest,
    String interestYear,
    double rateYear,
    String tags,
    String keywords,
    String thumbImage,
    String cname,
  }) {
    return LoanList(
      id: id ?? this.id,
      name: name ?? this.name,
      maxamount: maxamount ?? this.maxamount,
      dailyInterest: dailyInterest ?? this.dailyInterest,
      interestYear: interestYear ?? this.interestYear,
      rateYear: rateYear ?? this.rateYear,
      tags: tags ?? this.tags,
      keywords: keywords ?? this.keywords,
      thumbImage: thumbImage ?? this.thumbImage,
      cname: cname ?? this.cname,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'maxamount': maxamount,
      'dailyInterest': dailyInterest,
      'interestYear': interestYear,
      'rateYear': rateYear,
      'tags': tags,
      'keywords': keywords,
      'thumbImage': thumbImage,
      'cname': cname,
    };
  }

  factory LoanList.fromMap(Map<String, dynamic> map) {
    return LoanList(
      id: map['id']?.toInt(),
      name: map['name'],
      maxamount: map['maxamount']?.toInt(),
      dailyInterest: map['dailyInterest'],
      interestYear: map['interestYear'],
      rateYear: map['rateYear']?.toDouble(),
      tags: map['tags'],
      keywords: map['keywords'],
      thumbImage: map['thumbImage'],
      cname: map['cname'],
    );
  }

  String toJson() => json.encode(toMap());

  factory LoanList.fromJson(String source) => LoanList.fromMap(json.decode(source));

  @override
  String toString() {
    return 'LoanList(id: $id, name: $name, maxamount: $maxamount, dailyInterest: $dailyInterest, interestYear: $interestYear, rateYear: $rateYear, tags: $tags, keywords: $keywords, thumbImage: $thumbImage, cname: $cname)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is LoanList &&
        other.id == id &&
        other.name == name &&
        other.maxamount == maxamount &&
        other.dailyInterest == dailyInterest &&
        other.interestYear == interestYear &&
        other.rateYear == rateYear &&
        other.tags == tags &&
        other.keywords == keywords &&
        other.thumbImage == thumbImage &&
        other.cname == cname;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        name.hashCode ^
        maxamount.hashCode ^
        dailyInterest.hashCode ^
        interestYear.hashCode ^
        rateYear.hashCode ^
        tags.hashCode ^
        keywords.hashCode ^
        thumbImage.hashCode ^
        cname.hashCode;
  }
}
