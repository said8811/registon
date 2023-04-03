import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:registon/screens/teacher_appointment/widgets/calendar_container.dart';

class TeacherAppointmentPage extends StatefulWidget {
  const TeacherAppointmentPage({super.key});

  @override
  State<TeacherAppointmentPage> createState() => _TeacherAppointmentPageState();
}

class _TeacherAppointmentPageState extends State<TeacherAppointmentPage> {
  int selectedDay = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Colors.white,
        title: Text(
          "O'qituvchi bandlash",
          style: TextStyle(fontSize: 20.sp, fontWeight: FontWeight.bold),
        ),
      ),
      body: Container(
        decoration: const BoxDecoration(color: Colors.white),
        child: Column(
          children: [
            SizedBox(
              height: 20.sp,
            ),
            SizedBox(
              height: 88.h,
              child: ListView.builder(
                itemCount: 7,
                padding: const EdgeInsets.only(left: 24, right: 12).r,
                scrollDirection: Axis.horizontal,
                physics: const BouncingScrollPhysics(),
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () {
                      setState(() {
                        selectedDay = index;
                      });
                    },
                    child: CalendarContainer(
                      select: selectedDay == index ? true : false,
                      week: DateFormat.E().format(
                          DateTime.fromMillisecondsSinceEpoch(
                              DateTime.now().millisecondsSinceEpoch +
                                  (index) * 86400000)),
                      date: DateTime.fromMillisecondsSinceEpoch(
                              DateTime.now().millisecondsSinceEpoch +
                                  (index) * 86400000)
                          .day,
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
