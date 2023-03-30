class OnBoardingModel {
  String imgUrl;
  String text;
  OnBoardingModel({required this.imgUrl, required this.text});

  static List<OnBoardingModel> pages = [
    OnBoardingModel(
        imgUrl: "assets/images/onBoarding1.jpg",
        text: "Talabalar uchun\nfoydali manbalarni kashf eting"),
    OnBoardingModel(
        imgUrl: "assets/images/onBoarding2.jpg",
        text: "Yangi odamlarni\nuchrating va bilimigizni yaxshilang"),
    OnBoardingModel(
        imgUrl: "assets/images/onBoarding3.jpg",
        text: "Do'stlaringiz bilan\nfikringizni ulashing!"),
  ];
}
