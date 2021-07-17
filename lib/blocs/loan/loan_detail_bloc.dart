import 'package:daichao/common/bloc/base_bloc.dart';
import 'package:daichao/common/bloc/base_event.dart';
import 'package:daichao/common/bloc/base_state.dart';
import 'package:daichao/common/net/net_api.dart';
import 'package:daichao/model/loan_detail_model.dart';

class GetDataEvent extends BaseEvent {
  final int id;
  GetDataEvent(this.id);
}

class SuccessDataState extends BaseState {
  final LoanInfo info;
  SuccessDataState(this.info);
}

class LoanDetailBloc extends BaseBloc {
  @override
  void onMapEventToState() {
    e2s(GetDataEvent, doGetData);
  }

  Stream<BaseState> doGetData(GetDataEvent event) async* {
    yield LoadingState();
    try {
      // 贷款详情
      LoanDetailModel model = await NetApi.getDkDetails(params: {"id": event.id});
      yield SuccessDataState(model.loanInfo);
    } catch (error) {
      // 异常
      yield NetErrorState();
    }
  }
}
