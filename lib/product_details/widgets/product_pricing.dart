import 'package:fake_store_v1/home/model/product.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:fake_store_v1/cart/provider/cart_provider.dart';
import 'package:fake_store_v1/shared/widgets/button/fs_elevated_button.dart';
import 'package:fake_store_v1/shared/utils/styles/font_styles.dart';
import 'package:go_router/go_router.dart';
import 'package:fake_store_v1/routes/app_routes_const.dart';

class ProductPricing extends StatelessWidget {
  const ProductPricing({super.key, required this.price, required this.product});

  final double price;
  final Product product;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Text('Price: \$$price', style: FSFonts.semiBoldFonts20),
        FSElevatedButton(
          width: MediaQuery.of(context).size.width / 3,
          onPressed: () {
            Provider.of<CartProvider>(context, listen: false)
                .addToCart(product, 1, '');
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text('Item added to cart',
                    style: FSFonts.buttonRegularFonts15),
                duration: const Duration(seconds: 2),
                backgroundColor: Colors.black,
                action: SnackBarAction(
                  onPressed: () =>
                      context.push('${AppRoutes.product}/${AppRoutes.cart}'),
                  label: 'Go',
                  textColor: Colors.white,
                ),
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
          buttonTextStyle: FSFonts.buttonRegularFonts15,
        ),
      ],
    );
  }
}
