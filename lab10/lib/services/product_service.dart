import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;

import '../models/product.dart';

class ApiException implements Exception {
  final String message;
  const ApiException(this.message);

  @override
  String toString() => message;
}

class ProductService {
  static const _url = 'https://fakestoreapi.com/products';
  static const _timeout = Duration(seconds: 10);

  Future<List<Product>> fetchProducts() async {
    try {
      final response = await http.get(Uri.parse(_url)).timeout(_timeout);

      switch (response.statusCode) {
        case 200:
          final data = jsonDecode(response.body) as List<dynamic>;
          return data
              .map((e) => Product.fromJson(e as Map<String, dynamic>))
              .toList();
        case 404:
          throw const ApiException('Not found (404): the endpoint does not exist.');
        case 500:
          throw const ApiException('Server error (500): please try again later.');
        default:
          throw ApiException('Unexpected error (HTTP ${response.statusCode}).');
      }
    } on TimeoutException {
      throw const ApiException('Request timed out after 10 seconds.');
    } on SocketException {
      throw const ApiException('No internet connection. Check your network.');
    } on http.ClientException {
      throw const ApiException('Network error. Check your connection.');
    } on FormatException {
      throw const ApiException('Received invalid data from the server.');
    }
  }
}
