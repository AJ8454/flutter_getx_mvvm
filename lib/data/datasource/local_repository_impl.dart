import 'package:flutter_getx_mvvm/domain/model/user.dart';
import 'package:flutter_getx_mvvm/domain/repository/local_storage_repository.dart';
import 'package:shared_preferences/shared_preferences.dart';

const _prefToken = "token";
const _prefUsername = "USERNAME";
const _prefName = "NAME";
const _prefImage = "IMAGE";
const _prefDarkTheme = "THEME_DARK";

class LocalRepositoryImpl extends LocalRepositoryInterface {
  @override
  Future<void> clearAllData() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    sharedPreferences.clear();
  }

  @override
  Future<String?> getToken() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    return sharedPreferences.getString(_prefToken);
  }

  @override
  Future<String?> saveToken(String? token) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    sharedPreferences.setString(_prefToken, token!);
    return token;
  }

  @override
  Future<User?> getUser() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    final username = sharedPreferences.getString(_prefUsername);
    final name = sharedPreferences.getString(_prefName);
    final image = sharedPreferences.getString(_prefImage);
    final user = User(name: name, username: username, image: image);
    return user;
  }

  @override
  Future<User?> saveUser(User? user) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    sharedPreferences.setString(_prefUsername, user!.username!);
    sharedPreferences.setString(_prefName, user.name!);
    sharedPreferences.setString(_prefImage, user.image!);
    return user;
  }

  @override
  Future<bool?> isDarkMode() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    return sharedPreferences.getBool(_prefDarkTheme);
  }

  @override
  Future<void> saveDarkMode(bool? darkmode) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    sharedPreferences.setBool(_prefDarkTheme, darkmode!);
  }
}
