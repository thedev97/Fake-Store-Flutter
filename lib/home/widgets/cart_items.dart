import 'package:badges/badges.dart' as badges;
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:go_router/go_router.dart';
import 'package:fake_store_v1/cart/provider/cart_provider.dart';
import 'package:fake_store_v1/routes/app_routes_const.dart';

class CartItems extends StatelessWidget {
  const CartItems({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<CartProvider>(
      builder:
          (BuildContext context, CartProvider cartProvider, Widget? child) {
        return badges.Badge(
          badgeStyle: const badges.BadgeStyle(
            badgeColor: Colors.red,
          ),
          position: badges.BadgePosition.bottomEnd(bottom: 1, end: 1),
          badgeContent: Text(
            cartProvider.cartCount.toString(),
            style: const TextStyle(
              color: Colors.white,
            ),
          ),
          child: IconButton(
            color: Colors.black,
            icon: const Icon(Icons.shopping_cart),
            iconSize: 25,
            onPressed: () =>
                context.push('${AppRoutes.product}/${AppRoutes.cart}'),
          ),
        );
      },
    );
  }
}
