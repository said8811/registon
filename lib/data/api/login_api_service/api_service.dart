import 'package:dio/dio.dart';
import 'package:registon/data/models/app_response/app_response.dart';

import '../api_client.dart';

class LoginApiService extends LoginApiClient {
  Future<AppResponse> loginRequest(String number, String password) async {
    AppResponse myRespone = AppResponse(errorTxt: "");
    try {
      Response response = await dio.post("${dio.options.baseUrl}/student/login",
          data: {
            "PhoneNumber": number,
            "Password": password,
          },
          options: Options(headers: {
            "Content-Type": "multipart/form-data",
          }));
      if (response.statusCode! >= 200 && response.statusCode! < 300) {
        print(response.statusCode);
        myRespone.data = response.data;
      }
    } catch (e) {
      print(e);
      myRespone.errorTxt = e.toString();
    }
    return myRespone;
  }
}
