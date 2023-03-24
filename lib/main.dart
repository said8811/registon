import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:registon/bloc/login_cubit/login_cubit.dart';
import 'package:registon/bloc/student_profile/bloc/student_profile_bloc.dart';
import 'package:registon/cubit/tab/tab_cubit.dart';
import 'package:registon/data/repository/storage_repository.dart';
import 'package:registon/screens/app_router.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'data/get_it.dart';

void main() async {
  setup();
  WidgetsFlutterBinding.ensureInitialized();
  StorageRepository.getInstance();
  await StorageRepository.getInstance();
  runApp(MultiBlocProvider(providers: [
    BlocProvider(
      create: (context) => LoginCubit(),
    ),
    BlocProvider(create: (context) => TabBoxCubit()),
    BlocProvider(
      create: (context) => StudentProfileBloc(),
    )
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
            ));
  }
}
