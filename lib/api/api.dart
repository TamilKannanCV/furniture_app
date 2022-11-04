import 'dart:developer';

import 'package:furniture_app/models/products/product.dart';
import 'package:furniture_app/models/products/products.dart';
import 'package:http/http.dart' as http;
import 'package:http/retry.dart';

class Api {
  Future<List<Product>?> getProducts() async {
    final client = RetryClient(http.Client());
    final response = await client.get(Uri.parse("https://aap2t3qkrh.execute-api.us-east-1.amazonaws.com/v1/products"));
    if (response.statusCode == 200) {
      log(response.body);
      return Products.fromJson(response.body).products;
    }
    return null;
  }
}
