// ignore_for_file: must_be_immutable

import 'package:equatable/equatable.dart';
import 'package:registon/data/models/student_model/student_model.dart';

import '../../../data/models/form_status/form_status.dart';

class StudentProfileState extends Equatable {
  StudentProfileState(
      {required this.status,
      required this.student,
      required this.errorMessage});

  FormStatus status;
  StudentModel student;
  String errorMessage;

  copyWith({FormStatus? status, dynamic student, String? errorMessage}) =>
      StudentProfileState(
          status: status ?? this.status,
          errorMessage: errorMessage ?? this.errorMessage,
          student: student ?? this.student);

  @override
  List<Object?> get props => [status, student, errorMessage];
}
