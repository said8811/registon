import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:registon/data/models/teachers_model/teachers_model.dart';
import 'package:registon/screens/tab_box/home/widgets/teachers_widget.dart';

class AllTeachersPage extends StatelessWidget {
  List<TeachersModel> teachers;
  AllTeachersPage({super.key, required this.teachers});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.3,
        backgroundColor: Colors.white,
        title: Text(
          "O'qituvchilar",
          style: TextStyle(fontSize: 24.sp, fontWeight: FontWeight.bold),
        ),
      ),
      body: Container(
        padding: const EdgeInsets.all(20),
        child: GridView.builder(
          physics: const BouncingScrollPhysics(),
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisSpacing: 32,
              mainAxisSpacing: 20,
              crossAxisCount: 2,
              mainAxisExtent: 190),
          itemCount: teachers.length,
          itemBuilder: (context, index) {
            return MyTeacherWidget(teacher: teachers[index]);
          },
        ),
      ),
    );
  }
}
