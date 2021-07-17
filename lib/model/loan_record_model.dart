import 'dart:convert';

import 'package:daichao/model/base_model.dart';
import 'package:flutter/foundation.dart';

class LoanRecordModel extends BaseModel {
  final List<MyloanList> myloanList;
  LoanRecordModel({
    this.myloanList,
  });

  LoanRecordModel copyWith({
    List<MyloanList> myloanList,
  }) {
    return LoanRecordModel(
      myloanList: myloanList ?? this.myloanList,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'myloanList': myloanList?.map((x) => x.toMap())?.toList(),
    };
  }

  LoanRecordModel fromMap(Map<String, dynamic> map) {
    return LoanRecordModel(
      myloanList: List<MyloanList>.from(map['myloanList']?.map((x) => MyloanList.fromMap(x))),
    );
  }

  String toJson() => json.encode(toMap());

  factory LoanRecordModel.fromJson(String source) => LoanRecordModel().fromMap(json.decode(source));

  @override
  String toString() => 'LoanRecordModel(myloanList: $myloanList)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is LoanRecordModel && listEquals(other.myloanList, myloanList);
  }

  @override
  int get hashCode => myloanList.hashCode;
}

class MyloanList {
  final int loan_id;
  final int loan_amount;
  final int loan_date;
  final double repay_amount;
  final int repay_time;
  final String approval_status;
  final int checked_time;
  final int createtime;
  MyloanList({
    this.loan_id,
    this.loan_amount,
    this.loan_date,
    this.repay_amount,
    this.repay_time,
    this.approval_status,
    this.checked_time,
    this.createtime,
  });

  MyloanList copyWith({
    int loan_id,
    int loan_amount,
    int loan_date,
    double repay_amount,
    int repay_time,
    String approval_status,
    int checked_time,
    int createtime,
  }) {
    return MyloanList(
      loan_id: loan_id ?? this.loan_id,
      loan_amount: loan_amount ?? this.loan_amount,
      loan_date: loan_date ?? this.loan_date,
      repay_amount: repay_amount ?? this.repay_amount,
      repay_time: repay_time ?? this.repay_time,
      approval_status: approval_status ?? this.approval_status,
      checked_time: checked_time ?? this.checked_time,
      createtime: createtime ?? this.createtime,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'loan_id': loan_id,
      'loan_amount': loan_amount,
      'loan_date': loan_date,
      'repay_amount': repay_amount,
      'repay_time': repay_time,
      'approval_status': approval_status,
      'checked_time': checked_time,
      'createtime': createtime,
    };
  }

  factory MyloanList.fromMap(Map<String, dynamic> map) {
    return MyloanList(
      loan_id: map['loan_id']?.toInt(),
      loan_amount: map['loan_amount']?.toInt(),
      loan_date: map['loan_date']?.toInt(),
      repay_amount: map['repay_amount']?.toDouble(),
      repay_time: map['repay_time']?.toInt(),
      approval_status: map['approval_status'],
      checked_time: map['checked_time']?.toInt(),
      createtime: map['createtime']?.toInt(),
    );
  }

  String toJson() => json.encode(toMap());

  factory MyloanList.fromJson(String source) => MyloanList.fromMap(json.decode(source));

  @override
  String toString() {
    return 'MyloanList(loan_id: $loan_id, loan_amount: $loan_amount, loan_date: $loan_date, repay_amount: $repay_amount, repay_time: $repay_time, approval_status: $approval_status, checked_time: $checked_time,createtime:$createtime)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is MyloanList &&
        other.loan_id == loan_id &&
        other.loan_amount == loan_amount &&
        other.loan_date == loan_date &&
        other.repay_amount == repay_amount &&
        other.repay_time == repay_time &&
        other.approval_status == approval_status &&
        other.checked_time == checked_time &&
        other.createtime == createtime;
  }

  @override
  int get hashCode {
    return loan_id.hashCode ^
        loan_amount.hashCode ^
        loan_date.hashCode ^
        repay_amount.hashCode ^
        repay_time.hashCode ^
        approval_status.hashCode ^
        checked_time.hashCode ^
        createtime.hashCode;
  }
}
