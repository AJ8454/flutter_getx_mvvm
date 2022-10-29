import 'package:flutter_getx_mvvm/domain/model/user.dart';

abstract class LocalRepositoryInterface {
  Future<String?> getToken();
  Future<String?> saveToken(String? token);
  Future<void> clearAllData();
  Future<User?> saveUser(User? user);
  Future<User?> getUser();
  Future<void> saveDarkMode(bool? darkmode);
  Future<bool?> isDarkMode();
}
