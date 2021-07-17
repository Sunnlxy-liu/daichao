import 'package:flutter/material.dart';

class BottomSheetUtils {
  static Future showModalSheet(context, Widget child, {double height}) async {
    return await showModalBottomSheet(
      context: context,
      isScrollControlled: true, //true为全屏，默认为false半屏
      // 设置上面两个角为圆角
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
      ),
      enableDrag: false, // 设置是否可以随手指移动,默认为true
      builder: (context) {
        return Container(
          // isScrollControlled属性为false时,高度有最大值限制,
          // 要突破最大高度限制就要将isScrollControlled属性设置为true
          height: height ?? MediaQuery.of(context).size.height * 0.6,
          child: child,
        );
      },
    );
  }

  static showSheet(context, Widget child) async {
    showBottomSheet(
        context: context,
        builder: (context) {
          return Container(
            child: child,
          );
        });
  }
}
