import 'package:flutter_bloc/flutter_bloc.dart';
import 'base_event.dart';
import 'base_state.dart';

abstract class BaseBloc extends Bloc<BaseEvent, BaseState> {
  // 初始状态为InitState
  BaseBloc() : super(InitState()) {
    onMapEventToState();
  }

  Map<Type, Function> _functionMap = {};

  /// 抽象方法，子类需重写，重写时调用e2s方法
  void onMapEventToState();

  @override
  Stream<BaseState> mapEventToState(BaseEvent event) async* {
    Function onFunction = _functionMap[event.runtimeType];

    if (onFunction != null) {
      yield* Stream.castFrom(onFunction(event));
    }
  }

  /// 参数1：事件类型Event
  /// 参数2：事件对应的处理方法
  void e2s(type, function) {
    _functionMap[type] = function;
  }
}
