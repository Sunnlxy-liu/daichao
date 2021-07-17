import 'package:daichao/common/bloc/base_bloc.dart';
import 'package:daichao/common/bloc/base_event.dart';
import 'package:daichao/common/bloc/base_state.dart';
import 'package:daichao/common/net/net_api.dart';
import 'package:daichao/data/repository/user_repository.dart';
import 'package:daichao/model/loan_record_model.dart';

class GetLoanRecordEvent extends BaseEvent {}

class SuccessLoanRecordState extends SuccessState {
  LoanRecordModel model;
  SuccessLoanRecordState(this.model);
}

class LoanRecordBloc extends BaseBloc {
  @override
  void onMapEventToState() {
    e2s(GetLoanRecordEvent, doGetLoanRecordData);
  }

  Stream<BaseState> doGetLoanRecordData(GetLoanRecordEvent event) async* {
    yield LoadingToastState(loadingText: '加载中...');
    try {
      LoanRecordModel loanListModel = await NetApi.getDkRecord();
      if (loanListModel == null || loanListModel.myloanList.length == 0) {
        yield NoDataState(msg: '无贷款记录！');
      } else {
        yield SuccessLoanRecordState(loanListModel);
      }
    } catch (error) {
      yield ShowToastState(error.msg);
    }
  }
}
