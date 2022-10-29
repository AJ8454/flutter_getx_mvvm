import 'package:flutter/material.dart';
import 'package:flutter_getx_mvvm/presentation/main_binding.dart';
import 'package:flutter_getx_mvvm/presentation/routes/app_navigation.dart';
import 'package:flutter_getx_mvvm/presentation/theme.dart';
import 'package:get/get.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: Themes.light,
      darkTheme: Themes.dark,
      initialRoute: AppRoutes.splash,
      getPages: AppPages.pages,
      initialBinding: MainBinding(),
    );
  }
}
