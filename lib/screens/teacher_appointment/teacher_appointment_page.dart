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
  final TextEditingController descriptionController = TextEditingController();
  int selectedGridView = 5;
  int workOfDay = 0;
  List time1 = [
    "9 00",
    "9 20",
    "9 40",
    "10 00",
    "10 20",
    "10 40",
    "11 00",
    "11 20",
    "11 40",
    "12 00",
    "12 20",
    "12 40",
    "13 00",
  ];
  List time2 = [
    "14 00",
    "14 20",
    "14 40",
    "15 00",
    "15 20",
    "15 40",
    "16 00",
    "16 20",
    "16 40",
    "17 00",
    "17 20",
    "17 40",
    "18 00",


  ];

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
        body: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Container(
            decoration: const BoxDecoration(color: Colors.white),
            child: Column(
              children: [
                SizedBox(
                  height: 20.sp,
                ),
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
                SizedBox(
                  height: 20.h,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20.r),
                  child: TextField(
                    controller: descriptionController,
                    maxLines: 5,
                    decoration: InputDecoration(
                        hintText:
                            "O'qituvchiga aytmoqchi bo'lgan gapingizni yozing",
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10.r))),
                  ),
                ),
                SizedBox(height: 20.h),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20.r),
                  child: Text(
                    "Kuni tanglang",
                    style:
                        TextStyle(fontSize: 16.sp, fontWeight: FontWeight.w200),
                  ),
                ),
                SizedBox(height: 20.h),
                Wrap(
                  direction: Axis.horizontal,
                  children: List.generate(
                    workOfDay == 0 ?time1.length :
                    time2.length,
                    (index) {
                      return GestureDetector(
                        onTap: () {
                          setState(() {
                            selectedGridView = index;
                          });
                        },
                        child: Padding(
                          padding:
                              const EdgeInsets.only(top: 5, left: 10, right: 10)
                                  .w,
                          child: Container(
                            width: 90.w,
                            height: 40.h,
                            margin: const EdgeInsets.only(bottom: 3,right: 2, left: 3).r,
                            decoration: BoxDecoration(
                                border: Border.all(
                                  width: 2,
                                  color: Colors.orange,
                                ),
                                borderRadius: BorderRadius.circular(25).w,
                                color: index == selectedGridView
                                    ? Colors.orange
                                    : Colors.white),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  workOfDay == 0 ?time1[index] :
                                  time2[index],
                                  style: TextStyle(
                                    color: index == selectedGridView
                                        ? Colors.white
                                        : Colors.orange,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ));
  }
}
