import 'package:flutter_getx_mvvm/domain/model/product.dart';
import 'package:flutter_getx_mvvm/domain/model/user.dart';
import 'package:flutter_getx_mvvm/domain/request/login_request.dart';
import 'package:flutter_getx_mvvm/domain/response/login_response.dart';

abstract class ApiRepositoryInterface {
  Future<User?> getUserFromToken(String? token);
  Future<LoginResponse> login(LoginRequest login);
  Future<void> logout(String? token);
  Future<List<Product>?> getProduct();
}
