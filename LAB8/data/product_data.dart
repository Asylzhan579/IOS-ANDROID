import 'package:flutter/material.dart';

import '../models/product.dart';

List<Product> buildSeedProducts() => const [
      Product(id: 1, title: 'Wireless Headphones', category: 'Audio', rating: 4.6, price: 89.99, icon: Icons.headphones),
      Product(id: 2, title: 'Smart Watch Series 5', category: 'Wearables', rating: 4.4, price: 199.00, icon: Icons.watch),
      Product(id: 3, title: 'Mechanical Keyboard', category: 'Accessories', rating: 4.8, price: 129.50, icon: Icons.keyboard),
      Product(id: 4, title: 'Gaming Mouse', category: 'Accessories', rating: 4.3, price: 49.90, icon: Icons.mouse),
      Product(id: 5, title: 'Laptop Pro 14"', category: 'Computers', rating: 4.9, price: 1499.00, icon: Icons.laptop_mac),
      Product(id: 6, title: 'Smartphone X', category: 'Phones', rating: 4.5, price: 799.00, icon: Icons.smartphone),
      Product(id: 7, title: 'Tablet Air 11', category: 'Tablets', rating: 4.2, price: 449.00, icon: Icons.tablet_mac),
      Product(id: 8, title: '4K Action Camera', category: 'Cameras', rating: 4.1, price: 259.99, icon: Icons.videocam),
      Product(id: 9, title: 'Bluetooth Speaker', category: 'Audio', rating: 4.0, price: 59.00, icon: Icons.speaker),
      Product(id: 10, title: 'Smart TV 55"', category: 'Home', rating: 4.7, price: 649.00, icon: Icons.tv),
      Product(id: 11, title: 'Portable SSD 1TB', category: 'Storage', rating: 4.6, price: 109.00, icon: Icons.sd_storage),
      Product(id: 12, title: 'Game Controller', category: 'Gaming', rating: 4.5, price: 69.99, icon: Icons.sports_esports),
    ];

const _titles = [
  'Smart Lamp', 'USB-C Hub', 'Webcam HD', 'Power Bank', 'E-Reader',
  'Drone Mini', 'VR Headset', 'Fitness Band', 'Monitor 27"', 'Router Wi-Fi 6',
];
const _categories = ['New', 'Gadgets', 'Home', 'Office', 'Gaming'];
const _icons = [
  Icons.lightbulb, Icons.usb, Icons.camera_alt, Icons.battery_charging_full,
  Icons.menu_book, Icons.flight, Icons.vrpano, Icons.monitor_heart,
  Icons.desktop_windows, Icons.router,
];

Product generateNewProduct(int id) {
  final i = id % _titles.length;
  return Product(
    id: id,
    title: '${_titles[i]} #$id',
    category: _categories[id % _categories.length],
    rating: 3.5 + (id % 15) / 10, // 3.5 .. 4.9
    price: 20.0 + (id * 37 % 400),
    icon: _icons[i],
  );
}
