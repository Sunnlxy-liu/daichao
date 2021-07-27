import 'package:daichao/common/bloc/base_bloc.dart';
import 'package:daichao/common/bloc/base_event.dart';
import 'package:daichao/common/bloc/base_state.dart';
import 'package:daichao/common/net/net_api.dart';
import 'package:daichao/model/myaddress_model.dart';
import 'package:daichao/utils/toast_utils.dart';

class GetMyAddressEvent extends BaseEvent {}

class AddMyAddressEvent extends BaseEvent {
  final int id;
  final String name;
  final String mobile;
  final String country;
  final String province;
  final String city;
  final String area;
  final String address;
  AddMyAddressEvent(
      {this.id = 0,
      this.name,
      this.mobile,
      this.country = '中国',
      this.province,
      this.city = '',
      this.area = '',
      this.address = ''});
}

class SuccessMyAddressState extends SuccessState {
  MyAddressModel model;
  SuccessMyAddressState(this.model);
}

class AddSuccessMyAddressState extends SuccessState {}

class MyAddressBloc extends BaseBloc {
  MyAddressModel addAddressListModel;
  MyAddressModel uptAddressListModel;
  @override
  void onMapEventToState() {
    e2s(GetMyAddressEvent, doGetMyAddressData);
    e2s(AddMyAddressEvent, doAddMyAddressData);
  }

  Stream<BaseState> doGetMyAddressData(GetMyAddressEvent event) async* {
    yield LoadingToastState(loadingText: '加载中...');
    try {
      MyAddressModel myAddressListModel = await NetApi.getMyAddress();
      print(myAddressListModel);
      if (myAddressListModel == null || myAddressListModel.addressList.length == 0) {
        yield NoDataState(msg: '未添加收货地址');
      } else {
        yield SuccessMyAddressState(myAddressListModel);
      }
    } catch (error) {
      yield ShowToastState(error.toString());
    }
  }

  Stream<BaseState> doAddMyAddressData(AddMyAddressEvent event) async* {
    yield LoadingToastState(loadingText: '添加中...');
    try {
      if (event.id == 0) {
        addAddressListModel = await NetApi.addMyAddress(params: {
          "name": event.name,
          "mobile": event.mobile,
          "country": event.country,
          "province": event.province,
          "city": event.city,
          "area": event.area,
          'address': event.address,
        });
      } else {
        uptAddressListModel = await NetApi.uptMyAddress(params: {
          "id": event.id,
          "name": event.name,
          "mobile": event.mobile,
          "country": event.country,
          "province": event.province,
          "city": event.city,
          "area": event.area,
          'address': event.address,
        });
      }

      if (addAddressListModel == null) {
        yield NoDataState(msg: '添加收货地址失败');
      } else {
        ToastUtils.showToastMsg("添加成功");
        yield SuccessState();
      }
      if (uptAddressListModel == null) {
        yield NoDataState(msg: '修改收货地址失败');
      } else {
        ToastUtils.showToastMsg("修改成功");
        yield SuccessState();
      }
    } catch (error) {
      yield ShowToastState(error.msg());
    }
  }
}
