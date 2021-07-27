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
  final int loanId;
  final int loanAmount;
  final int createtime;
  final int loanDate;
  final double repayAmount;
  final int repayTime;
  final String approvalStatus;
  final int checkedTime;
  MyloanList({
    this.loanId,
    this.loanAmount,
    this.createtime,
    this.loanDate,
    this.repayAmount,
    this.repayTime,
    this.approvalStatus,
    this.checkedTime,
  });

  MyloanList copyWith({
    int loanId,
    int loanAmount,
    int createtime,
    int loanDate,
    double repayAmount,
    int repayTime,
    String approvalStatus,
    int checkedTime,
  }) {
    return MyloanList(
      loanId: loanId ?? this.loanId,
      loanAmount: loanAmount ?? this.loanAmount,
      createtime: createtime ?? this.createtime,
      loanDate: loanDate ?? this.loanDate,
      repayAmount: repayAmount ?? this.repayAmount,
      repayTime: repayTime ?? this.repayTime,
      approvalStatus: approvalStatus ?? this.approvalStatus,
      checkedTime: checkedTime ?? this.checkedTime,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'loanId': loanId,
      'loanAmount': loanAmount,
      'createtime': createtime,
      'loanDate': loanDate,
      'repayAmount': repayAmount,
      'repayTime': repayTime,
      'approvalStatus': approvalStatus,
      'checkedTime': checkedTime,
    };
  }

  factory MyloanList.fromMap(Map<String, dynamic> map) {
    return MyloanList(
      loanId: map['loanId']?.toInt(),
      loanAmount: map['loanAmount']?.toInt(),
      createtime: map['createtime']?.toInt(),
      loanDate: map['loanDate']?.toInt(),
      repayAmount: map['repayAmount']?.toDouble(),
      repayTime: map['repayTime']?.toInt(),
      approvalStatus: map['approvalStatus'],
      checkedTime: map['checkedTime']?.toInt(),
    );
  }

  String toJson() => json.encode(toMap());

  factory MyloanList.fromJson(String source) => MyloanList.fromMap(json.decode(source));

  @override
  String toString() {
    return 'MyloanList(loanId: $loanId, loanAmount: $loanAmount, createtime: $createtime, loanDate: $loanDate, repayAmount: $repayAmount, repayTime: $repayTime, approvalStatus: $approvalStatus, checkedTime: $checkedTime)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is MyloanList &&
        other.loanId == loanId &&
        other.loanAmount == loanAmount &&
        other.createtime == createtime &&
        other.loanDate == loanDate &&
        other.repayAmount == repayAmount &&
        other.repayTime == repayTime &&
        other.approvalStatus == approvalStatus &&
        other.checkedTime == checkedTime;
  }

  @override
  int get hashCode {
    return loanId.hashCode ^
        loanAmount.hashCode ^
        createtime.hashCode ^
        loanDate.hashCode ^
        repayAmount.hashCode ^
        repayTime.hashCode ^
        approvalStatus.hashCode ^
        checkedTime.hashCode;
  }
}
