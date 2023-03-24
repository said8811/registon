import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:registon/cubit/tab/tab_cubit.dart';
import 'package:registon/screens/tab_box/home/home_page.dart';
import 'package:registon/screens/tab_box/profile/student_profile/student_profile_screen.dart';

class StudentTabBox extends StatelessWidget {
  const StudentTabBox({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List pages = [
      HomePage(),
      StudentProfileScreen(),
    ];
    return Scaffold(
      body: BlocBuilder<TabBoxCubit, int>(
        builder: (context, state) => pages[state],
      ),
      bottomNavigationBar: BottomNavigationBar(
        onTap: (value) {
          context.read<TabBoxCubit>().changePageIndex(value);
        },
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: ""),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: ""),
        ],
      ),
    );
  }
}
