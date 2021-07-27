import 'package:daichao/common/bloc/base_bloc.dart';
import 'package:daichao/common/bloc/base_event.dart';
import 'package:daichao/common/bloc/base_state.dart';
import 'package:daichao/common/net/net_api.dart';
import 'package:daichao/model/myaddress_model.dart';
import 'package:daichao/model/suggest_speed_model.dart';
import 'package:daichao/utils/toast_utils.dart';

class GetMyAddressEvent extends BaseEvent {}

class AddSuggestEvent extends BaseEvent {
  final String content;
  AddSuggestEvent({this.content});
}

class SuccessMyAddressState extends SuccessState {
  MyAddressModel model;
  SuccessMyAddressState(this.model);
}

class SuggestSpeedEvent extends BaseEvent {}

class SuccessSuggestSpeedState extends SuccessState {
  final SuggestSpeedModel model;
  SuccessSuggestSpeedState(this.model);
}

class AddSuccessMyAddressState extends SuccessState {}

class SuggestBloc extends BaseBloc {
  @override
  void onMapEventToState() {
    e2s(AddSuggestEvent, doAddSuggestData);
    e2s(SuggestSpeedEvent, getSuggestSpeedData);
  }

  Stream<BaseState> doAddSuggestData(AddSuggestEvent event) async* {
    yield LoadingToastState(loadingText: '添加中...');
    try {
      await NetApi.addSuggest(params: {
        "content": event.content,
      });
      ToastUtils.showToastMsg("感谢提交~");
      yield SuccessState();
    } catch (error) {
      ToastUtils.showToastMsg(error.msg);
      yield ShowToastState(error.msg);
    }
  }

  Stream<BaseState> getSuggestSpeedData(SuggestSpeedEvent event) async* {
    yield LoadingToastState(loadingText: '加载中...');
    try {
      SuggestSpeedModel suggestSpeedModel = await NetApi.suggestSpeed();
      if (suggestSpeedModel == null || suggestSpeedModel.mySuggestSpeedInfo.length == 0) {
        yield NoDataState(msg: '无反馈进度');
      } else {
        yield SuccessSuggestSpeedState(suggestSpeedModel);
      }
    } catch (error) {
      ToastUtils.showToastMsg(error.msg);
      yield ShowToastState(error.msg);
    }
  }
}
