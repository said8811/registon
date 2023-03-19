import 'package:flutter/material.dart';
import 'package:registon/data/repository/storage_repository.dart';
import 'package:registon/screens/app_router.dart';
import 'package:registon/screens/splash/splash.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

void main() {
  StorageRepository.getInstance();
  runApp(const MyApp());
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
                primarySwatch: Colors.blue,
              ),
              onGenerateRoute: AppRoutes.generateRoute,
              initialRoute: RouteName.splash,
            ));
  }
}
