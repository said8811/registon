abstract class UserLoginState {}

class UserRegisterInLoad extends UserLoginState {}

class UserLoginInError extends UserLoginState {
  UserLoginInError({required this.errorTxt});
  String errorTxt;
}

class UserLoginInSucces extends UserLoginState {
  UserLoginInSucces();
}
