import 'package:registon/data/models/teachers_model/teachers_model.dart';

abstract class TeachersState {}

class TeachersInLoad extends TeachersState {}

class TeachersInError extends TeachersState {
  TeachersInError({required this.errorTxt});
  String errorTxt;
}

class TeachersInSucces extends TeachersState {
  List<TeachersModel> taechers;
  TeachersInSucces({required this.taechers});
}
