import 'package:flutter/material.dart';
import 'package:flutter_getx_mvvm/presentation/login/login_controller.dart';
import 'package:flutter_getx_mvvm/presentation/routes/app_navigation.dart';
import 'package:get/get.dart';

class LoginScreen extends GetWidget<LoginController> {
  const LoginScreen({super.key});

  void login() async {
    final result = await controller.login();
    if (result) {
      Get.offAllNamed(AppRoutes.home);
    } else {
      Get.snackbar("Error", "Login Incorrect");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Text(
              //   "Username",
              //   textAlign: TextAlign.start,
              //   style: Theme.of(context).textTheme.caption!,
              // ),
              TextField(
                controller: controller.usernameTextContoller,
                decoration: InputDecoration(
                  hintText: "username",
                  prefix: Icon(
                    Icons.person_outline,
                    color: Theme.of(context).iconTheme.color,
                  ),
                ),
              ),
              const SizedBox(height: 20),
              // Text(
              //   "Password",
              //   textAlign: TextAlign.start,
              //   style: Theme.of(context).textTheme.caption!,
              // ),
              TextField(
                controller: controller.passwordTextContoller,
                decoration: InputDecoration(
                  hintText: "password",
                  prefix: Icon(
                    Icons.vpn_key_outlined,
                    color: Theme.of(context).iconTheme.color,
                  ),
                ),
              ),
              const SizedBox(height: 20),
              Obx(
                () {
                  if (controller.loginState.value == LoginState.loading) {
                    return const CircularProgressIndicator();
                  } else {
                    return ElevatedButton(
                      onPressed: login,
                      child: const Text(
                        "Login",
                      ),
                    );
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
