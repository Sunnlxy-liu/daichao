import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:oktoast/oktoast.dart';

/// Toast工具类

class ToastUtils {
  /// 文本Toast，默认显示在底部
  static ToastFuture showToastMsg(
    String msg, {
    Duration duration,
    ToastPosition position = ToastPosition.bottom,
  }) {
    return showToast(
      "$msg",
      duration: duration,
      position: position,
      radius: 500,
      textPadding: EdgeInsets.symmetric(vertical: 8, horizontal: 12),
      backgroundColor: Colors.grey[600],
      textStyle: TextStyle(fontSize: 15, color: Colors.white),
    );
  }

  /// Loading Toast，默认显示在屏幕中间
  static ToastFuture showLoadingToast({
    Color backgroundColor = Colors.black26, // 背景颜色
    Color toastColor = Colors.black, // 弹框颜色
    String msg = "正在加载...", // 默认文案
    Duration duration = const Duration(hours: 1), // 显示时长
  }) {
    var w = Container(
      alignment: Alignment.center,
      color: backgroundColor,
      child: Container(
        padding: EdgeInsets.all(10),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5),
          color: toastColor,
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                const SpinKitCircle(
                  size: 40,
                  color: Colors.white,
                ),
                const SizedBox(
                  height: 5,
                ),
                Text(
                  '$msg',
                  style: TextStyle(color: Colors.white, fontSize: 13),
                ),
              ],
            ),
          ],
        ),
      ),
    );
    return showToastWidget(
      w,
      duration: duration,
    );
  }

  /// 关闭所有的Toast弹窗
  static void closeAllToast({bool showAnim = false}) {
    dismissAllToast(showAnim: showAnim);
  }
}
