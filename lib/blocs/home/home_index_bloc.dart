import 'package:daichao/common/bloc/base_bloc.dart';
import 'package:daichao/common/bloc/base_event.dart';
import 'package:daichao/common/bloc/base_state.dart';
import 'package:daichao/common/net/net_api.dart';
import 'package:daichao/model/article_list_model.dart';
import 'package:daichao/model/banner_adver_model.dart';
import 'package:daichao/model/loan_list_model.dart';
import 'package:daichao/model/loan_type_model.dart';
import 'package:daichao/model/luck_users_model.dart';

class GetDataEvent extends BaseEvent {}

class SuccessDataState extends BaseState {
  final HomeBeen homeBeen;
  SuccessDataState(this.homeBeen);
}

class HomeIndexBloc extends BaseBloc {
  @override
  void onMapEventToState() {
    e2s(GetDataEvent, doGetData);
  }

  Stream<BaseState> doGetData(GetDataEvent event) async* {
    yield LoadingState();
    try {
      // 获取首页各模块数据
      List results = await Future.wait([
        // 首页贷款分类
        NetApi.getDkTypes(params: {"page": "home"}).then((value) => value),
        //banner
        NetApi.getAdverBanner(params: {"page": "home"}).then((value) => value),
        // 幸运用户
        NetApi.getLackUsres(params: {"limit": "6"}).then((value) => value),
        // 首页热门贷款
        NetApi.getDkList(params: {"page": "home"}).then((value) => value),
        // 首页热门资讯
        NetApi.getNewslist(params: {"page": "home"}).then((value) => value),
      ]);
      LoanTypeModel loanTypeModel = results[0];
      BannerAdverModel bannerAdverModel = results[1];
      LuckUsersModel luckUserModel = results[2];
      LoanListModel loanModel = results[3];
      ArticleListModel articleModel = results[4];
      yield SuccessDataState(HomeBeen(
        loanTypeModel.loanTypeList,
        bannerAdverModel.adverList,
        luckUserModel.lucksList,
        loanModel.loanList,
        articleModel.articleList,
      ));
    } catch (error) {
      // 异常
      yield NetErrorState();
    }
  }
}

class HomeBeen {
  final List<LoanTypeList> loanTypeList;
  final List<AdverList> adverList;
  final List<LucksList> userList;
  final List<LoanList> loanList;
  final List<ArticleList> articleList;

  HomeBeen(this.loanTypeList, this.adverList, this.userList, this.loanList, this.articleList);
}
