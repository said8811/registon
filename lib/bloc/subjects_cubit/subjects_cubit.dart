import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:registon/bloc/subjects_cubit/subjects_state.dart';
import 'package:registon/bloc/teachers_cubit/teachers_state.dart';
import 'package:registon/data/repository/teachers_repo/teachers_repository.dart';

import '../../data/models/app_response/app_response.dart';

class SubjectsCubit extends Cubit<SubjectsState> {
  SubjectsCubit({required this.repository}) : super(SubjectsInLoad()) {
    getTeachers();
  }
  TeachersRepository repository;

  getTeachers() async {
    emit(SubjectsInLoad());
    AppResponse appResponse = await repository.getSubjects();
    if (appResponse.errorTxt.isEmpty) {
      emit(SubjectsInSucces(taechers: appResponse.data));
    } else {
      emit(SubjectsInError(errorTxt: appResponse.errorTxt));
    }
  }
}
