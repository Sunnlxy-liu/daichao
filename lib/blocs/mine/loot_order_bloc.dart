import 'package:daichao/common/bloc/base_bloc.dart';
import 'package:daichao/common/bloc/base_event.dart';
import 'package:daichao/common/bloc/base_state.dart';
import 'package:daichao/common/net/net_api.dart';
import 'package:daichao/model/loot_order_model.dart';

class GetMyLootOrderEvent extends BaseEvent {
  final int index;
  GetMyLootOrderEvent({this.index = 0});
}

class SuccessLootOrderState extends SuccessState {
  final List<MyLootInfo> model;
  SuccessLootOrderState(this.model);
}

class SuccessNoPayOrderState extends SuccessState {
  final List<MyLootInfo> model;
  SuccessNoPayOrderState(this.model);
}

class SuccessUnOpendState extends SuccessState {
  final List<MyLootInfo> model;
  SuccessUnOpendState(this.model);
}

class SuccessOpendedOrderState extends SuccessState {
  final List<MyLootInfo> model;
  SuccessOpendedOrderState(this.model);
}

class MyLootOrderBloc extends BaseBloc {
  List<MyLootInfo> lootNoPayOrderList = [];
  List<MyLootInfo> lootedUnOpendOrderList = [];
  List<MyLootInfo> lootedOpendOrderList = [];
  @override
  void onMapEventToState() {
    e2s(GetMyLootOrderEvent, doGetMyAddressData);
  }

  Stream<BaseState> doGetMyAddressData(GetMyLootOrderEvent event) async* {
    yield LoadingToastState(loadingText: '加载中...');
    try {
      LootOrderModel lootorderModel = await NetApi.getMyLootOrder();
      if (lootorderModel == null || lootorderModel.myLootInfo.length == 0) {
        yield NoDataState(msg: '无订单记录');
      } else {
        if (event.index == 1) {
          if (lootorderModel.myLootInfo.length > 0) {
            lootorderModel.myLootInfo.forEach((element) {
              if (element.status == -1) {
                if (!lootNoPayOrderList.contains(element.gname)) {
                  lootNoPayOrderList.add(element);
                }
              }
            });
            if (lootNoPayOrderList != null) {
              yield SuccessNoPayOrderState(lootNoPayOrderList);
            } else {
              yield NoDataState(msg: '无未付款订单记录！');
            }
          } else {
            yield NoDataState(msg: '无未付款订单记录！');
          }
        } else if (event.index == 2) {
          if (lootorderModel.myLootInfo.length > 0) {
            lootorderModel.myLootInfo.forEach((element) {
              if (element.status == 1) {
                if (!lootedUnOpendOrderList.contains(element.gname)) {
                  lootedUnOpendOrderList.add(element);
                }
              }
            });
            if (lootedUnOpendOrderList != null) {
              yield SuccessUnOpendState(lootedUnOpendOrderList);
            } else {
              yield NoDataState(msg: '无待开奖订单记录！');
            }
          } else {
            yield NoDataState(msg: '无待开奖订单记录！');
          }
        } else if (event.index == 3) {
          if (lootorderModel.myLootInfo.length > 0) {
            lootorderModel.myLootInfo.forEach((element) {
              if (element.status == 2) {
                lootedOpendOrderList.add(element);
              }
            });
            if (lootedOpendOrderList != null) {
              yield SuccessOpendedOrderState(lootedOpendOrderList);
            } else {
              yield NoDataState(msg: '无开奖订单记录！');
            }
          } else {
            yield NoDataState(msg: '无开奖订单记录！');
          }
        } else {
          yield SuccessLootOrderState(lootorderModel.myLootInfo);
        }
      }
    } catch (error) {
      yield ShowToastState(error.toString());
    }
  }
}
