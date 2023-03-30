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
import 'package:registon/screens/tab_box/profile/student_profile/widget/profile_info_item.dart';

import '../../../../data/models/form_status/form_status.dart';
import '../../../../widgets/global_button.dart';

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
            body: SafeArea(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      padding: const EdgeInsets.all(18),
                      decoration: BoxDecoration(
                          color: const Color(0xff33354E),
                          borderRadius: BorderRadius.circular(20)),
                      child: Row(
                        children: [
                          const CircleAvatar(
                            radius: 50,
                            backgroundImage: NetworkImage(
                                "https://www.citypng.com/public/uploads/small/11639594360nclmllzpmer2dvmrgsojcin90qmnuloytwrcohikyurvuyfzvhxeeaveigoiajks5w2nytyfpix678beyh4ykhgvmhkv3r3yj5hi.png"),
                          ),
                          const SizedBox(width: 14),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  Text(
                                    studentModel.firstName,
                                    style: const TextStyle(
                                        fontSize: 22, color: Colors.white),
                                  ),
                                  const SizedBox(width: 6),
                                  Text(
                                    studentModel.lastName,
                                    style: const TextStyle(
                                        color: Colors.white, fontSize: 22),
                                  ),
                                ],
                              ),
                              const SizedBox(height: 6),
                              const Text(
                                // studentModel.subject,
                                '.Net learner',
                                style: TextStyle(color: Colors.white),
                              ),
                              const SizedBox(height: 6),
                              ElevatedButton(
                                style: ButtonStyle(
                                  shape: MaterialStateProperty.all<
                                      RoundedRectangleBorder>(
                                    RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(18.0),
                                    ),
                                  ),
                                ),
                                onPressed: () {},
                                child: const Text(
                                  '+ Become Member',
                                  style: TextStyle(
                                    color: Colors.white,
                                  ),
                                ),
                              )
                            ],
                          )
                        ],
                      ),
                    ),
                    const Padding(
                      padding: EdgeInsets.only(left: 2, top: 20, bottom: 20),
                      child: Text(
                        "Student Information",
                        style: TextStyle(
                            fontSize: 22, fontWeight: FontWeight.w700),
                      ),
                    ),
                    ProfileInfoItem(
                      info: studentModel.firstName,
                      type: "Name",
                      svg: 'assets/svg/name.svg',
                    ),
                    SizedBox(height: 6),
                    ProfileInfoItem(
                      info: studentModel.lastName,
                      type: "Surname",
                      svg: 'assets/svg/name.svg',
                    ),
                    SizedBox(height: 6),
                    ProfileInfoItem(
                      info: studentModel.phoneNumber,
                      type: "Phone number",
                      svg: 'assets/svg/phone.svg',
                    ),
                    SizedBox(height: 6),
                    ProfileInfoItem(
                      info: studentModel.subject,
                      type: "Subject",
                      svg: 'assets/svg/email.svg',
                    ),
                    SizedBox(height: 6),
                    ProfileInfoItem(
                      info: studentModel.subjects.toString(),
                      type: "Subjects",
                      svg: 'assets/svg/email.svg',
                    ),
                    SizedBox(height: 6),
                    ProfileInfoItem(
                      info: studentModel.birthDate,
                      type: "Birth date",
                      svg: 'assets/svg/birth.svg',
                    ),
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
