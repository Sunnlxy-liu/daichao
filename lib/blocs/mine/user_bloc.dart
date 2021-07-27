import 'package:daichao/common/bloc/base_bloc.dart';
import 'package:daichao/common/bloc/base_event.dart';
import 'package:daichao/common/bloc/base_state.dart';

// 登录或者退出登录事件
class LoginOrOutEvent extends BaseEvent {}

class LoginOrOutState extends BaseState {}

class UserBloc extends BaseBloc {
  @override
  void onMapEventToState() {
    e2s(LoginOrOutEvent, doLoginSuccess);
  }

  Stream<BaseState> doLoginSuccess(LoginOrOutEvent event) async* {
    yield LoginOrOutState();
  }
}
