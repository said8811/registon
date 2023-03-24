import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter/material.dart';

class CalendarContainer extends StatelessWidget {
  const CalendarContainer({
    super.key,
    required this.week,
    required this.date,
    required this.select,
  });
  final bool select;
  final String week;
  final int date;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100.h,
      width: 60.w,
      margin: const EdgeInsets.only(right: 12),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        border: Border.all(width: 1.w, color: Colors.orange),
        color: select == true ? Colors.orange : Colors.white,
      ),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              week,
              style: TextStyle(
                fontSize: 14,
                color: select == true ? Colors.white : Colors.orange,
                fontWeight: FontWeight.w400,
              ),
            ),
            Text(
              "$date",
              style: TextStyle(
                fontSize: 23,
                color: select == true ? Colors.white : Colors.orange,
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
