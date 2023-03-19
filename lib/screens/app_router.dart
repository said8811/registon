import 'package:flutter/material.dart';
import 'package:registon/screens/splash/splash.dart';

abstract class RouteName {
  static const splash = '/splash';
  static const onBoarding = '/onBoarding';
  static const enterPhoneNumber = '/enterPhoneNumer';
  static const about = '/about';
  static const profileCreate = '/profileCreate';
  static const home = '/home';
  static const noInternet = '/noInternet';
  static const updateUser = '/updateUser';
}

class AppRoutes {
  static Route generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case RouteName.splash:
        return MaterialPageRoute(builder: (_) => const SplashPage());
      default:
        return MaterialPageRoute(builder: (_) => const Scaffold());
    }
  }
}
