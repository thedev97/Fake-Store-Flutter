# fake_store_v1

A Shopping Cart Application.

## Getting Started

This project is a starting point for a Flutter application.

Requirements:

## App Structure:

o Product List Screen: Display a list of products with a thumbnail, name, and price. Implement pull-to-refresh.

o Product Detail Screen: Show detailed information (image, name, price, description) with an "Add to Cart" button.

o Cart Screen: Display the list of added products with the total price and option to remove items.

## Package Used

o badges: ^2.0.3 -> Use the Badge widget to show the count of cart items
o provider: ^6.1.2 -> Manage the application state 
o http: ^1.2.2  -> Manage the network requests
o cached_network_image: ^3.3.1 -> Fetch the newtork images from server and show it in ui
o go_router: ^14.2.1 -> Handle the navigation features
o google_fonts: ^6.2.1 -> Manage the fonts across the app (used Raleway fonts)
o collection: ^1.17.0 -> To specify the equality of elements and collections

## Clean Architecture
lib/
│
├── cart/
│   ├── model/
│   │   └── cart_item.dart
│   ├── provider/
│   │   └── cart_provider.dart
│   ├── widgets/
│   │   ├── cart_badge_item.dart
│   │   ├── cart_list_item.dart
│   │   ├── item_quantity.dart
│   └── cart_details.dart
│
├── home/
│   ├── model/
│   │   └── product.dart
│   ├── widgets/
│   │   ├── cart_items.dart
│   │   ├── product_grid_item.dart
│   │   ├── product_list_item.dart
│   └── home.dart
│
├── networks/
│   └── api_service.dart
│
├── product_details/
│   ├── widgets/
│   │   ├── product_description.dart
│   │   ├── product_image.dart
│   │   ├── product_pricing.dart
│   │   └── product_title.dart
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
│   │   └── font_styles.dart
│   ├── image_constants.dart
│   └── widgets/
│       ├── app_bar/
│       │   ├── app_bar_builder.dart
│       │   └── fs_app_bar.dart
│       └── button/
│           ├── base_button.dart
│           └── fs_elevated_button.dart
│
├── splash/
│   ├── widgets/
│   │   ├── fa_logo.dart
│   │   └── get_started_button.dart
│   └── splash.dart
│
└── main.dart


## Follow Linter Rules 
o Rules:
  avoid_print: Avoid print calls in production code.
  prefer_single_quotes: Only use double quotes for strings containing single quotes.
  camel_case_types: Name types using UpperCamelCase.
  camel_case_extensions: Name extensions using UpperCamelCase.
  annotate_overrides: Annotate overridden members.
  overridden_fields: Don't override fields.
  unnecessary_overrides: Don't override a method to do a super method invocation with the same parameters.
  avoid_implementing_value_types: Don't implement classes that override ==.
  always_specify_types: Specify type annotations.
  avoid_init_to_null: Don't explicitly initialize variables to null.
  prefer_const_constructors : Prefer const with constant constructors.
  sort_constructors_first: Sort constructor declarations before other members.
  type_annotate_public_apis: Type annotate public APIs.
  always_declare_return_types: Declare method return types.
  await_only_futures: Await only futures.
  file_names: Name source files using lowercase_with_underscores.
