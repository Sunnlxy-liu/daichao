import 'dart:convert';
import "package:intl/intl.dart";
import 'package:flutter/material.dart';

class Utils {
  static String getImage(String sImageName) {
    return 'assets/images/$sImageName';
  }

  // 格式化数量
  static String getNumStr(int num) {
    String result;
    if (num <= 10000) {
      result = num.toString();
    } else {
      String data = num.toString();
      String sta = data.substring(0, data.length - 4);
      String end = data.substring(data.length - 4, data.length - 3);
      result = sta + "." + end + "w+";
    }
    return result;
  }

  static String formatNum(num, {point: 3}) {
    if (num != null) {
      String str = double.parse(num.toString()).toString();
      // 分开截取
      List<String> sub = str.split('.');
      // 处理值
      List val = List.from(sub[0].split(''));
      // 处理点
      List<String> points = List.from(sub[1].split(''));
      //处理分割符
      for (int index = 0, i = val.length - 1; i >= 0; index++, i--) {
        // 除以三没有余数、不等于零并且不等于1 就加个逗号
        if (index % 3 == 0 && index != 0 && i != 1) val[i] = val[i] + ',';
      }
      // 处理小数点
      for (int i = 0; i <= point - points.length; i++) {
        points.add('0');
      }
      //如果大于长度就截取
      if (points.length > point) {
        // 截取数组
        points = points.sublist(0, point);
      }
      // 判断是否有长度
      if (points.length > 0) {
        return '${val.join('')}.${points.join('')}';
      } else {
        return val.join('');
      }
    } else {
      return "0.0";
    }
  }

  static String getFormatStepCount(String number) {
    var format = NumberFormat('0,000');
    return format.format(number);
  }

  static void closeLoading(Function cancelFunc) {
    cancelFunc?.call();
    cancelFunc = null;
  }

  /* *
   * 检验身份证号码是否正确
   */
  static bool isCardNo(context) {
    var regExp = RegExp('^\\d{6}(18|19|20)?\\d{2}(0[1-9]|1[012])(0[1-9]|[12]\\d|3[01])\\d{3}(\\d|X)\$');
    return regExp.hasMatch(context.trim().toUpperCase());
  }

  /* *
   * 检验支付宝账号
   */
  static bool isAliAccount(context) {
    var regExp = RegExp('^(?:1[3-9]\\d{9}|[a-zA-Z\\d._-]*\@[a-zA-Z\\d.-]{1,10}\.[a-zA-Z\d]{1,20})\$');
    return regExp.hasMatch(context.trim().toUpperCase());
  }

  ///去掉字符串中的所有空格
  static String trimAll(String value) {
    return value.replaceAll(RegExp(r"\s+\b|\b\s"), '');
  }

  ///字符串反转
  static String reverse(input) {
    return input.split('').reversed.join();
  }

  ///字符串加密成codeUnits
  static List<int> strEncode(String data) {
    var content = utf8.encode(data);
    var digest = base64Encode(content);
    return reverse(digest).codeUnits;
  }

  ///解密coideUnits字符串
  static String strDecode(List<int> codes) {
    String sBase64 = String.fromCharCodes(codes);
    var digest = base64Decode(reverse(sBase64));
    var ret = utf8.decode(digest);
    return ret;
  }

  // 获取联赛的颜色
  static String colorValue(int value) {
    String str = "000000" + value.toRadixString(16);
    return str.substring(str.length - 6, str.length);
  }

  // 时间戳 转 Y/m/d
  //stampTimeFormatYmd
  static String stampTimeFormatYmd(int time) {
    if (time == null) {
      return '';
    }
    String strtime = DateTime.fromMillisecondsSinceEpoch(time * 1000).toString();
    return strtime.substring(0, 10);
  }
}

class ColorUtils {
  /// 按钮默认背景色
  static get buttonNormalColor => Color(0xFF54639A);
  static get buttonDisableColor => Color(0xFFC3C3C3);
  static get lintSplitColor => Color(0xFFF5F5F5);
  static get cl66 => Color(0xFF666666);
  static get cl99 => Color(0xFF999999);
  static get cl20 => Color(0xFF202020);
  static get cl33 => Color(0xFF333333);
  static get clee => Color(0xFFEEEEEE);
}

class TextStyleUtils {
  static get pageTitleStyle => TextStyle(color: Colors.white, fontSize: 15);
  static get btnTextStyle => TextStyle(fontSize: 14, color: Colors.white);
  static get titleActionsStyle => TextStyle(color: Colors.white, fontSize: 14);

  static get whiteStyle10 => TextStyle(color: Colors.white, fontSize: 10);
  static get whiteStyle12 => TextStyle(color: Colors.white, fontSize: 12);
  static get whiteStyle14 => TextStyle(color: Colors.white, fontSize: 14);
  static get whiteStyle16 => TextStyle(color: Colors.white, fontSize: 16);

  static get loginStyle01 => TextStyle(color: Colors.grey[500], fontSize: 12);
  static get loginStyle02 => TextStyle(color: Colors.grey[500], fontSize: 14);
}
