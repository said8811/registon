import 'package:flutter/material.dart';
import 'package:registon/screens/login/login.dart';
import 'package:registon/screens/on_boarding/on_boarding.dart';
import 'package:registon/screens/splash/splash.dart';
import 'package:registon/screens/tab_box/home/home_page.dart';

abstract class RouteName {
  static const splash = '/splash';
  static const onBoarding = '/onBoarding';
  static const login = '/login';
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
      case RouteName.onBoarding:
        return MaterialPageRoute(builder: (_) => const OnBoardingPage());
      case RouteName.home:
        return MaterialPageRoute(builder: (_) => const HomePage());
      case RouteName.login:
        return MaterialPageRoute(builder: (_) => const LoginPage());
      default:
        return MaterialPageRoute(builder: (_) => const Scaffold());
    }
  }
}
