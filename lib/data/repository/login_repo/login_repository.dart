import 'package:registon/data/api/login_api_service/login_api_service.dart';
import 'package:registon/data/models/app_response/app_response.dart';

class LoginRepository {
  LoginRepository({required this.apiService});
  LoginApiService apiService;
  Future<AppResponse> loginStudent(
          String user, String phone, String password) async =>
      apiService.loginRequest(user, phone, password);
}
