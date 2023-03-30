import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:registon/cubit/tab/tab_cubit.dart';
import 'package:registon/screens/tab_box/home/home_page.dart';
import 'package:registon/screens/tab_box/profile/student_profile/student_profile_screen.dart';

class StudentTabBox extends StatefulWidget {
  const StudentTabBox({Key? key}) : super(key: key);

  @override
  State<StudentTabBox> createState() => _StudentTabBoxState();
}

class _StudentTabBoxState extends State<StudentTabBox> {
  @override
  Widget build(BuildContext context) {
    int index = 0;
    List pages = [
      const HomePage(),
      const StudentProfileScreen(),
    ];
    return Scaffold(
      body: BlocBuilder<TabBoxCubit, int>(
        builder: (context, state) => pages[state],
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: index,
        onTap: (value) {
          index = value;
          context.read<TabBoxCubit>().changePageIndex(index);
          setState(() {});
        },
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: ""),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: ""),
        ],
      ),
    );
  }
}
