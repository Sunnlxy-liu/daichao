import 'package:daichao/data/repository/user_repository.dart';
import 'package:daichao/model/user_model.dart';
import 'package:daichao/utils/sp_utils.dart';
import 'package:package_info/package_info.dart';

class GlobalConfig {
  ///版本号
  static String appVersion;

  ///BuildNumber
  static String appBuildNumber;

  /// 包名
  static String packageName;

  /// 是否第一次打开
  static bool isFirstOpen = false;

  static Future<void> init() async {
    // 初始化SP实例
    await SpUtil.getInstance();

    //获取版本号
    PackageInfo packageInfo = await PackageInfo.fromPlatform();
    appVersion = packageInfo.version;
    appBuildNumber = packageInfo.buildNumber;
    packageName = packageInfo.packageName;

    // 是否是第一次打开app,用于显示诸如引导页等的判断
    isFirstOpen = SpUtil.getBool("first_open", defValue: true);

    // 登录信息
    UserModel model = SpUtil.getObj<UserModel>("userModel", (Map v) => UserModel().fromMap(v), defValue: UserModel());
    UserRespository().setUserModel(model);
  }

  static void setFirstOpen() {
    SpUtil.putBool("first_open", false);
  }
}
