import 'package:flutter/material.dart';
import 'package:fake_store_v1/home/model/product.dart';
import 'package:fake_store_v1/shared/widgets/app_bar/app_bar_builder.dart';
import 'package:fake_store_v1/home/widgets/product_list_items.dart';
import 'package:fake_store_v1/home/widgets/cart_items.dart';
import 'package:fake_store_v1/networks/api_service.dart';

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
      appBar: buildAppBar(context, cart: const CartItems()),
      body: SafeArea(
        child: RefreshIndicator(
          onRefresh: _refreshProducts,
          child: ProductListItems(productFuture: _productFuture),
        ),
      ),
    );
  }
}
