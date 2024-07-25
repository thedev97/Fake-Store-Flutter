import 'package:cached_network_image/cached_network_image.dart';
import 'package:fake_store_v1/cart/model/cart_item.dart';
import 'package:fake_store_v1/cart/provider/cart_provider.dart';
import 'package:fake_store_v1/cart/widgets/item_quantity.dart';
import 'package:fake_store_v1/shared/utils/styles/font_styles.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CartListItem extends StatefulWidget {
  final CartItem cartItem;
  final int index;

  const CartListItem({super.key, required this.cartItem, required this.index});

  @override
  State<CartListItem> createState() => _CartListItemState();
}

class _CartListItemState extends State<CartListItem> {
  int quantity = 1;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      margin: const EdgeInsets.only(bottom: 10),
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.2),
            spreadRadius: 2,
            blurRadius: 1.0,
            offset: const Offset(0, 1),
          ),
        ],
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: CachedNetworkImage(
              imageUrl: widget.cartItem.product.image!,
              fit: BoxFit.cover,
              width: 80,
              height: 100,
              placeholder: (context, url) => const Center(
                  child: CircularProgressIndicator(
                color: Colors.black,
                strokeAlign: 1,
              )),
              errorWidget: (context, url, error) => const Icon(Icons.error),
            ),
          ),
          const SizedBox(
            width: 10,
          ),
          Expanded(
            child: SizedBox(
              width: 100,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    widget.cartItem.product.title!,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    textAlign: TextAlign.left,
                    style: FSFonts.regularFonts16,
                  ),
                  const SizedBox(height: 8),
                  Row(
                    children: [
                      Text(
                        "\$${widget.cartItem.product.price.toString()}",
                        style: FSFonts.semiBoldFonts24,
                      ),
                      Expanded(child: Container()),
                      QuantityItem(
                        quantity: widget.cartItem.quantity,
                        onIncrease: () {
                          Provider.of<CartProvider>(context, listen: false)
                              .increaseCartItemQuantity(widget.index);
                        },
                        onDecrease: () {
                          if (quantity >= 1) {
                            Provider.of<CartProvider>(context, listen: false)
                                .decreaseCartItemQuantity(widget.index);
                          }
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
