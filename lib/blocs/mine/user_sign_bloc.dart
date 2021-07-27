import 'package:daichao/common/bloc/base_bloc.dart';
import 'package:daichao/common/bloc/base_event.dart';
import 'package:daichao/common/bloc/base_state.dart';
import 'package:daichao/common/net/net_api.dart';
import 'package:daichao/model/user_sign_model.dart';
import 'package:daichao/utils/toast_utils.dart';

class DoSignEvent extends BaseEvent {}

class GetSignInfoEvent extends BaseEvent {
  final String content;
  GetSignInfoEvent({this.content});
}

class SuccessSignState extends SuccessState {
  UserSignModel model;
  SuccessSignState(this.model);
}

class AddSuccessMyAddressState extends SuccessState {}

class SignBloc extends BaseBloc {
  @override
  void onMapEventToState() {
    e2s(GetSignInfoEvent, getSignData);
    e2s(DoSignEvent, doSignData);
  }

  Stream<BaseState> getSignData(GetSignInfoEvent event) async* {
    yield LoadingToastState(loadingText: '添加中...');
    try {
      UserSignModel signModel = await NetApi.getSignInfo();
      yield SuccessSignState(signModel);
    } catch (error) {
      ToastUtils.showToastMsg(error.msg);
    }
  }

  Stream<BaseState> doSignData(DoSignEvent event) async* {
    yield LoadingToastState(loadingText: '加载中...');
    try {
      UserSignModel signInfoModel = await NetApi.doSign(params: {
        "click": true,
      });
      if (signInfoModel == null || signInfoModel.signInfo.sevenDays.length == 0) {
        yield NoDataState(msg: '无签到进度');
      } else {
        yield SuccessSignState(signInfoModel);
      }
    } catch (error) {
      ToastUtils.showToastMsg(error.msg);
    }
  }
}
