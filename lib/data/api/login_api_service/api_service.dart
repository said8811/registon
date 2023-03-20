import 'package:dio/dio.dart';
import 'package:registon/data/models/app_response/app_response.dart';
import 'package:registon/data/repository/storage_repository.dart';

import '../api_client.dart';

class LoginApiService extends LoginApiClient {
  Future<AppResponse> loginRequest(
      String user, String number, String password) async {
    AppResponse myRespone = AppResponse(errorTxt: "");
    try {
      final formData = FormData.fromMap({
        'PhoneNumber': number,
        'Password': password,
      });
      Response response = await dio.post("${dio.options.baseUrl}/$user/login",
          data: formData,
          options: Options(headers: {
            "Content-Type": "multipart/form-data",
          }));
      if (response.statusCode! >= 200 && response.statusCode! < 300) {
        print(response.data);
        myRespone.data = response.data;
      }
    } catch (e) {
      print(e);
      myRespone.errorTxt = e.toString();
    }
    return myRespone;
  }
}
