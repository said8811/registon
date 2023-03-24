class TeachersModel {
  String firstName;
  String lastName;
  String imagePath;
  String phoneNumber;
  String description;
  String birthDate;
  int partOfDay;
  bool workDays;
  String teacherLevel;
  String subject;
  String createdAt;
  int id;

  TeachersModel(
      {required this.firstName,
      required this.lastName,
      required this.imagePath,
      required this.phoneNumber,
      required this.description,
      required this.birthDate,
      required this.partOfDay,
      required this.workDays,
      required this.teacherLevel,
      required this.subject,
      required this.createdAt,
      required this.id});

  factory TeachersModel.fromJson(Map<String, dynamic> json) {
    return TeachersModel(
      firstName: json['firstName'],
      lastName: json['lastName'],
      imagePath: json['imagePath'],
      phoneNumber: json['phoneNumber'],
      description: json['description'],
      birthDate: json['birthDate'],
      partOfDay: json['partOfDay'],
      workDays: json['workDays'],
      teacherLevel: json['teacherLevel'],
      subject: json['subject'],
      createdAt: json['createdAt'],
      id: json['id'],
    );
  }
}
