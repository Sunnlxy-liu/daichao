import 'dart:convert';

import 'package:daichao/model/base_model.dart';

class ApplyLoanModel extends BaseModel {
  final LoanApply loanApply;
  ApplyLoanModel({
    this.loanApply,
  });

  ApplyLoanModel copyWith({
    LoanApply loanApply,
  }) {
    return ApplyLoanModel(
      loanApply: loanApply ?? this.loanApply,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'loanApply': loanApply.toMap(),
    };
  }

  ApplyLoanModel fromMap(Map<String, dynamic> map) {
    return ApplyLoanModel(
      loanApply: LoanApply.fromMap(map['loanApply']),
    );
  }

  String toJson() => json.encode(toMap());

  factory ApplyLoanModel.fromJson(String source) => ApplyLoanModel().fromMap(json.decode(source));

  @override
  String toString() => 'ApplyLoanModel(loanApply: $loanApply)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is ApplyLoanModel && other.loanApply == loanApply;
  }

  @override
  int get hashCode => loanApply.hashCode;
}

class LoanApply {
  final String recordNumber;
  final int recordId;
  LoanApply({
    this.recordNumber,
    this.recordId,
  });

  LoanApply copyWith({
    String recordNumber,
    int recordId,
  }) {
    return LoanApply(
      recordNumber: recordNumber ?? this.recordNumber,
      recordId: recordId ?? this.recordId,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'recordNumber': recordNumber,
      'recordId': recordId,
    };
  }

  factory LoanApply.fromMap(Map<String, dynamic> map) {
    return LoanApply(
      recordNumber: map['recordNumber'],
      recordId: map['recordId']?.toInt(),
    );
  }

  String toJson() => json.encode(toMap());

  factory LoanApply.fromJson(String source) => LoanApply.fromMap(json.decode(source));

  @override
  String toString() => 'LoanApply(recordNumber: $recordNumber, recordId: $recordId)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is LoanApply && other.recordNumber == recordNumber && other.recordId == recordId;
  }

  @override
  int get hashCode => recordNumber.hashCode ^ recordId.hashCode;
}
