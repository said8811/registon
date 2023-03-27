import 'package:dio/dio.dart';
import 'package:registon/data/api/api_client.dart';
import 'package:registon/data/models/subjects_model/subject_model.dart';
import 'package:registon/data/models/teachers_model/teachers_model.dart';

import '../../models/app_response/app_response.dart';

class TeachersApiService extends ApiClient {
  Future<AppResponse> getTeachers() async {
    AppResponse myRespone = AppResponse(errorTxt: "");
    try {
      Response response = await dio.get("${dio.options.baseUrl}/teacher/GetAll",
          queryParameters: {"page": 1});
      if (response.statusCode! >= 200 && response.statusCode! < 300) {
        //print(response.data);
        myRespone.data = (response.data as List)
            .map((e) => TeachersModel.fromJson(e))
            .toList();
      }
    } catch (e) {
      //print(e);
      myRespone.errorTxt = e.toString();
    }
    return myRespone;
  }

  Future<AppResponse> getSubjects() async {
    AppResponse myRespone = AppResponse(errorTxt: "");
    try {
      Response response = await dio.get(
          "${dio.options.baseUrl}/get-group-teachers",
          queryParameters: {"page": 1});
      if (response.statusCode! >= 200 && response.statusCode! < 300) {
        myRespone.data = (response.data as List)
            .map((e) => SubjectModel.fromJson(e))
            .toList();
      }
    } catch (e) {
      myRespone.errorTxt = e.toString();
    }
    return myRespone;
  }
}
