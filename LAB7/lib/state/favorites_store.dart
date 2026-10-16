import 'package:flutter/material.dart';

import '../data/products_data.dart';
import '../models/product.dart';

class FavoritesStore extends ChangeNotifier {
  final Set<int> _ids = {};

  List<Product> get items =>
      products.where((p) => _ids.contains(p.id)).toList();

  bool isFavorite(Product p) => _ids.contains(p.id);

  void toggle(Product p) {
    if (!_ids.remove(p.id)) _ids.add(p.id);
    notifyListeners();
  }
}

final FavoritesStore favorites = FavoritesStore();
