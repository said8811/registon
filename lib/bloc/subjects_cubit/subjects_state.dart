import 'package:registon/data/models/subjects_model/subject_model.dart';

abstract class SubjectsState {}

class SubjectsInLoad extends SubjectsState {}

class SubjectsInError extends SubjectsState {
  SubjectsInError({required this.errorTxt});
  String errorTxt;
}

class SubjectsInSucces extends SubjectsState {
  List<SubjectModel> taechers;
  SubjectsInSucces({required this.taechers});
}
