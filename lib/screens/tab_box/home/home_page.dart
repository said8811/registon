import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:registon/bloc/subjects_cubit/subjects_cubit.dart';
import 'package:registon/bloc/subjects_cubit/subjects_state.dart';
import 'package:registon/bloc/teachers_cubit/teachers_cubit.dart';
import 'package:registon/bloc/teachers_cubit/teachers_state.dart';
import 'package:registon/data/models/teachers_model/teachers_model.dart';
import 'package:registon/data/repository/storage_repository.dart';
import 'package:registon/screens/app_router.dart';
import 'package:registon/screens/tab_box/home/widgets/teachers_widget.dart';
import 'package:registon/screens/teacher_details/teacher_detail_page.dart';
import 'package:zoom_tap_animation/zoom_tap_animation.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  saveNavigate() async {
    await StorageRepository.saveNavigate("/tabBoxStudent");
  }

  @override
  void initState() {
    saveNavigate();
    super.initState();
  }

  List<TeachersModel> Allteachers = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: SingleChildScrollView(
        child: Container(
          width: double.infinity,
          decoration: const BoxDecoration(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: 68.h,
                width: double.infinity,
                padding: EdgeInsets.symmetric(
                  horizontal: 20.r,
                ),
                decoration: const BoxDecoration(
                    color: Colors.white,
                    border: Border.symmetric(
                      horizontal: BorderSide(width: 1, color: Colors.orange),
                    )),
                child: Row(
                  children: [
                    SvgPicture.asset(
                      "assets/svg/logo.svg",
                      width: 120.w,
                    ),
                    const Spacer(),
                    SvgPicture.asset("assets/svg/notification_icon.svg")
                  ],
                ),
              ),
              SizedBox(height: 16.h),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20).r,
                child: Text(
                  "Xush Kelibsiz!",
                  style:
                      TextStyle(fontWeight: FontWeight.bold, fontSize: 26.sp),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(18.0).r,
                child: InkWell(
                  borderRadius: BorderRadius.circular(25).r,
                  onTap: () =>
                      Navigator.pushNamed(context, RouteName.searchTeacher),
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 20.r),
                    height: 48.h,
                    decoration: BoxDecoration(
                        color: Colors.grey[200],
                        border: Border.all(color: Colors.grey),
                        borderRadius: BorderRadius.circular(25)),
                    child: Row(
                      children: [
                        const Icon(
                          Icons.search,
                          color: Colors.grey,
                        ),
                        SizedBox(width: 8.w),
                        const Text(
                          "O'qituvchi qidiring",
                          style: TextStyle(color: Colors.grey),
                        )
                      ],
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20).r,
                child: Row(
                  children: [
                    Text(
                      "Fanlar",
                      style: TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 20.sp),
                    ),
                    const Spacer(),
                    TextButton(onPressed: () {}, child: const Text("Davomi"))
                  ],
                ),
              ),
              SizedBox(height: 12.h),
              BlocBuilder<SubjectsCubit, SubjectsState>(
                builder: (context, state) {
                  if (state is SubjectsInSucces) {
                    return Container(
                      decoration: const BoxDecoration(),
                      height: 150.h,
                      child: ListView.separated(
                        padding: const EdgeInsets.only(left: 20).r,
                        separatorBuilder: (context, index) => SizedBox(
                          width: 10.w,
                        ),
                        itemCount: state.taechers.length - 1,
                        scrollDirection: Axis.horizontal,
                        shrinkWrap: true,
                        itemBuilder: (context, index) {
                          return Container(
                            width: 150.w,
                            padding: EdgeInsets.symmetric(horizontal: 14.r),
                            decoration: BoxDecoration(
                                color: Colors.orange,
                                borderRadius: BorderRadius.circular(15)),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SvgPicture.asset(
                                  "assets/svg/courses_back.svg",
                                  color: Colors.amber.withOpacity(0.54),
                                  width: 100.w,
                                ),
                                SizedBox(height: 0.h),
                                Text(
                                  state.taechers[index].major!,
                                  style: TextStyle(
                                      fontSize: 18.sp,
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold),
                                ),
                                SizedBox(height: 6.h),
                                Text(
                                  "${state.taechers[index].count}ta o'qituvchi",
                                  style: const TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.w600),
                                )
                              ],
                            ),
                          );
                        },
                      ),
                    );
                  }
                  return const SizedBox();
                },
              ),
              SizedBox(height: 20.h),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20).r,
                child: Row(
                  children: [
                    Text(
                      "O'qituvchilar",
                      style: TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 20.sp),
                    ),
                    const Spacer(),
                    TextButton(
                        onPressed: () {
                          Navigator.pushNamed(context, RouteName.allTeachers,
                              arguments: Allteachers);
                        },
                        child: const Text("Davomi"))
                  ],
                ),
              ),
              SizedBox(height: 12.h),
              BlocBuilder<TeachersCubit, TeachersState>(
                builder: (context, state) {
                  if (state is TeachersInSucces) {
                    Allteachers = state.taechers;
                    return Container(
                      decoration: const BoxDecoration(),
                      height: 200.h,
                      child: ListView.separated(
                        padding: const EdgeInsets.only(left: 20).r,
                        separatorBuilder: (context, index) => SizedBox(
                          width: 10.w,
                        ),
                        itemCount: state.taechers.length,
                        scrollDirection: Axis.horizontal,
                        shrinkWrap: true,
                        itemBuilder: (context, index) {
                          TeachersModel teacher = state.taechers[index];
                          return InkWell(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => TeacherDetails(
                                      teacher: teacher,
                                    ),
                                  ));
                            },
                            child: MyTeacherWidget(
                              teacher: teacher,
                            ),
                          );
                        },
                      ),
                    );
                  }
                  return const SizedBox();
                },
              ),
            ],
          ),
        ),
      )),
    );
  }
}
