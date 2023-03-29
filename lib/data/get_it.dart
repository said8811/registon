import 'package:get_it/get_it.dart';
import 'package:registon/data/api/login_api_service/login_api_service.dart';
import 'package:registon/data/repository/login_repo/login_repository.dart';
import 'package:registon/data/repository/student_repo/student_repository.dart';

import 'api/student_api_service/student_api_service.dart';

final getIt = GetIt.instance;

void setup() {
  getIt.registerLazySingleton(() => LoginApiService());
  getIt.registerLazySingleton(() => LoginRepository());
  getIt.registerLazySingleton(() => StudentApiService());
  getIt.registerLazySingleton(() => StudentRepository());
}
