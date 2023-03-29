import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:registon/bloc/login_cubit/login_cubit.dart';
import 'package:registon/bloc/student_profile/bloc/student_profile_event.dart';
import 'package:registon/cubit/tab/tab_cubit.dart';
import 'package:registon/data/api/login_api_service/login_api_service.dart';
import 'package:registon/bloc/subjects_cubit/subjects_cubit.dart';
import 'package:registon/bloc/teachers_cubit/teachers_cubit.dart';
import 'package:registon/data/api/teachers_api_service/teachers_api_service.dart';
import 'package:registon/data/get_it.dart';
import 'package:registon/data/repository/storage_repository.dart';
import 'package:registon/data/repository/teachers_repo/teachers_repository.dart';
import 'package:registon/screens/app_router.dart';
import 'package:registon/screens/splash/splash.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'bloc/student_profile/bloc/student_profile_bloc.dart';
import 'data/repository/login_repo/login_repository.dart';

void main() {
  setup();
  StorageRepository.getInstance();
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
      statusBarIconBrightness: Brightness.dark,
      statusBarColor: Colors.transparent,
    ),
  );
  runApp(MultiBlocProvider(providers: [
    BlocProvider(
      create: (context) => LoginCubit(),
    ),
    BlocProvider(create: (context) => TabBoxCubit()),
    BlocProvider(
      create: (context) => StudentProfileBloc()..add(GetStudentInfoEvent()),
    ),
    BlocProvider(
        create: (context) => TeachersCubit(
            repository:
                TeachersRepository(loginApiService: TeachersApiService()))),
    BlocProvider(
        create: (context) => SubjectsCubit(
            repository:
                TeachersRepository(loginApiService: TeachersApiService()))),
  ], child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      builder: (context, child) => MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.orange,
        ),
        onGenerateRoute: AppRoutes.generateRoute,
        initialRoute: RouteName.splash,
      ),
    );
  }
}
