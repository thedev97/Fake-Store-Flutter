import 'package:fake_store_v1/cart/widgets/cart_list_item.dart';
import 'package:fake_store_v1/cart/model/cart_item.dart';
import 'package:fake_store_v1/shared/utils/styles/font_styles.dart';
import 'package:fake_store_v1/shared/widgets/button/fs_elevated_button.dart';
import 'package:fake_store_v1/shared/widgets/common_widgets.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:badges/badges.dart' as badges;

import 'provider/cart_provider.dart';

class CartDetails extends StatefulWidget {
  const CartDetails({super.key});

  @override
  State<CartDetails> createState() => _CartDetailsState();
}

class _CartDetailsState extends State<CartDetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildCartAppBar(title: 'Cart', cart: _cartItem()),
      body: SafeArea(
        child: Consumer<CartProvider>(
          builder: (context, cartProvider, child) {
            final List<CartItem> cartItems = cartProvider.cartItems;
            return Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: [
                  Expanded(
                    child: cartItems.isEmpty
                        ? Center(
                            child: Text(
                              'Your cart is empty.',
                              style: FSFonts.errorFonts
                            ),
                          )
                        : ListView.builder(
                            itemCount: cartItems.length,
                            itemBuilder: (context, index) {
                              final cartItem = cartItems[index];
                              return Dismissible(
                                key: Key(cartItem.product.id.toString()),
                                background: Container(
                                  color: Colors.red,
                                  alignment: Alignment.centerRight,
                                  padding: const EdgeInsets.only(right: 16.0),
                                  child: const Icon(
                                    Icons.delete,
                                    color: Colors.white,
                                  ),
                                ),
                                direction: DismissDirection.endToStart,
                                onDismissed: (direction) {
                                  Provider.of<CartProvider>(context,
                                          listen: false)
                                      .removeCartItem(index);
                                },
                                child: GestureDetector(
                                    onTap: () {},
                                    child: CartListItem(
                                      cartItem: cartItem,
                                      index: index,
                                    )),
                              );
                            },
                          ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            FSElevatedButton(
                              onPressed: () =>  Provider.of<CartProvider>(context, listen: false)
                                  .clearCart(),
                              width: MediaQuery.of(context).size.width / 3.5,
                              text: 'Clear Cart',
                              buttonStyle: ElevatedButton.styleFrom(
                                backgroundColor: Colors.black,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(15),
                                ),
                              ),
                              buttonTextStyle: FSFonts.buttonRegularFonts16,
                            ),
                          ],
                        ),
                        const Divider(color: Colors.grey),
                        const SizedBox(height: 5),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Total Price:',
                              style: FSFonts.semiBoldFonts16,
                            ),
                            Text(
                              '\$${cartProvider.totalPrice.toStringAsFixed(2)}',
                              style: FSFonts.semiBoldFonts22,
                            ),
                          ],
                        ),
                        const SizedBox(height: 20),
                        FSElevatedButton(
                          onPressed: () {},
                          text: 'Checkout',
                          buttonStyle: ElevatedButton.styleFrom(
                            backgroundColor: Colors.black,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15),
                            ),
                          ),
                          buttonTextStyle: FSFonts.buttonRegularFonts16,
                        ),
                        const SizedBox(height: 10),
                      ],
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }

  Widget _cartItem() => Consumer<CartProvider>(
        builder: (context, cartProvider, child) {
          return badges.Badge(
            position: badges.BadgePosition.bottomEnd(bottom: 1, end: 1),
            badgeContent: Text(
              cartProvider.cartCount.toString(),
              style: const TextStyle(color: Colors.white),
            ),
            child: IconButton(
              color: Colors.black,
              icon: const Icon(Icons.shopping_cart),
              iconSize: 25,
              onPressed: () {},
            ),
          );
        },
      );
}
