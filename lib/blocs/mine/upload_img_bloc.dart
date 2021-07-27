import 'package:daichao/common/bloc/base_bloc.dart';
import 'package:daichao/common/bloc/base_event.dart';
import 'package:daichao/common/bloc/base_state.dart';

class UploadSuccessEvent extends BaseEvent {
  final int errorCode;
  final String imgName;
  final String thumbImage;
  UploadSuccessEvent(this.errorCode, this.imgName, this.thumbImage);
}

class UploadBeforeEvent extends BaseEvent {}

class UploadJustSuccessState extends SuccessState {
  final String imgType;
  final String thumbImage;
  UploadJustSuccessState(this.imgType, this.thumbImage);
}

class UploadBackSuccessState extends SuccessState {
  final String imgType;
  final String thumbImage;
  UploadBackSuccessState(this.imgType, this.thumbImage);
}

class UploadFialedState extends SuccessState {}

class UploadImgBloc extends BaseBloc {
  @override
  void onMapEventToState() {
    e2s(UploadSuccessEvent, doGetUploadImgData);
  }

  Stream<BaseState> doGetUploadImgData(UploadSuccessEvent event) async* {
    if (event.errorCode == 0) {
      if (event.imgName == 'cardImgJust') {
        yield UploadJustSuccessState(event.imgName, event.thumbImage);
      } else {
        yield UploadBackSuccessState(event.imgName, event.thumbImage);
      }
    } else {
      yield UploadFialedState();
    }
  }
}
