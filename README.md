# fake_store_v1

A Shopping Cart Application.

## Getting Started

This project is a starting point for a Flutter application.

Requirements:

## App Structure:

o Product List Screen: Display a list of products with a thumbnail, name, and price. Implement pull-to-refresh.

o Product Detail Screen: Show detailed information (image, name, price, description) with an "Add to Cart" button.

o Cart Screen: Display the list of added products with the total price and option to remove items.

## Clean Architecture

lib/
│
├── cart/
│   ├── model/
│   │   └── cart_item.dart
│   ├── provider/
│   │   └── cart_provider.dart
│   ├── widgets/
│   │   ├── cart_list_item.dart
│   │   ├── item_quantity.dart
│   ├── cart_details.dart
│
├── home/
│   ├── model/
│   │   └── product.dart
│   ├── widgets/
│   │   ├── product_grid_item.dart
│   │   ├── productlist_items.dart
│   ├── home.dart
│
├── product_details/
│   └── product_details.dart
│
├── routes/
│   ├── screens/
│   │   └── not_found_page.dart
│   ├── app_route.dart
│   └── app_routes_const.dart
│
├── shared/
│   ├── utils/
│   │   ├── font_styles.dart
│   ├── image_constant.dart
│   └── widgets/
│       ├── app_bar/
│       │   └── fs_app_bar.dart
│       ├── button/
│       │   ├── base_button.dart
│       │   └── fs_elevated_button.dart
│   ├── common_widgets.dart
│   ├── fs_image_constant.dart
│
├── splash/
│   └── splash.dart
│
└── main.dart
