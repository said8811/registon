import 'package:image_picker/image_picker.dart';
import 'package:registon/data/api/student_api_service/student_api_service.dart';
import 'package:registon/data/models/app_response/app_response.dart';

import '../../get_it.dart';

class StudentRepository {
  Future<AppResponse> getStudentInfo() async =>
      await getIt<StudentApiService>().getStudentInfo();

  Future<AppResponse> updateStudentInfo({
    required String firstName,
    required String lastName,
    required String subject,
    required String subjects,
    required String phoneNumber,
    required String password,
    required XFile file,
  }) async =>
      await getIt<StudentRepository>().updateStudentInfo(
        firstName: firstName,
        lastName: lastName,
        subject: subject,
        subjects: subjects,
        phoneNumber: phoneNumber,
        password: password,
        file: file,
      );
}
