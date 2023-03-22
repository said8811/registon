import '../../api/teachers_api_service/teachers_api_service.dart';
import '../../models/app_response/app_response.dart';

class TeachersRepository {
  TeachersApiService loginApiService;
  TeachersRepository({required this.loginApiService});

  Future<AppResponse> getTeachers() => loginApiService.getTeachers();

  Future<AppResponse> getSubjects() => loginApiService.getSubjects();
}
