import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:registon/screens/app_router.dart';
import 'package:registon/widgets/indicator.dart';
import 'package:zoom_tap_animation/zoom_tap_animation.dart';

import '../../data/models/on_boarding_model/on_boarding_model.dart';

class OnBoardingPage extends StatefulWidget {
  const OnBoardingPage({super.key});

  @override
  State<OnBoardingPage> createState() => _OnBoardingPageState();
}

class _OnBoardingPageState extends State<OnBoardingPage> {
  int currentIndex = 0;
  String nextButton = "Keyingi";
  final PageController _pageController = PageController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Container(
        decoration: const BoxDecoration(color: Colors.white),
        width: double.infinity,
        child: Column(
          children: [
            Container(
              decoration: const BoxDecoration(),
              margin: const EdgeInsets.only(top: 100).r,
              height: 500.h,
              child: PageView.builder(
                physics: const BouncingScrollPhysics(),
                controller: _pageController,
                onPageChanged: (value) {
                  setState(() {});
                  currentIndex = value;
                  if (value == 2) {
                    nextButton = "Boshlash";
                  }
                },
                scrollDirection: Axis.horizontal,
                itemCount: OnBoardingModel.pages.length,
                itemBuilder: (context, index) {
                  OnBoardingModel page = OnBoardingModel.pages[index];
                  return Container(
                    child: Column(
                      children: [
                        Image.asset(
                          page.imgUrl,
                          height: 400.h,
                        ),
                        Text(page.text)
                      ],
                    ),
                  );
                },
              ),
            ),
            MyIndicator(
              currentIndex: currentIndex,
            ),
            SizedBox(
              height: 50.h,
            ),
            ZoomTapAnimation(
              onTap: () {
                _pageController.nextPage(
                    duration: const Duration(milliseconds: 500),
                    curve: Curves.linear);
                if (nextButton == "Boshlash") {
                  Navigator.pushReplacementNamed(context, RouteName.login);
                }
              },
              child: AnimatedContainer(
                duration: const Duration(milliseconds: 500),
                width: nextButton == 'Keyingi' ? 150.w : 200.w,
                height: 44.h,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20.r),
                    color: Colors.orange),
                child: Center(
                  child: Text(
                    nextButton,
                    style: TextStyle(fontSize: 15.sp, color: Colors.white),
                  ),
                ),
              ),
            ),
          ],
        ),
      )),
    );
  }
}
