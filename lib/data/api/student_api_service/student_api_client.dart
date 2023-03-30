import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';

import '../../repository/storage_repository.dart';

class StudentApiClient {
  StudentApiClient() {
    _init();
  }

  late Dio dio;
  _init() {
    dio = Dio(
      BaseOptions(
        baseUrl: "http://3.70.231.199/",
      ),
    );

    dio.interceptors.add(InterceptorsWrapper(onError: ((error, handler) {
      debugPrint('ERROR OCCURRED: ${error.response?.statusCode} $error');
      return handler.next(error);
    }), onRequest: (requestOptions, handler) async {
      String token = await StorageRepository.gettoken();
      requestOptions.headers["Authorization"] = token;
      //requestOptions.headers["accept"] = "application/json";
      return handler.next(requestOptions);
    }, onResponse: (Response response, ResponseInterceptorHandler handler) {
      debugPrint("RESPONSE HAS RECEIVED");
      return handler.next(response);
    }));
  }
}
