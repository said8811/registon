import 'dart:io';

import 'package:dio/dio.dart';
import 'package:registon/data/api/student_api_service/student_api_client.dart';
import 'package:registon/data/models/app_response/app_response.dart';

class StudentApiService extends StudentApiClient {
  Future<AppResponse> getStudentInfo() async {
    AppResponse myResponse = AppResponse();
    try {
      Response response =
          await dio.get("${dio.options.baseUrl}student/get-by-token");
      if (response.statusCode == 200) {
        myResponse.data = response.data;
        myResponse.statusCode = response.statusCode;
      }
    } catch (e) {
      myResponse.errorTxt = e.toString();
    }
    return myResponse;
  }

  Future<AppResponse> updateStudent(
      {required String name,
      required String surname,
      required String email,
      required String phone,
      required String password,
      File? file}) async {
    AppResponse myResponse = AppResponse();
    FormData data = FormData.fromMap({
      "Name": name,
      "Surname": surname,
      "Email": email,
      "Phone": phone,
      "Password": password,
      "Image": file == null ? null : await MultipartFile.fromFile(file.path)
    });

    try {
      Response response =
          await dio.put("${dio.options.baseUrl}student/update", data: data);
      if (response.statusCode == 200) {
        myResponse.data = response.data;
        myResponse.statusCode = response.statusCode;
      }
    } catch (e) {
      myResponse.errorTxt = e.toString();
    }
    return myResponse;
  }
}
