import 'package:registon/data/api/login_api_service/login_api_service.dart';
import 'package:registon/data/models/app_response/app_response.dart';

import '../../get_it.dart';

class LoginRepository {
  Future<AppResponse> loginStudent(
          String user, String phone, String password) async =>
      await getIt<LoginApiService>().loginRequest(user, phone, password);
}
