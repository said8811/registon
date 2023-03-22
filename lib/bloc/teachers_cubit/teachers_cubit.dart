import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:registon/bloc/teachers_cubit/teachers_state.dart';
import 'package:registon/data/repository/teachers_repo/teachers_repository.dart';

import '../../data/models/app_response/app_response.dart';

class TeachersCubit extends Cubit<TeachersState> {
  TeachersCubit({required this.repository}) : super(TeachersInLoad()) {
    getTeachers();
  }
  TeachersRepository repository;

  getTeachers() async {
    emit(TeachersInLoad());
    AppResponse appResponse = await repository.getTeachers();
    if (appResponse.errorTxt.isEmpty) {
      emit(TeachersInSucces(taechers: appResponse.data));
    } else {
      emit(TeachersInError(errorTxt: appResponse.errorTxt));
    }
  }
}
