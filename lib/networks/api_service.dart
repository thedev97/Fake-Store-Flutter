import 'dart:convert';
import 'package:fake_store_v1/home/model/product.dart';
import 'package:http/http.dart';

class ApiService {
  final String baseUrl = 'https://fakestoreapi.com';
  Future<List<Product>> getProductList() async {
    final response = await get(Uri.parse('$baseUrl/products'), headers: {
      "Accept": "application/json",
      "content-type": "application/json",
    });

    if (response.statusCode == 200) {
      List<dynamic> data = jsonDecode(response.body);
      List<Product> productList = data
          .map((json) => Product(
                id: json['id'],
                title: json['title'],
                price: json['price'].toDouble(),
                description: json['description'],
                category: json['category'],
                image: json['image'],
              ))
          .toList();
      return productList;
    } else {
      throw Exception('Failed to load products');
    }
  }

  Future<Product> getProductById(int id) async {
    final response = await get(Uri.parse('$baseUrl/products/$id'), headers: {
      "Accept": "application/json",
      "content-type": "application/json",
    });

    if (response.statusCode == 200) {
      final json = jsonDecode(response.body);
      return Product(
        id: json['id'],
        title: json['title'],
        price: json['price'].toDouble(),
        description: json['description'],
        category: json['category'],
        image: json['image'],
      );
    } else {
      throw Exception('Failed to load product details');
    }
  }
}
