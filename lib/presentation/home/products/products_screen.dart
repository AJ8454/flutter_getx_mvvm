// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_getx_mvvm/data/datasource/api_repository.impl.dart';
import 'package:get/get.dart';

import 'package:flutter_getx_mvvm/domain/model/product.dart';
import 'package:flutter_getx_mvvm/presentation/home/cart/cart_controller.dart';
import 'package:flutter_getx_mvvm/presentation/home/products/product_controller.dart';

class ProductScreen extends StatelessWidget {
  ProductScreen({super.key});

  final controller = Get.put<ProductController>(
      ProductController(apiRepositoryInterface: Get.put(ApiRepositoryImpl())));

  final cartController = Get.find<CartController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Products"),
      ),
      body: Obx(
        () => controller.productList.isNotEmpty
            ? GridView.builder(
                padding: const EdgeInsets.symmetric(horizontal: 12),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 2 / 3,
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10,
                ),
                itemCount: controller.productList.length,
                itemBuilder: (context, index) {
                  final product = controller.productList[index];
                  return ItemProduct(
                    product: product,
                    onTap: () {
                      cartController.add(product);
                    },
                  );
                },
              )
            : const Center(
                child: CircularProgressIndicator(),
              ),
      ),
    );
  }
}

class ItemProduct extends StatelessWidget {
  final Product product;
  final VoidCallback onTap;
  const ItemProduct({
    Key? key,
    required this.product,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 8,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      color: Theme.of(context).canvasColor,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CircleAvatar(
            radius: 65,
            backgroundImage: NetworkImage(product.image!),
          ),
          Text(product.name!),
          Text(product.description!),
          Text(product.price!.toString()),
          ElevatedButton(onPressed: onTap, child: const Text("Add"))
        ],
      ),
    );
  }
}
