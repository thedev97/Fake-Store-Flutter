import 'package:fake_store_v1/cart/model/cart_item.dart';
import 'package:fake_store_v1/home/model/product.dart';
import 'package:flutter/material.dart';
import 'package:collection/collection.dart';

class CartProvider extends ChangeNotifier {
  final List<CartItem> _cartItems = <CartItem>[];

  List<CartItem> get cartItems => _cartItems;

  void addToCart(Product product, int quantity, String selectedVariant) {
    CartItem? existingCartItem = _cartItems.firstWhereOrNull(
      (CartItem item) => item.product.id == product.id,
    );

    if (existingCartItem != null) {
      existingCartItem.quantity += quantity;
    } else {
      _cartItems.add(CartItem(product: product, quantity: quantity));
    }

    notifyListeners();
  }

  int get cartCount {
    return _cartItems.fold(0, (int sum, CartItem item) => sum + item.quantity);
  }

  double get totalPrice {
    return _cartItems.fold(
        0.0,
        (double sum, CartItem item) =>
            sum + (item.product.price! * item.quantity));
  }

  void increaseCartItemQuantity(int index) {
    if (index >= 0 && index < _cartItems.length) {
      _cartItems[index].quantity++;
      notifyListeners();
    }
  }

  void decreaseCartItemQuantity(int index) {
    if (index >= 0 && index < _cartItems.length) {
      if (_cartItems[index].quantity > 1) {
        _cartItems[index].quantity--;
        notifyListeners();
      } else {
        _cartItems.removeAt(index);
        notifyListeners();
      }
    }
  }

  void removeCartItem(int index) {
    if (index >= 0 && index < _cartItems.length) {
      _cartItems.removeAt(index);
      notifyListeners();
    }
  }

  // Clear all cart items
  void clearCart() {
    _cartItems.clear();
    notifyListeners();
  }
}
