part of 'student_profile_bloc.dart';

abstract class StudentProfileState extends Equatable {
  const StudentProfileState();
  
  @override
  List<Object> get props => [];
}

class StudentProfileInitial extends StudentProfileState {}
