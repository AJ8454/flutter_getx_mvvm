import 'package:flutter_getx_mvvm/presentation/home/home_binding.dart';
import 'package:flutter_getx_mvvm/presentation/home/home_screen.dart';
import 'package:flutter_getx_mvvm/presentation/login/login_binding.dart';
import 'package:flutter_getx_mvvm/presentation/login/login_screen.dart';
import 'package:flutter_getx_mvvm/presentation/main_binding.dart';
import 'package:flutter_getx_mvvm/presentation/splash/splash_binding.dart';
import 'package:flutter_getx_mvvm/presentation/splash/splash_screen.dart';
import 'package:get/route_manager.dart';

class AppRoutes {
  static const String splash = "/splash";
  static const String login = "/login";
  static const String home = "/home";
}

class AppPages {
  static final pages = [
    GetPage(
      name: AppRoutes.splash,
      page: () => SplashScreen(),
      bindings: [MainBinding(), SplashBinding()],
    ),
    GetPage(
      name: AppRoutes.login,
      page: () => const LoginScreen(),
      bindings: [MainBinding(), LoginBinding()],
    ),
    GetPage(
      name: AppRoutes.home,
      page: () => const HomeScreen(),
      binding: HomeBinding(),
    ),
  ];
}
