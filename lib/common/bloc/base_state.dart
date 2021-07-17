abstract class BaseState {}

class InitState extends BaseState {} // 初识状态

class LoadingState extends BaseState {} // 加载中

class LoadingToastState extends BaseState {
  final String loadingText;
  LoadingToastState({this.loadingText});
} // 加载中弹框

class NetErrorState extends BaseState {} // 网络异常

class ServerErrorState extends BaseState {} // 服务器异常

// 无数据对应的State
class NoDataState extends BaseState {
  final String msg;
  NoDataState({this.msg});
}

// 显示Toast提示
class ShowToastState extends BaseState {
  final String msg;
  ShowToastState(this.msg);
}

//成功请求无返回消息
class SuccessState extends BaseState {}

//请求成功但是 出错了
class ErrorState<T> extends BaseState {
  ErrorState({
    this.code,
    this.msg,
  });

  final int code;
  final String msg;
}
