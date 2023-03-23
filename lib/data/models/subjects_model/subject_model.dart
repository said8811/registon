class SubjectModel {
  String? major;
  int? count;

  SubjectModel({this.major, this.count});

  SubjectModel.fromJson(Map<String, dynamic> json) {
    major = json['major'];
    count = json['count'];
  }
}
