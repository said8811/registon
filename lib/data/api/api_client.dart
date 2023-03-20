import 'package:dio/dio.dart';

class LoginApiClient {
  LoginApiClient() {
    _init();
  }

  late Dio dio;

  _init() {
    dio = Dio(
      BaseOptions(
        baseUrl: "http://3.70.231.199",
        connectTimeout: const Duration(seconds: 25000),
        receiveTimeout: const Duration(seconds: 20000),
      ),
    );

    dio.interceptors.add(InterceptorsWrapper(
        onError: (DioError error, ErrorInterceptorHandler handler) {
      print(error);
    }, onRequest:
            (RequestOptions requestOptions, RequestInterceptorHandler handler) {
      return handler.next(requestOptions);
    }, onResponse: (Response response, ResponseInterceptorHandler handler) {
      return handler.next(response);
    }));
  }
}
