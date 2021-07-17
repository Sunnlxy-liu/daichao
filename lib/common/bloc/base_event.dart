abstract class BaseEvent {}

/// // 页面初始化加载时获取数据的事件，也是断网等重试时需要发的事件
class InitGetDataEvent extends BaseEvent {}

//  请求出错 例如 登录密码错误时候显示
class ErrorEvent extends BaseEvent {
  final int code;
  final String msg;
  ErrorEvent({this.code, this.msg});
}
