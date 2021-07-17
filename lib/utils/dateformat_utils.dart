import 'package:daichao/utils/sp_utils.dart';

class DateFormatUtils {
  static final num oneMinute = 60000; //ONE_MINUTE
  static final num oneHour = 3600000; //ONE_HOUR
  static final num oneDay = 86400000; //ONE_DAY
  static final num oneWeek = 604800000; //ONE_WEEK

  static final String oneSecondAgo = "秒前"; //ONE_SECOND_AGO
  static final String oneMinuteAgo = "分钟前"; //ONE_MINUTE_AGO
  static final String oneHourAgo = "小时前"; //ONE_HOUR_AGO
  static final String oneDayAgo = "天前"; //ONE_DAY_AGO
  static final String oneMouthAgo = "月前"; //ONE_MONTH_AGO
  static final String oneYearAgo = "年前"; //ONE_YEAR_AGO

  /// 字符串转DateTime:
  /// DateTime.parse('2019-11-08') 或者 DateTime.parse('2019-11-08 12:30:05')

  //时间转换
  static String format(String dateStr, {bool showTime = false}) {
    DateTime date = DateTime.parse(dateStr);
    num delta = DateTime.now().millisecondsSinceEpoch - date.millisecondsSinceEpoch;
    if (delta < 1 * oneMinute) {
      return "刚刚";
    }
    if (delta < 1 * oneHour) {
      num minutes = toMinutes(delta);
      return (minutes <= 0 ? 1 : minutes).toInt().toString() + oneMinuteAgo;
    }
    if (delta < 24 * oneHour) {
      num hours = toHours(delta);
      return (hours <= 0 ? 1 : hours).toInt().toString() + oneHourAgo;
    } else {
      if (showTime) {
        return dateStr.substring(5, 16);
      } else {
        return dateStr.substring(5, 10);
      }
    }
  }

  static num toSeconds(num date) {
    return date / 1000;
  }

  static num toMinutes(num date) {
    return toSeconds(date) / 60;
  }

  static num toHours(num date) {
    return toMinutes(date) / 60;
  }

  static num toDays(num date) {
    return toHours(date) / 24;
  }

  static num toMonths(num date) {
    return toDays(date) / 30;
  }

  static num toYears(num date) {
    return toMonths(date) / 365;
  }
}
