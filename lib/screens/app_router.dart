import 'package:flutter/material.dart';
import 'package:registon/data/models/teachers_model/teachers_model.dart';
import 'package:registon/screens/all_teachers/all_teachers_screen.dart';
import 'package:registon/screens/login/login.dart';
import 'package:registon/screens/on_boarding/on_boarding.dart';
import 'package:registon/screens/search/search_teacher.dart';
import 'package:registon/screens/settings/settings_screen.dart';
import 'package:registon/screens/splash/splash.dart';
import 'package:registon/screens/tab_box/home/home_page.dart';
import 'package:registon/screens/tab_box/profile/student_profile/student_profile_screen.dart';
import 'package:registon/screens/tab_box/profile/student_profile_update/student_update_screen.dart';
import 'package:registon/screens/tab_box/student_tab_box.dart';
import 'package:registon/screens/teacher_appointment/teacher_appointment_page.dart';

import '../data/models/student_model/student_model.dart';
import 'help/help_support_page.dart';

abstract class RouteName {
  static const splash = '/splash';
  static const onBoarding = '/onBoarding';
  static const login = '/login';
  static const about = '/about';
  static const profileCreate = '/profileCreate';
  static const profile = '/profile';
  static const home = '/home';
  static const noInternet = '/noInternet';
  static const updateUser = '/updateUser';
  static const tabBoxStudent = '/tabBoxStudent';
  static const studentUpdate = '/studentUpdate';
  static const studentInfo = '/studentInfo';
  static const settingScreen = '/settingScreen';
  static const helpScreen = '/helpScreen';
  static const searchTeacher = '/searchTeacher';
  static const teacherAppointment = '/teacherAppointment';
  static const allTeachers = '/allTeachers';
}

class AppRoutes {
  static Route generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case RouteName.splash:
        return MaterialPageRoute(builder: (_) => const SplashPage());
      case RouteName.onBoarding:
        return MaterialPageRoute(builder: (_) => const OnBoardingPage());
      case RouteName.home:
        return MaterialPageRoute(builder: (_) => const HomePage());
      case RouteName.login:
        return MaterialPageRoute(builder: (_) => const LoginPage());
      case RouteName.profile:
        return MaterialPageRoute(builder: (_) => const StudentProfileScreen());
      case RouteName.tabBoxStudent:
        return MaterialPageRoute(builder: (_) => const StudentTabBox());
      case RouteName.teacherAppointment:
        return MaterialPageRoute(
            builder: (_) => const TeacherAppointmentPage());
      case RouteName.allTeachers:
        return MaterialPageRoute(
            builder: (_) => AllTeachersPage(
                  teachers: settings.arguments as List<TeachersModel>,
                ));
      case RouteName.studentUpdate:
        return MaterialPageRoute(
            builder: (_) => const StudentUpdateProfielScreen());
      case RouteName.searchTeacher:
        return MaterialPageRoute(builder: (_) => const SearchTeacher());
      case RouteName.settingScreen:
        return MaterialPageRoute(builder: (_) => const SettingScreen());
      case RouteName.helpScreen:
        return MaterialPageRoute(builder: (_) => const HelpScreen());

      default:
        return MaterialPageRoute(builder: (_) => const Scaffold());
    }
  }
}
