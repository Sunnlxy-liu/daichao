import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:daichao/model/base_model.dart';

class LoanTypeModel extends BaseModel {
  final List<LoanTypeList> loanTypeList;
  LoanTypeModel({
    this.loanTypeList,
  });

  LoanTypeModel copyWith({
    List<LoanTypeList> loanTypeList,
  }) {
    return LoanTypeModel(
      loanTypeList: loanTypeList ?? this.loanTypeList,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'loanTypeList': loanTypeList?.map((x) => x.toMap())?.toList(),
    };
  }

  LoanTypeModel fromMap(Map<String, dynamic> map) {
    return LoanTypeModel(
      loanTypeList: List<LoanTypeList>.from(map['loanTypeList']?.map((x) => LoanTypeList.fromMap(x))),
    );
  }

  String toJson() => json.encode(toMap());

  factory LoanTypeModel.fromJson(String source) => LoanTypeModel().fromMap(json.decode(source));

  @override
  String toString() => 'LoanTypeModel(loanTypeList: $loanTypeList)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    // final listEquals = const DeepCollectionEquality().equals;

    return other is LoanTypeModel && listEquals(other.loanTypeList, loanTypeList);
  }

  @override
  int get hashCode => loanTypeList.hashCode;
}

class LoanTypeList {
  final int id;
  final String name;
  final String page;
  final int order;
  final int isH5;
  final int status;
  final String thumbImage;
  LoanTypeList({
    this.id,
    this.name,
    this.page,
    this.order,
    this.isH5,
    this.status,
    this.thumbImage,
  });

  LoanTypeList copyWith({
    int id,
    String name,
    String page,
    int order,
    int isH5,
    int status,
    String thumbImage,
  }) {
    return LoanTypeList(
      id: id ?? this.id,
      name: name ?? this.name,
      page: page ?? this.page,
      order: order ?? this.order,
      isH5: isH5 ?? this.isH5,
      status: status ?? this.status,
      thumbImage: thumbImage ?? this.thumbImage,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'page': page,
      'order': order,
      'isH5': isH5,
      'status': status,
      'thumbImage': thumbImage,
    };
  }

  factory LoanTypeList.fromMap(Map<String, dynamic> map) {
    return LoanTypeList(
      id: map['id']?.toInt(),
      name: map['name'],
      page: map['page'],
      order: map['order']?.toInt(),
      isH5: map['isH5']?.toInt(),
      status: map['status']?.toInt(),
      thumbImage: map['thumbImage'],
    );
  }

  String toJson() => json.encode(toMap());

  factory LoanTypeList.fromJson(String source) => LoanTypeList.fromMap(json.decode(source));

  @override
  String toString() {
    return 'LoanTypeList(id: $id, name: $name, page: $page, order: $order, isH5: $isH5, status: $status, thumbImage: $thumbImage)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is LoanTypeList &&
        other.id == id &&
        other.name == name &&
        other.page == page &&
        other.order == order &&
        other.isH5 == isH5 &&
        other.status == status &&
        other.thumbImage == thumbImage;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        name.hashCode ^
        page.hashCode ^
        order.hashCode ^
        isH5.hashCode ^
        status.hashCode ^
        thumbImage.hashCode;
  }
}
