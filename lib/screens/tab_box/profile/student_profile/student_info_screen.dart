import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:registon/data/models/student_model/student_model.dart';
import 'package:registon/screens/app_router.dart';
import 'package:registon/screens/tab_box/profile/student_profile/widget/appbar.dart';
import 'package:registon/screens/tab_box/profile/student_profile/widget/profile_info_item.dart';

import '../../../../widgets/global_button.dart';

class StudentInfoScreen extends StatelessWidget {
  StudentInfoScreen({super.key, required this.studentModel});
  StudentModel studentModel;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF002766),
      appBar: const ProfileAppBar(
        title: Text("My Profile"),
      ),
      body: Container(
        height: double.infinity,
        width: double.infinity,
        padding: EdgeInsets.symmetric(horizontal: 28.w, vertical: 40.h),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(45.r),
              topRight: Radius.circular(45.r).r),
          color: Colors.white,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Expanded(
                  child: ListTile(
                    title: Text(
                      studentModel.firstName,
                      style: const TextStyle(fontSize: 22),
                    ),
                    subtitle: Text(
                      studentModel.lastName,
                      style: const TextStyle(color: Colors.grey),
                    ),
                  ),
                )
              ],
            ),
            const Padding(
              padding: EdgeInsets.only(left: 2, top: 20, bottom: 20),
              child: Text(
                "Student Information",
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.w400),
              ),
            ),
            ProfileInfoItem(info: studentModel.firstName, type: "Name"),
            ProfileInfoItem(info: studentModel.lastName, type: "Surname"),
            ProfileInfoItem(info: studentModel.subject, type: "Subject"),
            ProfileInfoItem(
                info: studentModel.subjects.toString(), type: "Subjects"),
            ProfileInfoItem(info: studentModel.id.toString(), type: "ID"),
            const Spacer(),
            GlobalButton(
              isActive: true,
              buttonText: "Edit Profile",
              onTap: () {
                Navigator.pushNamed(context, RouteName.studentUpdate,
                    arguments: studentModel);
              },
            )
          ],
        ),
      ),
    );
  }
}
