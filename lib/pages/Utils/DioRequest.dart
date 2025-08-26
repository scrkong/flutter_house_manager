import 'package:dio/dio.dart';

import '../../constans/index.dart';

class DioRequest {
  final _dio = Dio(); // 它相当于const instance = axios.create()

// 构造函数 在new这个类的时候执行
  DioRequest() {
    // _dio.options.baseUrl = GlobalVariable.BASE_URL;
    // // 连接超时时间
    // _dio.options.connectTimeout =
    //     const Duration(seconds: GlobalVariable.NEW_WORK_TIME_OUT);
    // // 接收超时时间
    // _dio.options.receiveTimeout =
    //     const Duration(seconds: GlobalVariable.NEW_WORK_TIME_OUT);
    // 这叫链式调用
    _dio
      ..options.baseUrl = GlobalVariable.BASE_URL
      ..options.connectTimeout =
          const Duration(seconds: GlobalVariable.NEW_WORK_TIME_OUT)
      ..options.receiveTimeout =
          const Duration(seconds: GlobalVariable.NEW_WORK_TIME_OUT)
      ..options.sendTimeout =
          const Duration(seconds: GlobalVariable.NEW_WORK_TIME_OUT);

    _dio.interceptors.add(InterceptorsWrapper(onRequest: (context, handler) {
      // 请求拦截器
      // 注入token

      handler.next(context);
    }, onResponse: (context, handler) {
      // 2xx才是成功
      //http状态码
      if (context.statusCode! >= 200 && context.statusCode! < 300) {
        // 响应拦截器
        handler.next(context); // 成功
      } else {
        // 说明 Promise pending fullfiled rejected
        handler
            .reject(DioException(requestOptions: context.requestOptions)); // 失败
      }
    },
        // 错误拦截器
        onError: (context, handler) {
      handler.reject(context);
    }));
  }

  // 工具最终都要通过 dio
  get(String url, {Map<String, dynamic>? params}) {
    return _handleResponse(_dio.get(url, queryParameters: params));
  }

  post(String url, {Map<String, dynamic>? data}) {
    return _handleResponse(_dio.post(url, data: data));
  }

  put(String url, {Map<String, dynamic>? data}) {
    return _handleResponse(_dio.put(url, data: data));
  }

  delete(String url,
      {Map<String, dynamic>? data, Map<String, dynamic>? params}) {
    return _handleResponse(
        _dio.delete(url, data: data, queryParameters: params));
  }

  upload(String url) {}

  _handleResponse(Future<Response<dynamic>> task) async {
    final res = await task;
    // 业务状态码
    if (res.data["code"] == GlobalVariable.SUCCESS_CODE) {
      return res.data["data"]; // fullfiled
    }
    // 提示错误消息
    // return Promise.reject()
    throw DioException(requestOptions: res.requestOptions); // 抛出异常 rejected状态
  }
}

final dioRequest = DioRequest();


// rcp 中delete要传递请求体参数

// rcp.createSession() instance.delete(url, )
// new rcp.Request("url", {}, null, {})
// instace.fetch(request)