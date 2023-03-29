import 'package:image_picker/image_picker.dart';

abstract class StudentProfileEvent {}

class GetStudentInfoEvent extends StudentProfileEvent {}

class UpdateStudentInfoEvent extends StudentProfileEvent {
  String subject;
  String lastName;
  String firstName;
  String phoneNumber;
  String subjects;
  XFile image;
  String password;

  UpdateStudentInfoEvent(
      {required this.image,
      required this.firstName,
      required this.lastName,
      required this.phoneNumber,
      required this.subject,
      required this.subjects,
      required this.password});
}
