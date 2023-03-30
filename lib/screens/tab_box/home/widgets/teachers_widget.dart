import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:registon/data/models/teachers_model/teachers_model.dart';

class MyTeacherWidget extends StatelessWidget {
  TeachersModel teacher;
  MyTeacherWidget({super.key, required this.teacher});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 150.w,
      decoration: BoxDecoration(
          border: Border.all(color: Colors.orange),
          image: DecorationImage(
              image: NetworkImage("http://3.70.231.199/${teacher.imagePath}"),
              fit: BoxFit.cover),
          borderRadius: BorderRadius.circular(15)),
      child: Stack(children: [
        Positioned(
          bottom: 0,
          child: Container(
            width: 150.w,
            padding: EdgeInsets.symmetric(horizontal: 10.r),
            decoration: BoxDecoration(
                gradient: LinearGradient(
                    begin: Alignment.bottomCenter,
                    end: Alignment.topCenter,
                    colors: [Colors.orange, Colors.orange.withOpacity(0.24)]),
                color: Colors.orange,
                borderRadius: BorderRadius.circular(14)),
            height: 80.h,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 25.h,
                ),
                Text(
                  teacher.firstName,
                  style: TextStyle(
                      fontSize: 18.sp,
                      color: Colors.white,
                      fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 6.h),
                Text(
                  teacher.subject,
                  style: const TextStyle(
                      color: Colors.white, fontWeight: FontWeight.w600),
                )
              ],
            ),
          ),
        ),
      ]),
    );
  }
}
