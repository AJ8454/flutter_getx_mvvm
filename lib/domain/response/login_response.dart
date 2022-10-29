import 'package:flutter_getx_mvvm/domain/model/user.dart';

class LoginResponse {
  final String? token;
  final User? user;
  LoginResponse({
    this.token,
    this.user,
  });
}
