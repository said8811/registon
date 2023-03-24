import 'package:bloc/bloc.dart';
import 'package:registon/bloc/student_profile/bloc/student_profile_event.dart';
import 'package:registon/bloc/student_profile/bloc/student_profile_state.dart';
import 'package:registon/data/models/app_response/app_response.dart';
import 'package:registon/data/models/student_model/student_model.dart';
import 'package:registon/data/repository/student_repo/student_repository.dart';

import '../../../data/get_it.dart';
import '../../../data/models/form_status/form_status.dart';

class StudentProfileBloc
    extends Bloc<StudentProfileEvent, StudentProfileState> {
  StudentProfileBloc()
      : super(StudentProfileState(
            status: FormStatus.pure,
            student: StudentModel(
              subject: '',
              weeklyLimit: 0,
              studentLevel: 0,
              createdAt: '',
              birthDate: '',
              firstName: '',
              id: 0,
              image: '',
              lastName: '',
              phoneNumber: '',
              subjects: '',
            ),
            errorMessage: '')) {
    on<GetStudentInfoEvent>(getStudentInfo);
    on<UpdateStudentInfoEvent>(updateStudentInfo);
  }

  Future<void> getStudentInfo(event, emit) async {
    emit(state.copyWith(status: FormStatus.gettingStudentInfoInProgress));
    AppResponse myResponse = await getIt<StudentRepository>().getStudentInfo();
    if (myResponse.errorTxt.isEmpty) {
      emit(state.copyWith(
        status: FormStatus.gettingStudentInfoInSuccess,
        student: myResponse.data,
      ));
    } else {
      emit(state.copyWith(
        status: FormStatus.gettingStudentInfoInFailury,
        errorMessage: myResponse.errorTxt,
      ));
    }
  }

  Future<void> updateStudentInfo(UpdateStudentInfoEvent event, emit) async {
    emit(state.copyWith(status: FormStatus.updateStudentInfoInProgress));
    AppResponse myResponse = await getIt<StudentRepository>().updateStudentInfo(
        file: event.image,
        firstName: event.firstName,
        lastName: event.lastName,
        password: event.password,
        phoneNumber: event.phoneNumber,
        subject: event.subject,
        subjects: event.subjects);
    if (myResponse.errorTxt.isEmpty) {
      emit(state.copyWith(status: FormStatus.updateStudentInfoInSuccess));
    } else {
      emit(state.copyWith(
          status: FormStatus.updateStudentInfoInFailury,
          errorMessage: myResponse.errorTxt));
    }
  }
}
