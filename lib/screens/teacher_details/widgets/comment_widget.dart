import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CommentWidget extends StatelessWidget {
  const CommentWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 151.h,
      width: 213.h,
      padding: const EdgeInsets.all(8).r,
      decoration: BoxDecoration(
          color: Colors.orange.withOpacity(0.67),
          borderRadius: BorderRadius.circular(15.r)),
      child: Column(
        children: [
          Row(
            children: [
              Container(
                width: 60.w,
                height: 60.h,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    image: const DecorationImage(
                        image: AssetImage("assets/images/icon.png"))),
              ),
              SizedBox(
                width: 10.w,
              ),
              Text(
                "Bobur",
                style: TextStyle(
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w700,
                    color: Colors.white),
              ),
            ],
          ),
          SizedBox(
            height: 8.h,
          ),
          Text(
            "This is so amazing! I really enjoyed this film, I hope the next chapters will be released…",
            style: TextStyle(
                fontSize: 12.sp,
                fontWeight: FontWeight.w300,
                color: Colors.white),
          )
        ],
      ),
    );
  }
}
