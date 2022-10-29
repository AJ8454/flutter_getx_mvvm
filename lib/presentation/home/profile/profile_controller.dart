import 'package:flutter_getx_mvvm/domain/repository/local_storage_repository.dart';
import 'package:get/get.dart';

class ProfileController extends GetxController {
  final LocalRepositoryInterface localRepositoryInterface;

  ProfileController({
    required this.localRepositoryInterface,
  });

  @override
  void onReady() {
    loadUser();
    super.onReady();
  }


void loadUser(){}

}
