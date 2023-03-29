import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:registon/bloc/login_cubit/login_state.dart';
import 'package:registon/data/get_it.dart';
import 'package:registon/data/models/app_response/app_response.dart';
import 'package:registon/data/repository/login_repo/login_repository.dart';
import 'package:registon/data/repository/storage_repository.dart';

class LoginCubit extends Cubit<UserLoginState> {
  LoginCubit() : super(UserRegisterInLoad());

  login(String user, String phone, String password) async {
    emit(UserRegisterInLoad());
    AppResponse appResponse =
        await getIt<LoginRepository>().loginStudent(user, phone, password);
    if (appResponse.errorTxt.isEmpty) {
      StorageRepository.savetoken(appResponse.data as String);
      emit(UserLoginInSucces());
    } else {
      emit(UserLoginInError(errorTxt: appResponse.errorTxt));
    }
  }
}
