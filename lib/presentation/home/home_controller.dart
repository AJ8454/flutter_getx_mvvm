// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter_getx_mvvm/domain/repository/api_repository.dart';
import 'package:get/get.dart';

import 'package:flutter_getx_mvvm/domain/model/user.dart';
import 'package:flutter_getx_mvvm/domain/repository/local_storage_repository.dart';

class HomeController extends GetxController {
  final LocalRepositoryInterface localRepositoryInterface;
  final ApiRepositoryInterface apiRepositoryInterface;

  Rx<User>? user = User.empty().obs;
  RxInt onIndexSelected = 0.obs;
  RxBool darkTheme = false.obs;

  HomeController({
    required this.localRepositoryInterface,
    required this.apiRepositoryInterface,
  });

  @override
  void onReady() {
    loadUser();
    loadCurrentTheme();
    super.onReady();
  }

  void loadCurrentTheme() async {
    await localRepositoryInterface.isDarkMode().then((value) {
      darkTheme(value);
    });
  }

  Future<bool> updateTheme(bool isDark) async {
    await localRepositoryInterface.saveDarkMode(isDark);
    darkTheme(isDark);
    return isDark;
  }

  void updateIndexSelected(int index) {
    onIndexSelected(index);
  }

  void loadUser() async {
    await localRepositoryInterface.getUser().then((value) {
      user!(value);
    });
  }

  Future<void> logOut() async {
    final token = await localRepositoryInterface.getToken();
    await apiRepositoryInterface.logout(token);
    await localRepositoryInterface.clearAllData();
  }
}
