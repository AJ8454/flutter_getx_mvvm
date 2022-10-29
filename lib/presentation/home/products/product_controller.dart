import 'package:flutter_getx_mvvm/domain/model/product.dart';
import 'package:flutter_getx_mvvm/domain/repository/api_repository.dart';
import 'package:get/state_manager.dart';

class ProductController extends GetxController {
  final ApiRepositoryInterface apiRepositoryInterface;
  ProductController({
    required this.apiRepositoryInterface,
  });

  RxList<Product> productList = <Product>[].obs;

  @override
  void onInit() {
    loadProducts();
    super.onInit();
  }

  void loadProducts() async {
    final result = await apiRepositoryInterface.getProduct();
    productList.value = result!;
  }
}
