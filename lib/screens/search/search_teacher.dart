import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:registon/bloc/subjects_cubit/subjects_cubit.dart';
import 'package:registon/bloc/subjects_cubit/subjects_state.dart';

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
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 30.h),
            Container(
              height: 50.h,
              child: TextField(
                decoration: InputDecoration(
                    suffixIcon: const Icon(Icons.search),
                    hintText: "Qidiruv",
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30.r))),
              ),
            ),
            SizedBox(height: 8.h),
            BlocBuilder<SubjectsCubit, SubjectsState>(
              builder: (context, state) {
                if (state is SubjectsInSucces) {
                  return SizedBox(
                    height: 34.h,
                    child: ListView.separated(
                      separatorBuilder: (context, index) => SizedBox(
                        width: 8.w,
                      ),
                      shrinkWrap: true,
                      scrollDirection: Axis.horizontal,
                      itemCount: state.taechers.length,
                      itemBuilder: (context, index) {
                        return Container(
                          padding: EdgeInsets.all(8.r),
                          decoration: BoxDecoration(
                              border: Border.all(color: Colors.orange),
                              borderRadius: BorderRadius.circular(8.r)),
                          child: Text(state.taechers[index].major ?? ""),
                        );
                      },
                    ),
                  );
                }
                return const SizedBox();
              },
            )
          ],
        ),
      ),
    );
  }
}
