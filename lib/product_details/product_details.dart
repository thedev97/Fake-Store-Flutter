import 'package:fake_store_v1/cart/provider/cart_provider.dart';
import 'package:fake_store_v1/home/model/product.dart';
import 'package:fake_store_v1/networks/api_service.dart';
import 'package:fake_store_v1/routes/app_routes_const.dart';
import 'package:fake_store_v1/shared/utils/styles/font_styles.dart';
import 'package:fake_store_v1/shared/widgets/button/fs_elevated_button.dart';
import 'package:fake_store_v1/shared/widgets/common_widgets.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

class ProductDetails extends StatefulWidget {
  final Product product;
  final int productId;

  const ProductDetails(
      {super.key, required this.productId, required this.product});

  @override
  State<ProductDetails> createState() => _ProductDetailsState();
}

class _ProductDetailsState extends State<ProductDetails> {
  ApiService apiService = ApiService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildDetailsAppBar(title: 'Product Details'),
      body: FutureBuilder<Product>(
        future: apiService.getProductById(widget.productId),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator(color: Colors.black,strokeAlign: 1,));
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else if (snapshot.hasData) {
            final product = snapshot.data!;
            return Padding(
              padding: const EdgeInsets.all(16.0),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Image.network(product.image ?? '', scale: 4),
                    const SizedBox(height: 16),
                    Text(product.title ?? '',
                        style: FSFonts.semiBoldFonts20,
                        textAlign: TextAlign.center),
                    const SizedBox(height: 8),
                    Text(product.description ?? '',
                        style: FSFonts.regularFonts16,
                        textAlign: TextAlign.center),
                    const SizedBox(height: 20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('Price: \$${product.price}',
                            style: FSFonts.semiBoldFonts20),
                        FSElevatedButton(
                          width: MediaQuery.of(context).size.width / 3,
                          onPressed: () {
                            Provider.of<CartProvider>(context, listen: false)
                                .addToCart(widget.product, 1, "");
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                content: Text('Item added to cart', style: FSFonts.buttonRegularFonts16,),
                                duration: const Duration(seconds: 2),
                                backgroundColor: Colors.black,
                                action: SnackBarAction(onPressed: () => context.push("${AppRoutes.product}/${AppRoutes.cart}"), label:
                                    'Go',textColor: Colors.white,),
                              ),
                            );
                          },
                          text: 'Add to Cart',
                          buttonStyle: ElevatedButton.styleFrom(
                            backgroundColor: Colors.black,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15),
                            ),
                          ),
                          buttonTextStyle: FSFonts.buttonRegularFonts16,
                        ),
                      ],
                    )
                  ],
                ),
              ),
            );
          } else {
            return Center(child: Text('No product data available', style: FSFonts.errorFonts,));
          }
        },
      ),
    );
  }
}
