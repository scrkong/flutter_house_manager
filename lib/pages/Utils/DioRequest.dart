import 'package:dio/dio.dart';
import 'package:flutter_house_manager/constans/index.dart';

class Diorequest {
  final _dio = Dio();
  Diorequest() {
    _dio
      ..options.baseUrl = GlobalVariable.BASE_URL
      ..options.connectTimeout =
          const Duration(seconds: GlobalVariable.NEW_WORK_TIME_OUT)
      ..options.receiveTimeout =
          const Duration(seconds: GlobalVariable.NEW_WORK_TIME_OUT)
      ..options.sendTimeout =
          const Duration(seconds: GlobalVariable.NEW_WORK_TIME_OUT);

    _dio.interceptors.add(InterceptorsWrapper(
        //请求拦截器 注入token
        onRequest: (context, handler) {
      handler.next(context);
    },
        //响应拦截器  判断http状态码的异常
        onResponse: (context, handler) {
      if (context.statusCode! >= 200 && context.statusCode! < 300) {
        handler.next(context);
      } else {
        handler.reject(DioException(requestOptions: context.requestOptions));
      }
      handler.next(context);
    },
        //错误拦截器  处理401的错误，401错误一般要进行刷新token
        onError: (context, handler) {
      handler.reject(context);
    }));
  }
  get(String url, {Map<String, dynamic>? params}) {
    return _dio.get(url, queryParameters: params);
  }

  put(String url, {Map<String, dynamic>? data}) {
    return _dio.put(url, data: data);
  }

  post(String url, {Map<String, dynamic>? data}) {
    return _dio.post(url, data: data);
  }

  delete(String url,
      {Map<String, dynamic>? data, Map<String, dynamic>? params}) {
    return _dio.delete(url, data: data, queryParameters: params);
  }

  upload(String url) {}
}

_handleResponse(Future<Response<dynamic>> task) async {
  final res = await task;
  if (res.data["code"] == 200) {
    return res.data["data"];
  } else {
    throw DioException(requestOptions: res.requestOptions);
  }
}

final diorequest = Diorequest();
