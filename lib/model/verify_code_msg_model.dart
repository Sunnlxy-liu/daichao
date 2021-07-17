import 'dart:convert';
import 'package:daichao/model/base_model.dart';

class VerifyCodeMsgModel extends BaseModel {
  final int code;
  final String msg;
  VerifyCodeMsgModel({
    this.code,
    this.msg,
  });

  VerifyCodeMsgModel copyWith({
    int code,
    String msg,
  }) {
    return VerifyCodeMsgModel(
      code: code ?? this.code,
      msg: msg ?? this.msg,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'code': code,
      'msg': msg,
    };
  }

  VerifyCodeMsgModel fromMap(Map<String, dynamic> map) {
    if (map == null) return null;

    return VerifyCodeMsgModel(
      code: map['code']?.toInt(),
      msg: map['msg'],
    );
  }

  String toJson() => json.encode(toMap());

  VerifyCodeMsgModel fromJson(String source) => fromMap(json.decode(source));

  @override
  String toString() => 'VerifyCodeMsgModel code: $code, msg: $msg';

  @override
  bool operator ==(Object o) {
    if (identical(this, o)) return true;

    return o is VerifyCodeMsgModel && o.code == code && o.msg == msg;
  }

  // @override
  // int get hashCode => code.hashCode ^ msg.hashCode;
}
