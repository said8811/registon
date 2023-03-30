import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:registon/bloc/student_profile/bloc/student_profile_bloc.dart';
import 'package:registon/bloc/student_profile/bloc/student_profile_event.dart';
import 'package:registon/bloc/student_profile/bloc/student_profile_state.dart';
import 'package:registon/data/models/student_model/student_model.dart';
import 'package:registon/screens/app_router.dart';
import 'package:registon/screens/tab_box/profile/student_profile/widget/menu_item.dart';

import '../../../../data/models/form_status/form_status.dart';

class StudentProfileScreen extends StatefulWidget {
  const StudentProfileScreen({super.key});

  @override
  State<StudentProfileScreen> createState() => _StudentProfileScreenState();
}

class _StudentProfileScreenState extends State<StudentProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<StudentProfileBloc, StudentProfileState>(
      listener: (context, state) {
        if (state.status == FormStatus.updateStudentInfoInSuccess) {
          context.read<StudentProfileBloc>().add(GetStudentInfoEvent());
        }
      },
      builder: (context, state) {
        if (state.status == FormStatus.gettingStudentInfoInSuccess) {
          StudentModel studentModel = state.student;
          return Scaffold(
            appBar: AppBar(
              backgroundColor: Colors.white,
              elevation: 0,
              title: Text(
                'Profile',
                style: GoogleFonts.raleway(fontWeight: FontWeight.bold),
              ),
            ),
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
                      Navigator.pushNamed(
                        context,
                        RouteName.studentInfo,
                        arguments: studentModel,
                      );
                    },
                    color: Colors.green,
                  ),
                  ProfileItem(
                    icon: Icons.settings,
                    text: "Settings",
                    onTap: () {
                      Navigator.pushNamed(
                        context,
                        RouteName.settingScreen,
                      );
                    },
                    color: Colors.pinkAccent,
                  ),
                  ProfileItem(
                    icon: Icons.help,
                    text: "Help & Support",
                    onTap: () {
                      Navigator.pushNamed(
                        context,
                        RouteName.helpScreen,
                      );
                    },
                    color: Colors.blue,
                  ),
                ],
              ),
            ),
          );
        }
        if (state.status == FormStatus.gettingStudentInfoInProgress) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
        if (state.status == FormStatus.gettingStudentInfoInFailury) {
          return Center(child: Text(state.errorMessage));
        }
        return Center(
          child: Text(state.errorMessage.toString()),
        );
      },
    );
  }
}
