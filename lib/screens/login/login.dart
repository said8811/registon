import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:zoom_tap_animation/zoom_tap_animation.dart';

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
                        ZoomTapAnimation(
                          onTap: () => setState(() {
                            index = 0;
                          }),
                          child: Container(
                            height: 106.h,
                            width: 156.w,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10).r,
                                border: Border.all(
                                    color: Colors.orange, width: 1.w)),
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
                                          borderRadius:
                                              BorderRadius.circular(15),
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
                        ),
                        SizedBox(width: 15.w),
                        ZoomTapAnimation(
                          onTap: () => setState(() {
                            index = 1;
                          }),
                          child: Container(
                            height: 106.h,
                            width: 156.w,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10).r,
                                border: Border.all(
                                    color: Colors.orange, width: 1.w),
                                color: Colors.orange),
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
                                          borderRadius:
                                              BorderRadius.circular(15),
                                          border:
                                              Border.all(color: Colors.white)),
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
                                  "Men\nO'QUVCHIMAN",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 16.sp,
                                      fontWeight: FontWeight.bold),
                                )
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
            Positioned(
              top: 320.h,
              child: Column(
                children: [
                  Container(
                    width: 360.w,
                    height: 50.h,
                    padding: const EdgeInsets.symmetric(horizontal: 20).r,
                    child: TextFormField(
                      keyboardType: TextInputType.phone,
                      decoration: const InputDecoration(
                          labelText: "Telefon raqami",
                          prefixIcon: Icon(Icons.phone)),
                    ),
                  ),
                  SizedBox(height: 30.h),
                  Container(
                    width: 360.w,
                    height: 50.h,
                    padding: const EdgeInsets.symmetric(horizontal: 20).r,
                    child: TextFormField(
                      obscureText: true,
                      keyboardType: TextInputType.visiblePassword,
                      decoration: const InputDecoration(
                          labelText: "Parol", prefixIcon: Icon(Icons.lock)),
                    ),
                  ),
                ],
              ),
            ),
            Positioned(
                bottom: 40.h,
                left: 40.h,
                child: ZoomTapAnimation(
                  onTap: () {},
                  child: Container(
                    width: 300.w,
                    height: 50.h,
                    decoration: BoxDecoration(
                        color: Colors.orange,
                        borderRadius: BorderRadius.circular(30)),
                    child: Center(
                      child: Text(
                        "Login",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 18.sp,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                ))
          ],
        ),
      )),
    );
  }
}
