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

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  saveNavigate() async {
    await StorageRepository.saveNavigate("/home");
  }

  @override
  void initState() {
    saveNavigate();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Container(
        width: double.infinity,
        decoration: const BoxDecoration(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 68.h,
              width: double.infinity,
              padding: const EdgeInsets.symmetric(
                horizontal: 20,
              ).r,
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
            SizedBox(height: 20.h),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20).r,
              child: Text(
                "Xush Kelibsiz!",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 26.sp),
              ),
            ),
            Container(
              margin: EdgeInsets.all(20.r),
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
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20).r,
              child: Text(
                "Fanlar",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20.sp),
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
                      itemCount: 4,
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
                              SizedBox(height: 80.h),
                              Text(
                                state.taechers[index].major!,
                                style: TextStyle(
                                    fontSize: 18.sp,
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold),
                              ),
                              SizedBox(height: 6.h),
                              const Text(
                                "10ta o'qituvchi",
                                style: TextStyle(
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
                return SizedBox();
              },
            ),
            SizedBox(height: 20.h),
            Padding(
              padding: const EdgeInsets.only(left: 20).r,
              child: Text(
                "O'qituvchilar",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20.sp),
              ),
            ),
            SizedBox(height: 12.h),
            BlocBuilder<TeachersCubit, TeachersState>(
              builder: (context, state) {
                if (state is TeachersInSucces) {
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
                        return Container(
                          width: 150.w,
                          decoration: BoxDecoration(
                              border: Border.all(color: Colors.orange),
                              image: DecorationImage(
                                  image: NetworkImage(
                                      "http://3.70.231.199/${state.taechers[index].imagePath}"),
                                  fit: BoxFit.cover),
                              borderRadius: BorderRadius.circular(15)),
                          child: Stack(children: [
                            Positioned(
                              bottom: 0,
                              child: Container(
                                padding: EdgeInsets.symmetric(horizontal: 10.r),
                                decoration: BoxDecoration(
                                    gradient: LinearGradient(
                                        begin: Alignment.bottomCenter,
                                        end: Alignment.topCenter,
                                        colors: [
                                          Colors.orange,
                                          Colors.orange.withOpacity(0.24)
                                        ]),
                                    color: Colors.orange,
                                    borderRadius: BorderRadius.circular(14)),
                                height: 80.h,
                                width: 150.w,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    SizedBox(
                                      height: 25.h,
                                    ),
                                    Text(
                                      state.taechers[index].firstName,
                                      style: TextStyle(
                                          fontSize: 18.sp,
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    SizedBox(height: 6.h),
                                    Text(
                                      teacher.subject,
                                      style: const TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.w600),
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ]),
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
      )),
    );
  }
}
