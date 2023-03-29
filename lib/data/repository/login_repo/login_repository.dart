import 'package:registon/data/api/login_api_service/login_api_service.dart';
import 'package:registon/data/get_it.dart';
import 'package:registon/data/models/app_response/app_response.dart';

class LoginRepository {
  LoginRepository();
  Future<AppResponse> loginStudent(
          String user, String phone, String password) async =>
      await getIt<LoginApiService>().loginRequest(user, phone, password);
}
