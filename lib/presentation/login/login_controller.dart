import 'package:flutter/widgets.dart';
import 'package:flutter_getx_mvvm/domain/exception/auth_exception.dart';
import 'package:flutter_getx_mvvm/domain/repository/api_repository.dart';
import 'package:flutter_getx_mvvm/domain/repository/local_storage_repository.dart';
import 'package:flutter_getx_mvvm/domain/request/login_request.dart';
import 'package:get/get.dart';

enum LoginState { loading, initail }

class LoginController extends GetxController {
  final LocalRepositoryInterface localRepositoryInterface;
  final ApiRepositoryInterface apiRepositoryInterface;
  LoginController({
    required this.localRepositoryInterface,
    required this.apiRepositoryInterface,
  });

  final usernameTextContoller = TextEditingController();
  final passwordTextContoller = TextEditingController();
  var loginState = LoginState.initail.obs;

  Future<bool> login() async {
    final username = usernameTextContoller.text;
    final password = passwordTextContoller.text;

    try {
      loginState(LoginState.loading);
      final loginResponse = await apiRepositoryInterface.login(
        LoginRequest(username: username, password: password),
      );

      await localRepositoryInterface.saveToken(loginResponse.token);
      await localRepositoryInterface.saveUser(loginResponse.user);
      
      return true;
    } on AuthException catch (_) {
      loginState(LoginState.initail);
      return false;
    }
  }
}
