import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';

import '../../repository/storage_repository.dart';

class StudentApiClient {
  StudentApiClient() {
    _init();
  }

  late Dio dio;
  String studentToken =
      'eyJhbGciOiJodHRwOi8vd3d3LnczLm9yZy8yMDAxLzA0L3htbGRzaWctbW9yZSNobWFjLXNoYTI1NiIsInR5cCI6IkpXVCJ9.eyJJZCI6IjI0IiwiRmlyc3ROYW1lIjoiSmF2b2hpciIsIkxhc3ROYW1lIjoiU2h1a3Vyb3YiLCJJbWFnZVBhdGgiOiIiLCJQaG9uZU51bWJlciI6Iis5OTg5OTc3Nzg4OTkiLCJodHRwOi8vc2NoZW1hcy5taWNyb3NvZnQuY29tL3dzLzIwMDgvMDYvaWRlbnRpdHkvY2xhaW1zL3JvbGUiOiJTdHVkZW50IiwiZXhwIjoxNjc5Mzk2MzkzLCJpc3MiOiJSZWdpc3RhbkZlcmdoYW5hTEMudXoiLCJhdWQiOiJSZWdpc3RhbkZlcmdoYW5hTEMudXoifQ.EuQRJRU6Ax79GrX-eaKGfC_HSrfk1gL0RDoZKhV-iGY';
  _init() {
    dio = Dio(
      BaseOptions(
        baseUrl: "http://3.126.92.10/",
      ),
    );

    dio.interceptors.add(InterceptorsWrapper(onError: ((error, handler) {
      debugPrint('ERROR OCCURRED:${error.response?.statusCode}');
      return handler.next(error);
    }), onRequest: (requestOptions, handler) {
      String token =
          StorageRepository.getString("token", defValue: studentToken);
      requestOptions.headers["Authorization"] = "Bearer $token";
      requestOptions.headers["accept"] = "application/json";
      return handler.next(requestOptions);
    }, onResponse: (Response response, ResponseInterceptorHandler handler) {
      debugPrint("RESPONSE HAS RECEIVED");
      return handler.next(response);
    }));
  }
}
