import 'dart:developer';

import 'package:flutter_getx_mvvm/data/in_memory_products.dart';
import 'package:flutter_getx_mvvm/domain/exception/auth_exception.dart';
import 'package:flutter_getx_mvvm/domain/model/product.dart';
import 'package:flutter_getx_mvvm/domain/model/user.dart';
import 'package:flutter_getx_mvvm/domain/repository/api_repository.dart';
import 'package:flutter_getx_mvvm/domain/request/login_request.dart';
import 'package:flutter_getx_mvvm/domain/response/login_response.dart';

class ApiRepositoryImpl extends ApiRepositoryInterface {
  @override
  Future<User?> getUserFromToken(String? token) async {
    await Future.delayed(const Duration(seconds: 3));
    if (token == "AA111") {
      return User(
          name: "Ajay",
          username: "ajayTech",
          image:
              "https://static.carthrottle.com/workspace/uploads/profile/5d6e8206c02ebeea950751903bdb88c2.jpg");
    } else if (token == "AA222") {
      return User(
          name: "Elon",
          username: "elonmusk",
          image:
              "https://pyxis.nymag.com/v1/imgs/bda/b78/a89f165376c8fe4054b0d0767ab4f298b2-elon-musk.jpg");
    }
    throw AuthException();
  }

  @override
  Future<LoginResponse> login(LoginRequest login) async {
    await Future.delayed(const Duration(seconds: 3));
    if (login.username == "ajayTech" && login.password == "Aj@y8454") {
      return LoginResponse(
        token: "AA111",
        user: User(
            name: "Ajay",
            username: "ajayTech",
            image:
                "https://static.carthrottle.com/workspace/uploads/profile/5d6e8206c02ebeea950751903bdb88c2.jpg"),
      );
    }

    if (login.username == "elonmusk" && login.password == "elon8454") {
      return LoginResponse(
        token: "AA222",
        user: User(
            name: "Elon",
            username: "elonmusk",
            image:
                "https://pyxis.nymag.com/v1/imgs/bda/b78/a89f165376c8fe4054b0d0767ab4f298b2-elon-musk.jpg"),
      );
    }
    throw AuthException();
  }

  @override
  Future<void> logout(String? token) async {
    log("removing token from server $token");
    return;
  }

  @override
  Future<List<Product>?> getProduct() async {
    await Future.delayed(const Duration(seconds: 2));
    return products;
  }
}
