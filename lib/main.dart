import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:daichao/blocs/theme_bloc.dart';
import 'package:daichao/common/bloc/bloc_builder_wgt.dart';
import 'package:daichao/common/global_config.dart';
import 'package:daichao/data/data.dart';
import 'package:daichao/pages/main_page.dart';
import 'package:daichao/utils/sp_utils.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:oktoast/oktoast.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await GlobalConfig.init(); // 初始化全局配置
  // 强制app竖屏
  SystemChrome.setPreferredOrientations(
    [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown],
  );
  // 设置安卓沉浸式状态栏
  if (Platform.isAndroid) {
    //设置Android头部的导航栏透明
    SystemUiOverlayStyle systemUiOverlayStyle = SystemUiOverlayStyle(
      statusBarColor: Colors.transparent, //全局设置透明
    );
    SystemChrome.setSystemUIOverlayStyle(systemUiOverlayStyle);
  }
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> with WidgetsBindingObserver {
  // 全局的bloc状态管理
  List<BlocProvider> providers = [
    BlocProvider<ThemeBloc>(
      create: (BuildContext context) => ThemeBloc(),
    ),
  ];

  Color _themeColor = themeColorMap[SpUtil.getString("key_theme_color", defValue: "default")];

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this); //添加观察者
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this); //移除观察者
    super.dispose();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    super.didChangeAppLifecycleState(state);
    switch (state) {
      case AppLifecycleState.inactive:
        // 可见，但未获取到焦点。
        print("============================inactive");
        break;
      case AppLifecycleState.paused:
        // 应用程序处于不可见状态
        print("============================paused");
        break;
      case AppLifecycleState.resumed:
        // 首次进入应用时候不会触发该状态，只有当从后台切换到前台时才会触发
        // 可见且获取到了焦点
        print("============================resumed");
        break;
      case AppLifecycleState.detached:
        // 当前页面即将退出
        print("============================detached");
        break;
      default:
    }
  }

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: Size(360, 690), // 【替换】设计图尺寸，建议使用像素单位
      // allowFontScaling: false,
      builder: () => OKToast(
        dismissOtherOnShow: true, // 全局设置隐藏之前的属性,这里设置后,每次当你显示新的 toast 时,旧的就会被关闭
        child: RefreshConfiguration(
          enableLoadingWhenFailed: true, //在加载失败的状态下,用户仍然可以通过手势上拉来触发加载更多
          hideFooterWhenNotFull: false, // Viewport不满一屏时,禁用上拉加载更多功能
          enableBallisticLoad: true, // 可以通过惯性滑动触发加载更多
          child: MultiBlocProvider(
            providers: providers,
            child: BlocConsumerWgt<ThemeBloc>(
                listenWhen: (oldState, newState) {
                  if (newState is SelectThemeColorState) {
                    _themeColor = newState.color;
                  }
                  return false;
                },
                buildIf: [SelectThemeColorState],
                builder: (context, state) {
                  return MaterialApp(
                    title: '贷超',
                    debugShowCheckedModeBanner: false,
                    theme: ThemeData(
                      fontFamily: 'PingFangSc',
                      primaryColor: _themeColor,
                      accentColor: _themeColor,
                      visualDensity: VisualDensity.adaptivePlatformDensity,
                      appBarTheme: AppBarTheme(
                        // 全局设置状态栏字体颜色【light：黑色  dark：白色】
                        brightness: Brightness.dark,
                      ),
                    ),
                    navigatorKey: navigatorKey,
                    home: MainPage(),
                    //设置app内文字大小不随系统设置而改变
                    builder: (context, widget) {
                      return MediaQuery(
                        data: MediaQuery.of(context).copyWith(textScaleFactor: 1.0),
                        child: widget,
                      );
                    },
                    localizationsDelegates: [
                      RefreshLocalizations.delegate, // 下拉刷新组件国际化支持
                      GlobalMaterialLocalizations.delegate,
                      GlobalWidgetsLocalizations.delegate,
                      GlobalCupertinoLocalizations.delegate,
                    ],
                    supportedLocales: [const Locale('zh', 'CN'), const Locale('en', 'US')],
                  );
                }),
          ),
        ),
      ),
    );
  }
}
