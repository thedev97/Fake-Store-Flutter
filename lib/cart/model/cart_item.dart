import 'package:fake_store_v1/home/model/product.dart';

class CartItem {
  CartItem({required this.product, this.quantity = 1});

  final Product product;
  int quantity;
}
