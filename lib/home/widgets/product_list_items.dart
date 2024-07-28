import 'package:fake_store_v1/home/model/product.dart';
import 'package:fake_store_v1/home/widgets/product_grid_item.dart';
import 'package:fake_store_v1/routes/app_routes_const.dart';
import 'package:fake_store_v1/shared/utils/styles/font_styles.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class ProductListItems extends StatelessWidget {
  const ProductListItems({required this.productFuture, super.key});

  final Future<List<Product>> productFuture;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Product>>(
      future: productFuture,
      builder: (BuildContext context, AsyncSnapshot<List<Product>> snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(
              child: CircularProgressIndicator(
            color: Colors.black,
            strokeAlign: 1,
          ));
        } else if (snapshot.connectionState == ConnectionState.done) {
          if (snapshot.hasData) {
            final List<Product> data = snapshot.data!;
            return GridView.builder(
              padding: const EdgeInsets.all(16.0),
              itemCount: data.length,
              shrinkWrap: true,
              physics: const ScrollPhysics(),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
              ),
              itemBuilder: (BuildContext context, int index) {
                Product product = data[index];
                return GestureDetector(
                  onTap: () {
                    context.push(
                        '${AppRoutes.product}/${AppRoutes.productList}/${AppRoutes.productDetails}',
                        extra: product);
                  },
                  child: ProductGridItem(product: product),
                );
              },
            );
          } else {
            return Center(
                child: Text('No data available.', style: FSFonts.errorFonts));
          }
        } else {
          return Center(
              child: Text('An error occurred!', style: FSFonts.errorFonts));
        }
      },
    );
  }
}
