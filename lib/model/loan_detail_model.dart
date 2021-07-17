import 'dart:convert';

import 'package:daichao/model/base_model.dart';

class LoanDetailModel extends BaseModel {
  final LoanInfo loanInfo;
  LoanDetailModel({
    this.loanInfo,
  });

  LoanDetailModel copyWith({
    LoanInfo loanInfo,
  }) {
    return LoanDetailModel(
      loanInfo: loanInfo ?? this.loanInfo,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'loanInfo': loanInfo.toMap(),
    };
  }

  LoanDetailModel fromMap(Map<String, dynamic> map) {
    return LoanDetailModel(
      loanInfo: LoanInfo.fromMap(map['loanInfo']),
    );
  }

  String toJson() => json.encode(toMap());

  factory LoanDetailModel.fromJson(String source) => LoanDetailModel().fromMap(json.decode(source));

  @override
  String toString() => 'LoanDetailModel(loanInfo: $loanInfo)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is LoanDetailModel && other.loanInfo == loanInfo;
  }

  @override
  int get hashCode => loanInfo.hashCode;
}

class LoanInfo {
  final int id;
  final String name;
  final int loantypeId;
  final int maxamount;
  final String textmaxamount;
  final String description;
  final String loanMax;
  final String dailyInterest;
  final String interestYear;
  final String tags;
  final String keywords;
  final String thumbImage;
  final String albumImages;
  final String content;
  final String amountJson;
  final String dateJson;
  LoanInfo({
    this.id,
    this.name,
    this.loantypeId,
    this.maxamount,
    this.textmaxamount,
    this.description,
    this.loanMax,
    this.dailyInterest,
    this.interestYear,
    this.tags,
    this.keywords,
    this.thumbImage,
    this.albumImages,
    this.content,
    this.amountJson,
    this.dateJson,
  });

  LoanInfo copyWith({
    int id,
    String name,
    int loantypeId,
    int maxamount,
    String textmaxamount,
    String description,
    String loanMax,
    String dailyInterest,
    String interestYear,
    String tags,
    String keywords,
    String thumbImage,
    String albumImages,
    String content,
    String amountJson,
    String dateJson,
  }) {
    return LoanInfo(
      id: id ?? this.id,
      name: name ?? this.name,
      loantypeId: loantypeId ?? this.loantypeId,
      maxamount: maxamount ?? this.maxamount,
      textmaxamount: textmaxamount ?? this.textmaxamount,
      description: description ?? this.description,
      loanMax: loanMax ?? this.loanMax,
      dailyInterest: dailyInterest ?? this.dailyInterest,
      interestYear: interestYear ?? this.interestYear,
      tags: tags ?? this.tags,
      keywords: keywords ?? this.keywords,
      thumbImage: thumbImage ?? this.thumbImage,
      albumImages: albumImages ?? this.albumImages,
      content: content ?? this.content,
      amountJson: amountJson ?? this.amountJson,
      dateJson: dateJson ?? this.dateJson,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'loantypeId': loantypeId,
      'maxamount': maxamount,
      'textmaxamount': textmaxamount,
      'description': description,
      'loanMax': loanMax,
      'dailyInterest': dailyInterest,
      'interestYear': interestYear,
      'tags': tags,
      'keywords': keywords,
      'thumbImage': thumbImage,
      'albumImages': albumImages,
      'content': content,
      'amountJson': amountJson,
      'dateJson': dateJson,
    };
  }

  factory LoanInfo.fromMap(Map<String, dynamic> map) {
    return LoanInfo(
      id: map['id']?.toInt(),
      name: map['name'],
      loantypeId: map['loantypeId']?.toInt(),
      maxamount: map['maxamount']?.toInt(),
      textmaxamount: map['textmaxamount'],
      description: map['description'],
      loanMax: map['loanMax'],
      dailyInterest: map['dailyInterest'],
      interestYear: map['interestYear'],
      tags: map['tags'],
      keywords: map['keywords'],
      thumbImage: map['thumbImage'],
      albumImages: map['albumImages'],
      content: map['content'],
      amountJson: map['amountJson'],
      dateJson: map['dateJson'],
    );
  }

  String toJson() => json.encode(toMap());

  factory LoanInfo.fromJson(String source) => LoanInfo.fromMap(json.decode(source));

  @override
  String toString() {
    return 'LoanInfo(id: $id, name: $name, loantypeId: $loantypeId, maxamount: $maxamount, textmaxamount: $textmaxamount, description: $description, loanMax: $loanMax, dailyInterest: $dailyInterest, interestYear: $interestYear, tags: $tags, keywords: $keywords, thumbImage: $thumbImage, albumImages: $albumImages, content: $content, amountJson: $amountJson, dateJson: $dateJson)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is LoanInfo &&
        other.id == id &&
        other.name == name &&
        other.loantypeId == loantypeId &&
        other.maxamount == maxamount &&
        other.textmaxamount == textmaxamount &&
        other.description == description &&
        other.loanMax == loanMax &&
        other.dailyInterest == dailyInterest &&
        other.interestYear == interestYear &&
        other.tags == tags &&
        other.keywords == keywords &&
        other.thumbImage == thumbImage &&
        other.albumImages == albumImages &&
        other.content == content &&
        other.amountJson == amountJson &&
        other.dateJson == dateJson;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        name.hashCode ^
        loantypeId.hashCode ^
        maxamount.hashCode ^
        textmaxamount.hashCode ^
        description.hashCode ^
        loanMax.hashCode ^
        dailyInterest.hashCode ^
        interestYear.hashCode ^
        tags.hashCode ^
        keywords.hashCode ^
        thumbImage.hashCode ^
        albumImages.hashCode ^
        content.hashCode ^
        amountJson.hashCode ^
        dateJson.hashCode;
  }
}
