import 'package:daichao/common/bloc/base_bloc.dart';
import 'package:daichao/common/bloc/base_event.dart';
import 'package:daichao/common/bloc/base_state.dart';
import 'package:daichao/common/net/net_api.dart';
import 'package:daichao/model/article_detail_model.dart';

class GetDataEvent extends BaseEvent {
  final int id;
  GetDataEvent(this.id);
}

class SuccessDataState extends BaseState {
  final ArticleDetail info;
  SuccessDataState(this.info);
}

class ArticleDetailBloc extends BaseBloc {
  @override
  void onMapEventToState() {
    e2s(GetDataEvent, doGetData);
  }

  Stream<BaseState> doGetData(GetDataEvent event) async* {
    yield LoadingState();
    try {
      // 资讯详情
      ArticleDetailModel model = await NetApi.getNewsDetail(params: {"id": event.id});
      yield SuccessDataState(model.articleDetail);
    } catch (error) {
      // 异常
      yield NetErrorState();
    }
  }
}
