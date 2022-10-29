import 'package:flutter/material.dart';
import 'package:flutter_getx_mvvm/presentation/routes/app_navigation.dart';
import 'package:get/get.dart';

import 'package:flutter_getx_mvvm/domain/repository/api_repository.dart';
import 'package:flutter_getx_mvvm/domain/repository/local_storage_repository.dart';

class SplachController extends GetxController {
  final LocalRepositoryInterface localRepositoryInterface;
  final ApiRepositoryInterface apiRepositoryInterface;
  SplachController({
    required this.localRepositoryInterface,
    required this.apiRepositoryInterface,
  });

  @override
  void onReady() {
    validateSession();
    validateTheme();
    super.onReady();
  }

  void validateTheme() async {
    final isDark = await localRepositoryInterface.isDarkMode();
    if (isDark != null) {
      Get.changeThemeMode(isDark ? ThemeMode.dark : ThemeMode.light);
    } else {
      Get.changeThemeMode(Get.isDarkMode ? ThemeMode.dark : ThemeMode.light);
    }
  }

  void validateSession() async {
    final token = await localRepositoryInterface.getToken();
    if (token != null) {
      final user = await apiRepositoryInterface.getUserFromToken(token);
      await localRepositoryInterface.saveUser(user);
      Get.offNamed(AppRoutes.home);
    } else {
      Get.offNamed(AppRoutes.login);
    }
  }
}
