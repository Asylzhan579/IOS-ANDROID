import 'package:flutter/material.dart';

import '../data/products_data.dart';
import '../widgets/product_card.dart';

class FeedTab extends StatefulWidget {
  const FeedTab({super.key});

  @override
  State<FeedTab> createState() => _FeedTabState();
}

class _FeedTabState extends State<FeedTab> {
  static const _all = 'All';

  final List<String> _categories = [
    _all,
    ...{for (final p in products) p.category},
  ];

  String _selected = _all;

  @override
  Widget build(BuildContext context) {
    final filtered = _selected == _all
        ? products
        : products.where((p) => p.category == _selected).toList();

    return Column(
      children: [
        SizedBox(
          height: 56,
          child: ListView.separated(
            scrollDirection: Axis.horizontal,
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
            itemCount: _categories.length,
            separatorBuilder: (_, __) => const SizedBox(width: 8),
            itemBuilder: (_, i) {
              final category = _categories[i];
              return ChoiceChip(
                label: Text(category),
                selected: _selected == category,
                onSelected: (_) => setState(() => _selected = category),
              );
            },
          ),
        ),
        Expanded(
          child: filtered.isEmpty
              ? const Center(child: Text('No items'))
              : ListView.builder(
            padding: const EdgeInsets.only(bottom: 8),
            itemCount: filtered.length,
            itemBuilder: (_, i) => ProductCard(product: filtered[i]),
          ),
        ),
      ],
    );
  }
}