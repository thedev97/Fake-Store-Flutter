import 'package:flutter/material.dart';
import 'package:fake_store_v1/cart/cart_details.dart';
import 'package:fake_store_v1/home/home.dart';
import 'package:fake_store_v1/home/model/product.dart';
import 'package:fake_store_v1/product_details/product_details.dart';
import 'package:fake_store_v1/splash/splash.dart';
import 'package:go_router/go_router.dart';
import 'package:fake_store_v1/routes/app_routes_const.dart';
import 'package:fake_store_v1/routes/screens/not_found_page.dart';

class AppRouter {
  static final GlobalKey<NavigatorState> _rootNavigatorKey =
      GlobalKey<NavigatorState>();
  static const String _initialLocation = AppRoutes.splash;
  static final GoRouter _router = GoRouter(
    initialLocation: _initialLocation,
    debugLogDiagnostics: true,
    navigatorKey: _rootNavigatorKey,
    routes: <RouteBase>[
      GoRoute(
        path: AppRoutes.splash,
        builder: (BuildContext context, GoRouterState state) {
          return const Splash();
        },
      ),
      GoRoute(
        path: AppRoutes.product,
        builder: (BuildContext context, GoRouterState state) {
          return Container();
        },
        routes: <RouteBase>[
          GoRoute(
              path: AppRoutes.productList,
              builder: (BuildContext context, GoRouterState state) {
                return const Home();
              },
              routes: <RouteBase>[
                GoRoute(
                  path: AppRoutes.productDetails,
                  builder: (BuildContext context, GoRouterState state) {
                    final Product product = state.extra as Product;
                    return ProductDetails(
                        product: product, productId: product.id ?? 0);
                  },
                ),
              ]),
          GoRoute(
            path: AppRoutes.cart,
            builder: (BuildContext context, GoRouterState state) {
              return const CartDetails();
            },
          ),
        ],
      ),
    ],
    errorBuilder: (BuildContext context, GoRouterState state) =>
        const NotFoundScreen(),
  );

  static GoRouter get router => _router;
}
