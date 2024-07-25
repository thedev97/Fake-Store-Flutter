import 'package:fake_store_v1/cart/provider/cart_provider.dart';
import 'package:fake_store_v1/home/model/product.dart';
import 'package:fake_store_v1/home/widgets/productlist_items.dart';
import 'package:fake_store_v1/networks/api_service.dart';
import 'package:fake_store_v1/routes/app_routes_const.dart';
import 'package:fake_store_v1/shared/widgets/common_widgets.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:badges/badges.dart' as badges;

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final ApiService _apiService = ApiService();
  late Future<List<Product>> _productFuture;

  @override
  void initState() {
    super.initState();
    _productFuture = _apiService.getProductList();
  }

  Future<void> _refreshProducts() async {
    setState(() {
      _productFuture = _apiService.getProductList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(context, cart: _cartItems()),
      body: SafeArea(
        child: RefreshIndicator(
          onRefresh: _refreshProducts,
          child: ProductListItems(productFuture: _productFuture),
        ),
      ),
    );
  }

  // Cart Items
  Widget _cartItems() => Row(
    children: [
      Consumer<CartProvider>(
        builder: (context, cartProvider, child) {
          return badges.Badge(
            badgeColor: Colors.red,
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
              onPressed: () => context.push("${AppRoutes.product}/${AppRoutes.cart}"),
            ),
          );
        },
      ),
      const SizedBox(
        width: 5,
      ),
    ],
  );
}

