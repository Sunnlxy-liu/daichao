import 'dart:ui';
import 'package:daichao/common/bloc/base_bloc.dart';
import 'package:daichao/common/bloc/base_event.dart';
import 'package:daichao/common/bloc/base_state.dart';

class SelectThemeColorEvent extends BaseEvent {
  final Color color;
  SelectThemeColorEvent(this.color);
}

class SelectThemeColorState extends BaseState {
  final Color color;
  SelectThemeColorState(this.color);
}

class ThemeBloc extends BaseBloc {
  @override
  void onMapEventToState() {
    e2s(SelectThemeColorEvent, doSelectColor);
  }

  Stream<BaseState> doSelectColor(SelectThemeColorEvent event) async* {
    yield SelectThemeColorState(event.color);
  }
}
