import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:daichao/data/data.dart';

/// 111，使用自带的MaterialPageRoute转场效果实现页面切换
class NavigatorUtils {
  ///[context] 上下文对象
  ///[targPage] 目标页面
  ///[isReplace] 是否替换当前页面  A - B,跳转的同时是否关闭A页面
  static void pushPage({
    @required Widget targPage,
    bool isReplace = false,
    Function(dynamic value) dismissCallBack,
  }) {
    PageRoute pageRoute;

    /// Flutter 提供了两个转场动画，分别为 MaterialPageRoute 和 CupertinoPageRoute，
    /// MaterialPageRoute 根据不同的平台显示不同的效果，Android效果为从下到上，
    /// iOS效果为从左到右。CupertinoPageRoute 不分平台，都是从左到右。
    if (Platform.isAndroid) {
      pageRoute = MaterialPageRoute(builder: (BuildContext context) {
        return targPage;
      });
    } else {
      pageRoute = CupertinoPageRoute(builder: (BuildContext context) {
        return targPage;
      });
    }

    if (isReplace) {
      navigatorKey.currentState.pushReplacement(pageRoute).then((value) {
        if (dismissCallBack != null) {
          dismissCallBack(value);
        }
      });
    } else {
      // 实现页面跳转无需context
      navigatorKey.currentState.push(pageRoute).then((value) {
        if (dismissCallBack != null) {
          dismissCallBack(value);
        }
      });
    }
  }

  /// 222，页面跳转，支持自定义转场动画，替换方法中的FadeTransition为其它即可。
  ///[context] 上下文对象
  ///[targPage] 目标页面
  ///[isReplace] 是否替换当前页面  A-B
  static void pushPageByAnimation({
    @required Widget targPage,
    bool isReplace = false,
    Function(dynamic value) dismissCallBack,
  }) {
    PageRoute pageRoute = PageRouteBuilder(
      /// pageBuilder 表示跳转的页面
      pageBuilder: (BuildContext context, Animation<double> animation, Animation<double> secondaryAnimation) {
        return targPage;
      },

      /// transitionsBuilder 表示页面跳转的动画效果，通过查看源码发现默认情况下没有动画效果。
      /// 自定义转场动画只需修改transitionsBuilder即可，如下添加了转场效果（透明度显式动画）
      transitionsBuilder:
          (BuildContext context, Animation<double> animation, Animation<double> secondaryAnimation, Widget child) {
        //从下面画滑出的动画效果
        return SlideTransition(
          position: Tween<Offset>(begin: Offset(0.0, 1.0), end: Offset(0.0, 0.0))
              .animate(CurvedAnimation(parent: animation, curve: Curves.fastOutSlowIn)),
          child: child,
        );
        // 渐变的动画效果
        // return FadeTransition(
        //   opacity: animation,
        //   child: child,
        // );
      },
    );

    if (isReplace) {
      navigatorKey.currentState.pushReplacement(pageRoute).then((value) {
        if (dismissCallBack != null) {
          dismissCallBack(value);
        }
      });
    } else {
      navigatorKey.currentState.push(pageRoute).then((value) {
        if (dismissCallBack != null) {
          dismissCallBack(value);
        }
      });
    }
  }

  /// 333，以背景全透明的方式打开页面，并附带透明度渐变的转场动画，默认不带任何转场动画
  /// [context] 上下文对象
  /// [targPage] 目标页面
  /// [isReplace] 是否替换当前页面  A-B
  static void pushPageByTransparent({
    @required Widget targPage,
    bool isReplace = false,
    Function(dynamic value) dismissCallBack,
  }) {
    PageRoute pageRoute = PageRouteBuilder(
      opaque: false, // 是否以背景透明的方式打开页面，true为非透明（也是默认值），false为透明

      /// pageBuilder 表示跳转的页面
      pageBuilder: (BuildContext context, Animation<double> animation, Animation<double> secondaryAnimation) {
        return targPage;
      },

      /// transitionsBuilder 表示页面跳转的动画效果，通过查看源码发现默认情况下没有动画效果。
      /// 自定义转场动画只需修改transitionsBuilder即可，如下添加了转场效果（透明度显式动画）
      transitionsBuilder:
          (BuildContext context, Animation<double> animation, Animation<double> secondaryAnimation, Widget child) {
        return FadeTransition(
          opacity: animation,
          child: child,
        );
      },
    );

    if (isReplace) {
      navigatorKey.currentState.pushReplacement(pageRoute).then((value) {
        if (dismissCallBack != null) {
          dismissCallBack(value);
        }
      });
    } else {
      navigatorKey.currentState.push(pageRoute).then((value) {
        if (dismissCallBack != null) {
          dismissCallBack(value);
        }
      });
    }
  }

  /// 444，以打开Dialog的方式打开一个新的页面，附带缩放的转场动画（默认不带任何转场动画），
  /// 只是在上面方法的基础上添加了一个背景色的属性而已，该属性如果传null，则与上面方法效果一样，此处分开，也可合并成一个方法
  /// [context]  上下文对象
  /// [targPage] 目标页面
  /// [bgColor]  背景遮罩颜色
  static void pushPageByDialog({
    @required Widget targPage,
    Color bgColor = Colors.black45,
    Function(dynamic value) dismissCallBack,
  }) {
    PageRoute pageRoute = PageRouteBuilder(
      opaque: false, // 该值默认为true代表背景不透明，只有为false时barrierColor参数才有效果
      barrierColor: bgColor,

      /// pageBuilder 表示跳转的页面
      pageBuilder: (BuildContext context, Animation<double> animation, Animation<double> secondaryAnimation) {
        return targPage;
      },
      // 不实现该属性，即不带动画效果
      transitionsBuilder:
          (BuildContext context, Animation<double> animation, Animation<double> secondaryAnimation, Widget child) {
        // 缩放动画
        return ScaleTransition(
          scale: Tween<double>(begin: 0.0, end: 1.0)
              .animate(CurvedAnimation(parent: animation, curve: Curves.easeInOutQuint)),
          child: child,
        );
        // 透明度渐变动画效果
        // return FadeTransition(
        //   opacity: animation,
        //   child: child,
        // );
      },
    );

    navigatorKey.currentState.push(pageRoute).then((value) {
      if (dismissCallBack != null) {
        dismissCallBack(value);
      }
    });
  }
}
