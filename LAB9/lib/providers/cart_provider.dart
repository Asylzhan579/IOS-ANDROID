import 'package:flutter/foundation.dart';

import '../models/product.dart';

class CartProvider extends ChangeNotifier {
  final List<Product> _items = [];

  List<Product> get items => List.unmodifiable(_items);

  int get count => _items.length;

  double get totalPrice => _items.fold(0.0, (sum, p) => sum + p.price);

  bool contains(Product p) => _items.any((e) => e.id == p.id);

  void add(Product p) {
    if (contains(p)) return;
    _items.add(p);
    notifyListeners();
  }

  void remove(Product p) {
    _items.removeWhere((e) => e.id == p.id);
    notifyListeners();
  }

  void toggle(Product p) => contains(p) ? remove(p) : add(p);

  void clear() {
    _items.clear();
    notifyListeners();
  }
}
