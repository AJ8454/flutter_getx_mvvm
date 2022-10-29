import 'package:flutter_getx_mvvm/data/datasource/api_repository.impl.dart';
import 'package:flutter_getx_mvvm/presentation/home/cart/cart_controller.dart';
import 'package:flutter_getx_mvvm/presentation/home/home_controller.dart';
import 'package:get/instance_manager.dart';

class HomeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(
      () => HomeController(
        localRepositoryInterface: Get.find(),
        apiRepositoryInterface: Get.put(ApiRepositoryImpl()),
      ),
    );

    Get.lazyPut(
      () => CartController(),
    );
  }
}
