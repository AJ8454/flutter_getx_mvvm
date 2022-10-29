// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter_getx_mvvm/domain/model/product.dart';

class ProductCart {
  final Product? product;
   int quantity;
  ProductCart({
    this.product,
    this.quantity = 1,
  });
}
