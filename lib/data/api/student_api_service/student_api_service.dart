import 'dart:io';

import 'package:dio/dio.dart';
import 'package:image_picker/image_picker.dart';
import 'package:registon/data/api/student_api_service/student_api_client.dart';
import 'package:registon/data/models/app_response/app_response.dart';
import 'package:registon/data/repository/storage_repository.dart';

import '../../models/student_model/student_model.dart';

class StudentApiService extends StudentApiClient {
  Future<AppResponse> getStudentInfo() async {
    AppResponse myResponse = AppResponse();
    try {
      String token = await StorageRepository.gettoken();
      print(token);
      Response response = await dio.get(
        "${dio.options.baseUrl}student/get-by-token",

      );

      if (response.statusCode == 200) {
        myResponse.data = StudentModel.fromJson(response.data);
        myResponse.statusCode = response.statusCode;
        // print(myResponse.data);
      }
    } catch (e) {
      // print(e);
      myResponse.errorTxt = e.toString();
    }
    return myResponse;
  }

  Future<AppResponse> updateStudent({
    required String firstName,
    required String lastName,
    required int studentLevel,
    required String subject,
    required String birthDate,
    required String phoneNumber,
    required String password,
    required XFile file,
    required int id,
  }) async {
    AppResponse myResponse = AppResponse();
    FormData data = FormData.fromMap({
      "FirstName": firstName,
      "LastName": lastName,
      "PhoneNumber": phoneNumber,
      "Password": password,
      "Image": await MultipartFile.fromFile(file.path),
      "Subject": subject,
      "BirthDate": birthDate,
      "StudentLevel": studentLevel,
    });

    try {
      Response response = await dio.put("${dio.options.baseUrl}student/update",
          queryParameters: {"id": id}, data: data);
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
