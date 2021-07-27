import 'package:daichao/model/article_detail_model.dart';
import 'package:daichao/model/article_list_model.dart';
import 'package:daichao/model/banner_adver_model.dart';
import 'package:daichao/model/base_model.dart';
import 'package:daichao/model/loan_apply_model.dart';
import 'package:daichao/model/loan_detail_model.dart';
import 'package:daichao/model/loan_list_model.dart';
import 'package:daichao/model/loan_record_model.dart';
import 'package:daichao/model/loan_type_model.dart';
import 'package:daichao/model/loot_luck_order_model.dart';
import 'package:daichao/model/loot_order_model.dart';
import 'package:daichao/model/luck_users_model.dart';
import 'package:daichao/model/myaddress_model.dart';
import 'package:daichao/model/suggest_speed_model.dart';
import 'package:daichao/model/upload_model.dart';
import 'package:daichao/model/user_info_model.dart';
import 'package:daichao/model/user_sign_model.dart';
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

  //banner图
  static Future<BannerAdverModel> getAdverBanner({
    List<dynamic> path,
    dynamic params,
    bool auth = true,
  }) async {
    return await NetUtils().request(
      'v1/Advert/lists',
      BannerAdverModel(),
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

  // 贷款申请
  static Future<BaseModel> applyLoan({
    List<dynamic> path,
    dynamic params,
    bool auth = true,
  }) async {
    return await NetUtils().request(
      'v1/Loan/applyLoan',
      ApplyLoanModel(),
      path: path,
      params: params,
      auth: auth,
      method: 'POST',
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
      method: HttpMethod.POST,
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

  // 我的收货地址列表
  static Future<MyAddressModel> getMyAddress({
    List<dynamic> path,
    dynamic params,
    bool auth = true,
  }) async {
    return await NetUtils().request(
      'v1/user/userAddress',
      MyAddressModel(),
      path: path,
      params: params,
      auth: auth,
      method: 'POST',
    );
  }

  //添加收货地址
  static Future<MyAddressModel> addMyAddress({
    List<dynamic> path,
    dynamic params,
    bool auth = true,
  }) async {
    return await NetUtils().request(
      'v1/user/addAddress',
      MyAddressModel(),
      path: path,
      params: params,
      auth: auth,
      method: 'POST',
    );
  }

  //添加收货地址
  static Future<MyAddressModel> uptMyAddress({
    List<dynamic> path,
    dynamic params,
    bool auth = true,
  }) async {
    return await NetUtils().request(
      'v1/user/uptAddress',
      MyAddressModel(),
      path: path,
      params: params,
      auth: auth,
      method: 'POST',
    );
  }

  //提交建议
  static Future<BaseModel> addSuggest({
    List<dynamic> path,
    dynamic params,
    bool auth = true,
  }) async {
    return await NetUtils().request(
      'v1/user/suggest',
      BaseModel(),
      path: path,
      params: params,
      auth: auth,
      method: 'POST',
    );
  }

  //建议进度
  static Future<SuggestSpeedModel> suggestSpeed({
    List<dynamic> path,
    dynamic params,
    bool auth = true,
  }) async {
    return await NetUtils().request(
      'v1/user/suggestSpeed',
      SuggestSpeedModel(),
      path: path,
      params: params,
      auth: auth,
      method: 'POST',
    );
  }

  //我的夺宝中奖记录
  static Future<LootLuckModel> getMyLuckLoot({
    List<dynamic> path,
    dynamic params,
    bool auth = true,
  }) async {
    return await NetUtils().request(
      'v1/user/myLuckLootOrder',
      LootLuckModel(),
      path: path,
      params: params,
      auth: auth,
      method: 'POST',
    );
  }

  //# 我的夺宝订单
  static Future<LootOrderModel> getMyLootOrder({
    List<dynamic> path,
    dynamic params,
    bool auth = true,
  }) async {
    return await NetUtils().request(
      'v1/user/myLootRecord',
      LootOrderModel(),
      path: path,
      params: params,
      auth: auth,
      method: 'POST',
    );
  }

  // 提交实名认证信息
  static Future<UserInfoModel> uptConfirInfo({
    List<dynamic> path,
    dynamic params,
    bool auth = true,
  }) async {
    return await NetUtils().request(
      'v1/User/uptUserConfirmInfo',
      UserInfoModel(),
      path: path,
      params: params,
      auth: auth,
      method: 'POST',
    );
  }

  //上传图片
  static Future<UploadModel> upLoadImg({
    List<dynamic> path,
    dynamic params,
    bool auth = true,
  }) async {
    return await NetUtils().request(
      'v1/User/uploadImage',
      UploadModel(),
      path: path,
      params: params,
      auth: auth,
      method: 'POST',
      // options: Options(contentType: "multipart/form-data"),
    );
  }

  //签到
  static Future<UserSignModel> doSign({
    List<dynamic> path,
    dynamic params,
    bool auth = true,
  }) async {
    return await NetUtils().request(
      'v1/User/userSign',
      UserSignModel(),
      path: path,
      params: params,
      auth: auth,
      method: 'POST',
    );
  }

  //签到信息
  static Future<UserSignModel> getSignInfo({
    List<dynamic> path,
    dynamic params,
    bool auth = true,
  }) async {
    return await NetUtils().request(
      'v1/User/userSignInfo',
      UserSignModel(),
      path: path,
      params: params,
      auth: auth,
      method: 'POST',
    );
  }
}
