import 'package:daichao/common/bloc/base_bloc.dart';
import 'package:daichao/common/bloc/base_event.dart';
import 'package:daichao/common/bloc/base_state.dart';
import 'package:daichao/common/net/net_api.dart';
import 'package:daichao/model/article_list_model.dart';

class GetDataEvent extends BaseEvent {
  final String page;
  GetDataEvent(this.page);
}

class SuccessDataState extends BaseState {
  final ArticleListModel info;
  final String page;
  SuccessDataState(this.info, this.page);
}

class ArticleListBloc extends BaseBloc {
  @override
  void onMapEventToState() {
    e2s(GetDataEvent, doGetData);
  }

  Stream<BaseState> doGetData(GetDataEvent event) async* {
    yield LoadingState();
    try {
      // 资讯详情
      ArticleListModel model = await NetApi.getNewslist(params: {"page": event.page});
      yield SuccessDataState(model, event.page);
    } catch (error) {
      // 异常
      yield NetErrorState();
    }
  }
}
