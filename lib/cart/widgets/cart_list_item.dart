import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:fake_store_v1/cart/model/cart_item.dart';
import 'package:fake_store_v1/cart/provider/cart_provider.dart';
import 'package:fake_store_v1/cart/widgets/quantity_item.dart';
import 'package:fake_store_v1/shared/utils/styles/font_styles.dart';

class CartListItem extends StatelessWidget {
  const CartListItem({super.key, required this.cartItem, required this.index});

  final CartItem cartItem;
  final int index;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      margin: const EdgeInsets.only(bottom: 10),
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: Colors.white,
        border: Border.all(color: Colors.black, width: 1),
        boxShadow: <BoxShadow>[
          BoxShadow(
            color: Colors.black.withOpacity(0.2),
            spreadRadius: 1,
            blurRadius: 2,
            offset: const Offset(1, 1),
          ),
        ],
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: CachedNetworkImage(
              imageUrl: cartItem.product.image!,
              fit: BoxFit.cover,
              width: 80,
              height: 100,
              placeholder: (BuildContext context, String url) => const Center(
                  child: CircularProgressIndicator(
                color: Colors.black,
                strokeAlign: 1,
              )),
              errorWidget: (BuildContext context, String url, Object error) =>
                  const Icon(Icons.error),
            ),
          ),
          const SizedBox(width: 10),
          Expanded(
            child: SizedBox(
              width: 100,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    cartItem.product.title!,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    textAlign: TextAlign.left,
                    style: FSFonts.regularFonts16,
                  ),
                  const SizedBox(height: 8),
                  Row(
                    children: <Widget>[
                      Text(
                        '\$${cartItem.product.price.toString()}',
                        style: FSFonts.semiBoldFonts24,
                      ),
                      Expanded(child: Container()),
                      QuantityItem(
                        quantity: cartItem.quantity,
                        onIncrease: () {
                          Provider.of<CartProvider>(context, listen: false)
                              .increaseCartItemQuantity(index);
                        },
                        onDecrease: () {
                          Provider.of<CartProvider>(context, listen: false)
                              .decreaseCartItemQuantity(index);
                        },
                      ),
                    ],
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
