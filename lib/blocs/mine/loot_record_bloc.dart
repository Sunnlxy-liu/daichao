import 'package:daichao/common/bloc/base_bloc.dart';
import 'package:daichao/common/bloc/base_event.dart';
import 'package:daichao/common/bloc/base_state.dart';
import 'package:daichao/common/net/net_api.dart';
import 'package:daichao/model/loot_luck_order_model.dart';

class GetMyLuckLootEvent extends BaseEvent {}

class SuccessMyLuckLootState extends SuccessState {
  LootLuckModel model;
  SuccessMyLuckLootState(this.model);
}

class MyLuckLootBloc extends BaseBloc {
  @override
  void onMapEventToState() {
    e2s(GetMyLuckLootEvent, doGetMyAddressData);
  }

  Stream<BaseState> doGetMyAddressData(GetMyLuckLootEvent event) async* {
    yield LoadingToastState(loadingText: '添加中...');
    try {
      LootLuckModel lootLuckModel = await NetApi.getMyLuckLoot();
      print(lootLuckModel);
      if (lootLuckModel == null || lootLuckModel.myLuckLootInfo.length == 0) {
        yield NoDataState(msg: '无中奖记录');
      } else {
        yield SuccessMyLuckLootState(lootLuckModel);
      }
    } catch (error) {
      yield ShowToastState(error.toString());
    }
  }
}
