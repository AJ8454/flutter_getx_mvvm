import 'package:flutter_getx_mvvm/presentation/home/profile/profile_controller.dart';
import 'package:get/instance_manager.dart';

class ProfileBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(
      () => ProfileController(
        localRepositoryInterface: Get.find(),
      ),
    );
  }
}
