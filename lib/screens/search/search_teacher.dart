import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SearchTeacher extends StatefulWidget {
  const SearchTeacher({super.key});

  @override
  State<SearchTeacher> createState() => _SearchTeacherState();
}

class _SearchTeacherState extends State<SearchTeacher> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.3,
        backgroundColor: Colors.white,
        title: Text(
          "Qidiruv",
          style: TextStyle(fontSize: 24.sp, fontWeight: FontWeight.bold),
        ),
      ),
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 20.r),
        child: Column(
          children: [
            SizedBox(height: 40.h),
            TextField(
              decoration: InputDecoration(
                  suffixIcon: const Icon(Icons.search),
                  hintText: "Qidiruv",
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30.r))),
            )
          ],
        ),
      ),
    );
  }
}
