import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:fake_store_v1/cart/provider/cart_provider.dart';
import 'package:fake_store_v1/cart/widgets/cart_badge_icon.dart';
import 'package:fake_store_v1/cart/widgets/cart_list_item.dart';
import 'package:fake_store_v1/cart/model/cart_item.dart';
import 'package:fake_store_v1/shared/utils/styles/font_styles.dart';
import 'package:fake_store_v1/shared/widgets/app_bar/app_bar_builder.dart';
import 'package:fake_store_v1/shared/widgets/button/fs_elevated_button.dart';

class CartDetails extends StatelessWidget {
  const CartDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildCartAppBar(title: 'Cart', cart: const CartBadgeIcon()),
      body: SafeArea(
        child: Consumer<CartProvider>(
          builder:
              (BuildContext context, CartProvider cartProvider, Widget? child) {
            final List<CartItem> cartItems = cartProvider.cartItems;
            return Padding(
              padding: const EdgeInsets.all(10.0),
              child: Column(
                children: <Widget>[
                  Expanded(
                    child: cartItems.isEmpty
                        ? Center(
                            child: Text(
                              'Your cart is empty.',
                              style: FSFonts.errorFonts,
                            ),
                          )
                        : ListView.builder(
                            itemCount: cartItems.length,
                            itemBuilder: (BuildContext context, int index) {
                              final CartItem cartItem = cartItems[index];
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
                                onDismissed: (DismissDirection direction) {
                                  Provider.of<CartProvider>(context,
                                          listen: false)
                                      .removeCartItem(index);
                                },
                                child: CartListItem(
                                  cartItem: cartItem,
                                  index: index,
                                ),
                              );
                            },
                          ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      children: <Widget>[
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: <Widget>[
                            FSElevatedButton(
                              onPressed: () => Provider.of<CartProvider>(
                                      context,
                                      listen: false)
                                  .clearCart(),
                              width: MediaQuery.of(context).size.width / 3.2,
                              text: 'Clear Cart',
                              buttonStyle: ElevatedButton.styleFrom(
                                backgroundColor: Colors.black,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(15),
                                ),
                              ),
                              buttonTextStyle: FSFonts.buttonRegularFonts15,
                            ),
                          ],
                        ),
                        const Divider(color: Colors.grey),
                        const SizedBox(height: 5),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
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
                          buttonTextStyle: FSFonts.buttonRegularFonts15,
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
}
