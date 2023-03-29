class StudentModel {
  final String subject;
  final int weeklyLimit;
  final int studentLevel;
  final String createdAt;
  final String birthDate;
  final int id;
  final String firstName;
  final String lastName;
  final String phoneNumber;
  final String subjects;
  final String image;

  StudentModel({
    required this.subject,
    required this.weeklyLimit,
    required this.studentLevel,
    required this.createdAt,
    required this.birthDate,
    required this.firstName,
    required this.id,
    required this.image,
    required this.lastName,
    required this.phoneNumber,
    required this.subjects,
  });

  factory StudentModel.fromJson(Map<String, dynamic> json) => StudentModel(
        subject: json['subject'] as String? ?? '',
        weeklyLimit: json['weeklyLimit'] as int? ?? 0,
        studentLevel: json['studentLevel'] as int? ?? 0,
        createdAt: json['createdAt'] as String? ?? '',
        birthDate: json['birthDate'] as String? ?? '',
        firstName: json['firstName'] as String? ?? '',
        id: json['id'] as int? ?? 0,
        image: json['image'] as String? ?? '',
        lastName: json['lastName'] as String? ?? '',
        phoneNumber: json['phoneNumber'] as String? ?? '',
        subjects: json['subjects'] as String? ?? '',
      );

  Map<String, dynamic> toJson() => {
        'subject': subject,
        'weeklyLimit': weeklyLimit,
        'studentLevel': studentLevel,
        'createdAt': createdAt,
        'birthDate': birthDate,
        'firstName': firstName,
        'id': id,
        'image': image,
        'lastName': lastName,
        'phoneNumber': phoneNumber,
        'subjects': subjects,
      };
}
