import 'dart:math';
import 'dart:convert';
import 'package:crypto/crypto.dart';
import 'package:daichao/common/bloc/base_bloc.dart';
import 'package:daichao/common/bloc/base_event.dart';
import 'package:daichao/common/bloc/base_state.dart';
import 'package:daichao/model/home_banner_model.dart';
import 'package:daichao/model/net_error_model.dart';

class UserBloc extends BaseBloc {
  @override
  void onMapEventToState() {
    // e2s(VerifyCodeEvent, doVerifyCodeData);
  }

  // Stream<BaseState> doVerifyCodeData(VerifyCodeEvent event) async* {
  // yield ReadyState();
  // try {
  //   int nNonce = getNonce();
  //   String sign = getSign(nNonce, event);
  //   List path = [event.phone, event.smsType, nNonce.toString(), sign];
  //   // await NetUtils().request(Address.apiAuthCode, VerifyCodeMsgModel(), path: path);
  //   yield SuccessState();
  // } on NetErrorModel catch (error) {
  //   if (error.code == 700) {
  //     // 网络异常
  //     yield NetErrorState();
  //   } else {
  //     // 服务器异常
  //     yield ServerErrorState();
  //   }
  // }
  // }

}
