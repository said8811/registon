import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:registon/data/models/rating_model/rating_model.dart';

class TeacherRatingWidget extends StatelessWidget {
  const TeacherRatingWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300.h,
      margin: EdgeInsets.symmetric(horizontal: 20.r, vertical: 20.r),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20.r),
        border: Border.all(color: Colors.grey.withOpacity(0.5)),
      ),
      child: Column(
        children: [
          Container(
            height: 60.h,
            padding: EdgeInsets.symmetric(horizontal: 12.r),
            decoration: BoxDecoration(
                color: Colors.orange.withOpacity(0.2),
                borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(20),
                    topRight: Radius.circular(20))),
            child: Row(
              children: [
                Stack(
                  children: [
                    Container(
                      height: 40.h,
                      width: 40.w,
                      child: const CircularProgressIndicator(
                        color: Colors.orange,
                        value: 0.64,
                      ),
                    ),
                    Positioned(
                        left: 8,
                        top: 10,
                        child: Text(
                          "64%",
                          style: TextStyle(
                              fontSize: 16.sp, fontWeight: FontWeight.bold),
                        )),
                  ],
                ),
                SizedBox(width: 18.w),
                const Text("O'quvchilar qoniqarli baxo bergan")
              ],
            ),
          ),
          Container(
            decoration: BoxDecoration(),
            height: 226.h,
            child: ListView.builder(
              physics: const NeverScrollableScrollPhysics(),
              itemCount: 4,
              itemBuilder: (context, index) {
                return ListTile(
                  leading: SvgPicture.asset(
                    RatingModel.ratings[index].iconPath,
                    width: 26.w,
                  ),
                  title: Text(RatingModel.ratings[index].txt),
                  trailing: Text(
                    RatingModel.ratings[index].count,
                    style:
                        TextStyle(fontSize: 16.sp, fontWeight: FontWeight.bold),
                  ),
                );
              },
            ),
          )
        ],
      ),
    );
  }
}
