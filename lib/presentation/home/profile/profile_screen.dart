import 'package:flutter/material.dart';
import 'package:flutter_getx_mvvm/presentation/home/home_controller.dart';
import 'package:flutter_getx_mvvm/presentation/routes/app_navigation.dart';
import 'package:get/get.dart';

class ProfileScreen extends StatelessWidget {
  ProfileScreen({super.key});

  final controller = Get.find<HomeController>();

  Future<void> logout() async {
    await controller.logOut();
    Get.offAllNamed(AppRoutes.splash);
  }

  void onThemeUpdated(bool isDark) {
    controller.updateTheme(isDark);
    Get.changeThemeMode(isDark ? ThemeMode.dark : ThemeMode.light);
  }

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      final user = controller.user?.value;
      return Scaffold(
        appBar: AppBar(
          title: const Text("Profile"),
        ),
        body: user?.image != null
            ? Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CircleAvatar(
                      radius: 50,
                      backgroundImage: NetworkImage(user!.image!),
                    ),
                    const SizedBox(height: 30),
                    Text(user.name!),
                    const SizedBox(height: 30),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        const Text("Dark Mode"),
                        Obx(
                          () => Switch(
                            value: controller.darkTheme.value,
                            onChanged: onThemeUpdated,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 30),
                    ElevatedButton(
                      onPressed: () => logout(),
                      child: const Text("Log Out"),
                    ),
                  ],
                ),
              )
            : const SizedBox.shrink(),
      );
    });
  }
}
