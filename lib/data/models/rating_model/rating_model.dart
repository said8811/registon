class RatingModel {
  String txt;
  String iconPath;
  String count;

  RatingModel({required this.txt, required this.iconPath, required this.count});

  static List<RatingModel> ratings = [
    RatingModel(
        txt: "Very satisified",
        iconPath: "assets/svg/very_satisified.svg",
        count: "587"),
    RatingModel(
        txt: "Satisified", iconPath: "assets/svg/satisified.svg", count: "321"),
    RatingModel(
        txt: "Neutral", iconPath: "assets/svg/neutral.svg", count: "200"),
    RatingModel(txt: "Poor", iconPath: "assets/svg/poor.svg", count: "44"),
  ];
}
