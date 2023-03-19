import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  int index = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: const BoxDecoration(),
        child: Stack(
          children: [
            SvgPicture.asset(
              "assets/svg/background.svg",
              // ignore: deprecated_member_use
              color: Colors.orange,
            ),
            Column(
              children: [
                SizedBox(height: 63.h),
                Center(
                  child: Text(
                    "Login",
                    style: TextStyle(
                        fontSize: 32.sp,
                        fontWeight: FontWeight.w900,
                        color: Colors.white),
                  ),
                ),
              ],
            ),
            Positioned(
              left: 20.w,
              top: 176.h,
              child: Column(
                children: [
                  Center(
                    child: Row(
                      children: [
                        Container(
                          height: 106.h,
                          width: 156.w,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10).r,
                              border:
                                  Border.all(color: Colors.orange, width: 1.w)),
                          child: Column(
                            children: [
                              Row(
                                children: [
                                  const Spacer(),
                                  Container(
                                    width: 25.w,
                                    height: 25.h,
                                    padding: const EdgeInsets.all(3).r,
                                    margin: const EdgeInsets.only(
                                            bottom: 10, top: 10, right: 10)
                                        .r,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(15),
                                        border:
                                            Border.all(color: Colors.orange)),
                                    child: SvgPicture.asset(
                                      "assets/svg/path.svg",
                                      color: index == 0
                                          ? Colors.orange
                                          : Colors.white,
                                    ),
                                  ),
                                ],
                              ),
                              Text(
                                "Men\nO'QITUVCHIMAN",
                                style: TextStyle(
                                    color: Colors.orange,
                                    fontSize: 16.sp,
                                    fontWeight: FontWeight.bold),
                              )
                            ],
                          ),
                        ),
                        SizedBox(width: 15.w),
                        Container(
                          height: 106.h,
                          width: 156.w,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10).r,
                              border:
                                  Border.all(color: Colors.orange, width: 1.w),
                              color: Colors.orange),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      )),
    );
  }
}
