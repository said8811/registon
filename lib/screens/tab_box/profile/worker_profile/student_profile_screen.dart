import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:registon/screens/app_router.dart';
import 'package:registon/screens/tab_box/profile/worker_profile/widget/appbar.dart';
import 'package:registon/screens/tab_box/profile/worker_profile/widget/menu_item.dart';

class StudentProfileScreen extends StatefulWidget {
  const StudentProfileScreen({Key? key}) : super(key: key);

  @override
  State<StudentProfileScreen> createState() => _StudentProfileScreenState();
}

class _StudentProfileScreenState extends State<StudentProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF002766),
      appBar: ProfileAppBar(
          title: SizedBox(
        child: Row(
          children: const [
            Padding(
              padding: EdgeInsets.only(right: 20, left: 40),
              child: CircleAvatar(
                radius: 20,
                backgroundImage: NetworkImage('https://picsum.photos/200'),
              ),
            ),
            Expanded(
              child: ListTile(
                title: Text(
                  "Name",
                  style: TextStyle(color: Colors.white),
                ),
                subtitle: Text("birnima@gmail.com",
                    style: TextStyle(color: Colors.white)),
              ),
            )
          ],
        ),
      )),
      body: Container(
        height: double.infinity,
        width: double.infinity,
        padding: EdgeInsets.only(left: 20.w, top: 50.h, right: 20.w).w,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(45.r),
              topRight: Radius.circular(45.r).r),
          color: Colors.white,
        ),
        child: Column(
          children: [
            ProfileItem(
              icon: Icons.person,
              text: "My Profile",
              onTap: () {
                Navigator.pushNamed(context, RouteName.profile);
              },
              color: Colors.green,
            ),
            ProfileItem(
              icon: Icons.settings,
              text: "Settings",
              onTap: () {},
              color: Colors.pinkAccent,
            ),
            ProfileItem(
              icon: Icons.help,
              text: "Help & Support",
              onTap: () {},
              color: Colors.blue,
            ),
          ],
        ),
      ),
    );
  }
}
