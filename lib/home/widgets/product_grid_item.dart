import 'package:cached_network_image/cached_network_image.dart';
import 'package:fake_store_v1/cart/provider/cart_provider.dart';
import 'package:fake_store_v1/home/model/product.dart';
import 'package:fake_store_v1/shared/utils/styles/font_styles.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ProductGridItem extends StatelessWidget {
  const ProductGridItem({super.key, required this.product});

  final Product product;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(5),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: Colors.white,
        boxShadow: <BoxShadow>[
          BoxShadow(
            color: Colors.black.withOpacity(0.2),
            spreadRadius: 1,
            blurRadius: 1.0,
            offset: const Offset(0, 1),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: Hero(
              transitionOnUserGestures: true,
              tag: product.id!,
              child: CachedNetworkImage(
                imageUrl: product.image!,
                fit: BoxFit.fitHeight,
                width: double.infinity,
                height: 100,
                placeholder: (BuildContext context, String url) => const Center(
                  child: CircularProgressIndicator(
                    color: Colors.black,
                    strokeAlign: 1,
                  ),
                ),
                errorWidget: (BuildContext context, String url, Object error) =>
                    const Icon(Icons.error),
              ),
            ),
          ),
          const SizedBox(height: 5),
          Flexible(
            child: Text(
              product.title!,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              textAlign: TextAlign.left,
              style: FSFonts.regularFonts14,
            ),
          ),
          Row(
            children: <Widget>[
              Text('\$${product.price.toString()}',
                  style: FSFonts.regularFonts14),
              Expanded(child: Container()),
              IconButton(
                icon: const Icon(Icons.shopping_cart),
                color: Colors.black,
                iconSize: 25,
                onPressed: () {
                  Provider.of<CartProvider>(context, listen: false)
                      .addToCart(product, 1, '');
                },
              ),
            ],
          ),
        ],
      ),
    );
  }
}
