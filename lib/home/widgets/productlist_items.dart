import 'package:fake_store_v1/home/model/product.dart';
import 'package:fake_store_v1/home/widgets/product_grid_item.dart';
import 'package:fake_store_v1/routes/app_routes_const.dart';
import 'package:fake_store_v1/shared/utils/styles/font_styles.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class ProductListItems extends StatelessWidget {
  final Future<List<Product>> productFuture;

  const ProductListItems({required this.productFuture, super.key});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Product>>(
      future: productFuture,
      builder: (BuildContext context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator(color: Colors.black,strokeAlign: 1,));
        } else if (snapshot.connectionState == ConnectionState.done) {
          if (snapshot.hasData) {
            final data = snapshot.data!;
            return GridView.builder(
              padding: const EdgeInsets.all(16.0),
              itemCount: data.length,
              shrinkWrap: true,
              physics: const ScrollPhysics(),
              gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                maxCrossAxisExtent: 212,
                childAspectRatio: 3 / 6,
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
              ),
              itemBuilder: (context, index) {
                var product = data[index];
                return GestureDetector(
                  onTap: () {
                    context.push(
                        "${AppRoutes.product}/${AppRoutes.productList}/${AppRoutes.productDetails}",
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
