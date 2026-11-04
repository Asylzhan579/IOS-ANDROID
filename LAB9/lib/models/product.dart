import 'package:flutter/material.dart';

class Product {
  final int id;
  final String title;
  final String category;
  final double price;
  final IconData icon;

  const Product({
    required this.id,
    required this.title,
    required this.category,
    required this.price,
    required this.icon,
  });
}

const List<Product> kProducts = [
  Product(id: 1, title: 'Wireless Headphones', category: 'Audio', price: 89.99, icon: Icons.headphones),
  Product(id: 2, title: 'Smart Watch', category: 'Wearables', price: 199.00, icon: Icons.watch),
  Product(id: 3, title: 'Mechanical Keyboard', category: 'Accessories', price: 129.50, icon: Icons.keyboard),
  Product(id: 4, title: 'Gaming Mouse', category: 'Accessories', price: 49.90, icon: Icons.mouse),
  Product(id: 5, title: 'Laptop Pro 14"', category: 'Computers', price: 1499.00, icon: Icons.laptop_mac),
  Product(id: 6, title: 'Bluetooth Speaker', category: 'Audio', price: 59.00, icon: Icons.speaker),
];
