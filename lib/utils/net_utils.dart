import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:daichao/data/repository/user_repository.dart';
import 'package:dio/dio.dart';
import 'package:daichao/common/net/address.dart';
import 'package:daichao/model/base_model.dart';
import 'package:daichao/model/net_error_model.dart';

// 请求方式
class HttpMethod {
  static const String GET = 'GET';
  static const String POST = 'POST';
  static const String PUT = 'PUT';
  static const String PATCH = 'PATCH';
  static const String DELETE = 'DELETE';
}

const int _connectTimeout = 15000; //15s
const int _receiveTimeout = 15000;
const int _sendTimeout = 10000;

// 网络请求工具类（单例模式）
class NetUtils {
  factory NetUtils() => _getInstance();

  static NetUtils _instance;

  Dio _dio;
  BaseOptions baseOptions;
  // 私有化构造方法
  NetUtils._internal() {
    if (_dio == null) {
      baseOptions = BaseOptions(
        baseUrl: Address.baseUrl,
        contentType: Headers.jsonContentType,
        responseType: ResponseType.json,
        receiveDataWhenStatusError: false,
        validateStatus: (status) {
          // 不使用http状态码判断状态，使用AdapterInterceptor来处理（适用于标准REST风格）
          return true;
        },
        connectTimeout: _connectTimeout,
        receiveTimeout: _receiveTimeout,
        sendTimeout: _sendTimeout,
      );
      // 所有接口公共的请求头设置
      baseOptions.headers['token'] = UserRespository().userModel.token ?? ""; // 请求头设置token

      _dio = Dio(baseOptions);
      // 拦截器可以在请求之前，响应之前，以及错误之前做一些预处理
      // _dio.interceptors.add(HttpInterceptors()); // 请求以及响应信息拦截器
    }
  }

  // 返回类实例的方法
  static NetUtils _getInstance() {
    if (_instance == null) {
      _instance = NetUtils._internal();
    }
    return _instance;
  }

  static Map<String, dynamic> makeException(int code, String msg) {
    Map<String, dynamic> retMap = {'code': code, 'msg': msg};
    return retMap;
  }

  // 网络请求，泛型为dynamic，因为请求成功返回BaseModel的子类，异常返回NetErrorModel
  Future<dynamic> request(
    String url,
    BaseModel model, {
    String method = HttpMethod.GET, // 默认为get请求
    Options options, // 可单独设置各个请求的请求头，超时时间等
    String baseUrl,
    bool auth = false,
    CancelToken cancelToken,
    Function(int, int) onSendProgress,
    Function(int, int) onReceiveProgress,
    List<dynamic> path,
    dynamic params,
  }) async {
    try {
      // 网络判断
      var connectivityResult = await (Connectivity().checkConnectivity());
      if (connectivityResult == ConnectivityResult.none) {
        // 没有网络
        return Future.error(NetErrorModel(700, "网络异常"));
      }
      // 链接中参数
      if (path != null && path.isNotEmpty) {
        StringBuffer sb = StringBuffer("");
        path.forEach((value) {
          sb.write("/$value");
        });
        String paramStr = sb.toString();
        url += paramStr;
      }
      // 单独设置某个请求的BaseUrl
      if (baseUrl != null) {
        _dio.options.baseUrl = baseUrl;
      }

      // 执行网络请求
      Response response = await _dio.request(
        url,
        cancelToken: cancelToken,
        data: params, // post时
        queryParameters: params, // get时
        options: checkOptions(method, options),
        onSendProgress: onSendProgress,
        onReceiveProgress: onReceiveProgress,
      );

      if (response != null) {
        if (response.statusCode == 200) {
          // 接口请求成功
          BaseEntity entity = BaseEntity.fromMap(response.data);
          if (entity.code == 0) {
            return model.fromMap(entity.data);
          } else {
            // 接口请求成功(自定义异常)
            return Future.error(
              NetErrorModel(
                entity.code,
                entity.message,
              ),
            );
          }
          // return model.fromMap(response.data);
        } else {
          return Future.error(
            NetErrorModel(
              response.statusCode,
              response.statusMessage,
            ),
          );
        }
      } else {
        return Future.error(NetErrorModel(-1, "未知错误"));
      }
    } on DioError catch (e) {
      return createErrorEntity(e);
    }
  }

  Options checkOptions(String method, Options options) {
    options ??= Options();
    options.method = method;
    return options;
  }

  Future createErrorEntity(DioError e) {
    String sReason = e.message;
    int nErrCode = -1;
    if (e.type == DioErrorType.connectTimeout) {
      sReason = '连接超时!';
      nErrCode = 601;
    } else if (e.type == DioErrorType.sendTimeout) {
      sReason = '请求超时!';
      nErrCode = 602;
    } else if (e.type == DioErrorType.receiveTimeout) {
      sReason = '响应超时!';
      nErrCode = 603;
    } else if (e.type == DioErrorType.cancel) {
      sReason = '请求取消!';
      nErrCode = 604;
    } else if (e.type == DioErrorType.response) {
      // RESPONSE:当服务器有响应，但状态不正确时，例如404,503...。
      sReason = e.response.statusMessage;
      nErrCode = e.response.statusCode;
    }
    return Future.error(NetErrorModel(nErrCode, sReason));
  }
}
