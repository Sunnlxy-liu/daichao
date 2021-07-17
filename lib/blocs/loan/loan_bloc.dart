import 'package:daichao/common/bloc/base_bloc.dart';
import 'package:daichao/common/bloc/base_event.dart';
import 'package:daichao/common/bloc/base_state.dart';
import 'package:daichao/common/net/net_api.dart';
import 'package:daichao/data/repository/user_repository.dart';
import 'package:daichao/model/loan_list_model.dart';
import 'package:daichao/model/loan_record_model.dart';
import 'package:daichao/model/loan_type_model.dart';

class GetDataEvent extends BaseEvent {}

class SelectItemEvent extends BaseEvent {
  final int typeId;
  SelectItemEvent(this.typeId);
}

class ItemLoadingState extends BaseState {}

class ItemErrorState extends BaseState {}

class SelectResultState extends BaseState {
  final int totalNum;
  final List<LoanList> lists;
  SelectResultState(this.totalNum, this.lists);
}

class SuccessDataState extends BaseState {
  final List<TypeBeen> items;
  final int totalNum;
  final List<LoanList> lists;
  SuccessDataState(this.items, this.totalNum, this.lists);
}

class LoanBloc extends BaseBloc {
  @override
  void onMapEventToState() {
    e2s(GetDataEvent, doGetData);
    e2s(SelectItemEvent, doSelectItem);
  }

  Stream<BaseState> doGetData(GetDataEvent event) async* {
    yield LoadingState();
    try {
      // 分类接口
      LoanTypeModel model = await NetApi.getDkTypes(params: {"page": "list"});
      List<TypeBeen> items = model.loanTypeList.map((e) => TypeBeen(e.name, e.id)).toList();
      // 获取分类1对应的列表数据
      int id = model.loanTypeList[0].id;
      LoanListModel listModel = await NetApi.getDkList(params: {"page": "list", "typeid": id});
      List<LoanList> list = listModel.loanList;
      yield SuccessDataState(items, listModel.total, list);
    } catch (error) {
      // 异常
      yield NetErrorState();
    }
  }

  Stream<BaseState> doSelectItem(SelectItemEvent event) async* {
    yield LoadingToastState();
    try {
      // 获取分类1对应的列表数据
      LoanListModel listModel = await NetApi.getDkList(params: {"page": "list", "typeid": event.typeId});
      List<LoanList> list = listModel.loanList;
      yield SelectResultState(listModel.total, list);
    } catch (error) {
      // 异常
      yield ItemErrorState();
    }
  }
}

class TypeBeen {
  final String name;
  final int id;
  TypeBeen(this.name, this.id);
}
