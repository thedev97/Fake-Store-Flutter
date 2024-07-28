import 'package:flutter/material.dart';
import 'package:fake_store_v1/home/model/product.dart';
import 'package:fake_store_v1/networks/api_service.dart';
import 'package:fake_store_v1/product_details/widgets/product_description.dart';
import 'package:fake_store_v1/product_details/widgets/product_image.dart';
import 'package:fake_store_v1/product_details/widgets/product_pricing.dart';
import 'package:fake_store_v1/product_details/widgets/product_title.dart';
import 'package:fake_store_v1/shared/utils/styles/font_styles.dart';
import 'package:fake_store_v1/shared/widgets/app_bar/app_bar_builder.dart';

class ProductDetails extends StatelessWidget {
  const ProductDetails({
    super.key,
    required this.productId,
    required this.product,
  });

  final Product product;
  final int productId;

  @override
  Widget build(BuildContext context) {
    final ApiService apiService = ApiService();

    return Scaffold(
      appBar: buildDetailsAppBar(title: 'Product Details'),
      body: FutureBuilder<Product>(
        future: apiService.getProductById(productId),
        builder: (BuildContext context, AsyncSnapshot<Product> snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
                child: CircularProgressIndicator(
                    color: Colors.black, strokeAlign: 1));
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else if (snapshot.hasData) {
            final Product product = snapshot.data!;
            return Padding(
              padding: const EdgeInsets.all(16.0),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    ProductImage(imageUrl: product.image ?? ''),
                    const SizedBox(height: 16),
                    ProductTitle(title: product.title ?? ''),
                    const SizedBox(height: 8),
                    ProductDescription(description: product.description ?? ''),
                    const SizedBox(height: 20),
                    ProductPricing(
                        price: product.price ?? 0.0, product: product),
                  ],
                ),
              ),
            );
          } else {
            return Center(
                child: Text('No product data available',
                    style: FSFonts.errorFonts));
          }
        },
      ),
    );
  }
}
