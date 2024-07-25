import 'package:fake_store_v1/cart/cart_details.dart';
import 'package:fake_store_v1/home/home.dart';
import 'package:fake_store_v1/home/model/product.dart';
import 'package:fake_store_v1/product_details/product_details.dart';
import 'package:fake_store_v1/splash/splash.dart';
import 'package:go_router/go_router.dart';
import 'app_routes_const.dart';
import 'package:flutter/material.dart';
import 'screens/not_found_page.dart';

class AppRouter {
  static final _rootNavigatorKey = GlobalKey<NavigatorState>();
  static const _initialLocation = AppRoutes.splash;
  static final GoRouter _router = GoRouter(
    initialLocation: _initialLocation,
    debugLogDiagnostics: true,
    navigatorKey: _rootNavigatorKey,
    routes: [
      //Splash
      GoRoute(
        path: AppRoutes.splash,
        builder: (context, state) {
          return const Splash();
        },
      ),
      GoRoute(
        path: AppRoutes.product,
        builder: (context, state) {
          return Container();
        },
        routes: [
          GoRoute(
            path: AppRoutes.productList,
            builder: (context, state) {
              return const Home();
            },
            routes: [
              GoRoute(
                path: AppRoutes.productDetails,
                builder: (context, state) {
                  final product = state.extra as Product;
                  return ProductDetails(product: product,productId: product.id ?? 0);
                },
              ),
            ]
          ),
          GoRoute(
            path: AppRoutes.cart,
            builder: (context, state) {
              return const CartDetails();
            },
          ),
        ],
      ),
    ],
    errorBuilder: (context, state) => const NotFoundScreen(),
  );

  static GoRouter get router => _router;
}