import 'package:flutter_getx_mvvm/data/datasource/api_repository.impl.dart';
import 'package:flutter_getx_mvvm/data/datasource/local_repository_impl.dart';
import 'package:flutter_getx_mvvm/domain/repository/api_repository.dart';
import 'package:flutter_getx_mvvm/domain/repository/local_storage_repository.dart';
import 'package:get/instance_manager.dart';

class MainBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<LocalRepositoryInterface>(() => LocalRepositoryImpl());
    Get.lazyPut<ApiRepositoryInterface>(() => ApiRepositoryImpl());
  }
}
