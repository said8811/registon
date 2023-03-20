import 'package:registon/data/api/login_api_service/api_service.dart';
import 'package:registon/data/models/app_response/app_response.dart';

class LoginRepository {
  LoginApiService loginApiService;
  LoginRepository({required this.loginApiService});

  Future<AppResponse> loginStudent(
          String user, String phone, String password) =>
      loginApiService.loginRequest(user, phone, password);
}
