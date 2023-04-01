import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:registon/data/models/teachers_model/teachers_model.dart';
import 'package:registon/screens/teacher_details/widgets/comment_widget.dart';
import 'package:registon/screens/teacher_details/widgets/rating_widget.dart';
import 'widgets/calendar_container.dart';

class TeacherDetails extends StatefulWidget {
  TeachersModel teacher;
  TeacherDetails({super.key, required this.teacher});

  @override
  State<TeacherDetails> createState() => _TeacherDetailsState();
}

class _TeacherDetailsState extends State<TeacherDetails> {
  int selectedDay = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.orange,
        elevation: 0,
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      body: SingleChildScrollView(
        child: Container(
          width: double.infinity,
          decoration: const BoxDecoration(color: Colors.orange),
          child: Column(
            children: [
              SizedBox(
                height: 180.h,
              ),
              Container(
                height: 900.h,
                width: double.infinity,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(35.r),
                        topRight: Radius.circular(35.r))),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      margin: EdgeInsets.only(
                          bottom: 40.r, left: 24.r, right: 24.r),
                      height: 100.h,
                      child: Stack(
                        alignment: Alignment.topCenter,
                        clipBehavior: Clip.none,
                        children: [
                          Positioned(
                            top: -45.h,
                            left: 118.w,
                            child: Column(
                              children: [
                                Container(
                                  height: 100.h,
                                  width: 100.w,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(50).r,
                                      color: Colors.white,
                                      image: DecorationImage(
                                          image: NetworkImage(
                                              "http://3.70.231.199/${widget.teacher.imagePath}"),
                                          fit: BoxFit.cover)),
                                ),
                                SizedBox(height: 15.h),
                                Text(
                                  widget.teacher.firstName,
                                  style: TextStyle(
                                      fontSize: 24.sp,
                                      fontWeight: FontWeight.w900),
                                ),
                                SizedBox(height: 10.h),
                                Text(
                                  widget.teacher.subject,
                                  style: TextStyle(
                                      fontSize: 14.sp,
                                      fontWeight: FontWeight.w400),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 24.0),
                      child: Text(
                        "Men Haqimda",
                        style: TextStyle(
                            fontSize: 24.sp, fontWeight: FontWeight.bold),
                      ),
                    ),
                    SizedBox(height: 12.h),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 24.0.r),
                      child: const Text(
                          "I'm Joff, I'm a ui/ux designer with a passion for teaching. I'm the lead instructor at the london app brewery, london's leading leading designcamp. I've helped hundreds of thousands of students learn design system and change their lives by becoming…"),
                    ),
                    SizedBox(height: 20.h),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 24.0.r),
                      child: Text(
                        "O'quvchilar reytingi",
                        style: TextStyle(
                            fontSize: 24.sp, fontWeight: FontWeight.bold),
                      ),
                    ),
                    SizedBox(height: 20.h),
                    const TeacherRatingWidget(),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 24.0.r),
                      child: Row(
                        children: [
                          Text(
                            "O'quvchilar fikri",
                            style: TextStyle(
                                fontSize: 24.sp, fontWeight: FontWeight.bold),
                          ),
                          const Spacer(),
                          TextButton(
                            child: const Text("Davomi"),
                            onPressed: () {},
                          )
                        ],
                      ),
                    ),
                    Container(
                      decoration: const BoxDecoration(),
                      height: 151.h,
                      child: ListView.separated(
                        physics: const BouncingScrollPhysics(),
                        padding: EdgeInsets.only(left: 24.r, right: 24.r),
                        scrollDirection: Axis.horizontal,
                        shrinkWrap: true,
                        separatorBuilder: (context, index) => SizedBox(
                          width: 15.w,
                        ),
                        itemCount: 8,
                        itemBuilder: (context, index) {
                          return const CommentWidget();
                        },
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
 //   SizedBox(

            //     height: 88.h,
            //     child: ListView.builder(
            //       itemCount: 7,
            //       padding: const EdgeInsets.only(left: 24, right: 12).r,
            //       scrollDirection: Axis.horizontal,
            //       physics: const BouncingScrollPhysics(),
            //       itemBuilder: (context, index) {
            //         return GestureDetector(
            //           onTap: () {
            //             setState(() {
            //               selectedDay = index;
            //             });
            //           },
            //           child: CalendarContainer(
            //             select: selectedDay == index ? true : false,
            //             week: DateFormat.E().format(
            //                 DateTime.fromMillisecondsSinceEpoch(
            //                     DateTime.now().millisecondsSinceEpoch +
            //                         (index) * 86400000)),
            //             date: DateTime.fromMillisecondsSinceEpoch(
            //                     DateTime.now().millisecondsSinceEpoch +
            //                         (index) * 86400000)
            //                 .day,
            //           ),
            //         );
            //       },
            //     ),
            //   ),