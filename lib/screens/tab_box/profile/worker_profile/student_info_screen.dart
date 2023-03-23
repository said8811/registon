import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:registon/screens/app_router.dart';
import 'package:registon/screens/tab_box/profile/worker_profile/widget/appbar.dart';
import 'package:registon/screens/tab_box/profile/worker_profile/widget/profile_info_item.dart';

import '../../../../widgets/global_button.dart';

class StudentInfoScreen extends StatelessWidget {
  const StudentInfoScreen({super.key});

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
              children: const [
                Padding(
                  padding: EdgeInsets.only(right: 20),
                  child: CircleAvatar(
                    radius: 40,
                    backgroundImage: NetworkImage('https://picsum.photos/200'),
                  ),
                ),
                Expanded(
                  child: ListTile(
                    title: Text(
                      "Name",
                      style: TextStyle(fontSize: 22),
                    ),
                    subtitle: Text(
                      "birnima@gmail.com",
                      style: TextStyle(color: Colors.white54),
                    ),
                  ),
                )
              ],
            ),
            const Padding(
              padding: EdgeInsets.only(left: 2, top: 20, bottom: 20),
              child: Text(
                "Worker Information",
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.w400),
              ),
            ),
            ProfileInfoItem(info: "Birnimabek", type: "Name"),
            ProfileInfoItem(info: "Palonchiyev", type: "Surname"),
            ProfileInfoItem(info: "birnima@gmail.com", type: "Email"),
            ProfileInfoItem(info: "*********", type: "Password"),
            ProfileInfoItem(info: "+998900265088", type: "Phone"),
            const Spacer(),
            GlobalButton(
              isActive: true,
              buttonText: "Edit Profile",
              onTap: () {
                Navigator.pushNamed(context, RouteName.studentUpdate);
              },
            )
          ],
        ),
      ),
    );
  }
}

    // required this.name,
    // required this.surname,
    // required this.email,
    // required this.password,
    // required this.phone,
    // required this.image,