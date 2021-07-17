import 'package:daichao/model/article_detail_model.dart';
import 'package:daichao/model/article_list_model.dart';
import 'package:daichao/model/base_model.dart';
import 'package:daichao/model/loan_detail_model.dart';
import 'package:daichao/model/loan_list_model.dart';
import 'package:daichao/model/loan_record_model.dart';
import 'package:daichao/model/loan_type_model.dart';
import 'package:daichao/model/luck_users_model.dart';
import 'package:daichao/model/user_info_model.dart';
import 'package:daichao/utils/net_utils.dart';

class NetApi {
  // 贷款分类
  static Future<LoanTypeModel> getDkTypes({
    List<dynamic> path,
    dynamic params,
    bool auth = true,
  }) async {
    return await NetUtils().request(
      'v1/Loan/types',
      LoanTypeModel(),
      path: path,
      params: params,
      auth: auth,
    );
  }

  //贷款信息流列表
  static Future<LoanListModel> getDkList({
    List<dynamic> path,
    dynamic params,
    bool auth = true,
  }) async {
    return await NetUtils().request(
      'v1/Loan/lists',
      LoanListModel(),
      path: path,
      params: params,
      auth: auth,
    );
  }

  //贷款详情页
  static Future<LoanDetailModel> getDkDetails({
    List<dynamic> path,
    dynamic params,
    bool auth = true,
  }) async {
    return await NetUtils().request(
      'v1/Loan/detail',
      LoanDetailModel(),
      path: path,
      params: params,
      auth: auth,
    );
  }

  // 我的贷款记录
  static Future<LoanRecordModel> getDkRecord({
    List<dynamic> path,
    dynamic params,
    bool auth = true,
  }) async {
    return await NetUtils().request(
      'v1/Loan/myloadrecord',
      LoanRecordModel(),
      path: path,
      params: params,
      auth: auth,
    );
  }

  // 幸运用户
  static Future<LuckUsersModel> getLackUsres({
    List<dynamic> path,
    dynamic params,
    bool auth = true,
  }) async {
    return await NetUtils().request(
      'v1/Loot/lucks',
      LuckUsersModel(),
      path: path,
      params: params,
      auth: auth,
    );
  }

  // 资讯信息流
  static Future<ArticleListModel> getNewslist({
    List<dynamic> path,
    dynamic params,
    bool auth = true,
  }) async {
    return await NetUtils().request(
      'v1/Article/lists',
      ArticleListModel(),
      path: path,
      params: params,
      auth: auth,
    );
  }

  // 资讯详情
  static Future<ArticleDetailModel> getNewsDetail({
    List<dynamic> path,
    dynamic params,
    bool auth = true,
  }) async {
    return await NetUtils().request(
      'v1/Article/detail',
      ArticleDetailModel(),
      path: path,
      params: params,
      auth: auth,
    );
  }

  // 登录
  static Future<UserInfoModel> doLogin({
    List<dynamic> path,
    dynamic params,
    bool auth = true,
  }) async {
    return await NetUtils().request(
      'v1/User/login',
      UserInfoModel(),
      path: path,
      params: params,
      auth: auth,
      method: 'POST',
    );
  }

  // 退出登录
  static Future<BaseModel> doLogout({
    List<dynamic> path,
    dynamic params,
    bool auth = true,
  }) async {
    return await NetUtils().request(
      'v1/User/logout',
      UserInfoModel(),
      path: path,
      params: params,
      auth: auth,
      method: 'POST',
    );
  }

  // 注册
  static Future<UserInfoModel> doRegister({
    List<dynamic> path,
    dynamic params,
    bool auth = true,
  }) async {
    return await NetUtils().request(
      'v1/user/register',
      UserInfoModel(),
      path: path,
      params: params,
      auth: auth,
      method: 'POST',
    );
  }
}
