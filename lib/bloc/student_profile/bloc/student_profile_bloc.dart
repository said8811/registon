import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'student_profile_event.dart';
part 'student_profile_state.dart';

class StudentProfileBloc extends Bloc<StudentProfileEvent, StudentProfileState> {
  StudentProfileBloc() : super(StudentProfileInitial()) {
    on<StudentProfileEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
