import 'package:flutter/material.dart';

import '../models/product.dart';

class ProductListTile extends StatelessWidget {
  const ProductListTile({super.key, required this.product});

  final Product product;

  @override
  Widget build(BuildContext context) {
    final scheme = Theme.of(context).colorScheme;

    return ListTile(
      tileColor: scheme.surface,
      contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
      leading: CircleAvatar(
        backgroundColor: scheme.primaryContainer,
        foregroundColor: scheme.onPrimaryContainer,
        child: Icon(product.icon),
      ),
      title: Text(
        product.title,
        maxLines: 1,
        overflow: TextOverflow.ellipsis,
        style: const TextStyle(fontWeight: FontWeight.w600),
      ),
      subtitle: Padding(
        padding: const EdgeInsets.only(top: 4),
        child: Row(
          children: [
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
              decoration: BoxDecoration(
                color: scheme.secondaryContainer,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Text(
                product.category,
                style: TextStyle(fontSize: 11, color: scheme.onSecondaryContainer),
              ),
            ),
            const SizedBox(width: 10),
            const Icon(Icons.star, size: 16, color: Colors.amber),
            const SizedBox(width: 2),
            Text(product.rating.toStringAsFixed(1)),
          ],
        ),
      ),
      trailing: Text(
        '\$${product.price.toStringAsFixed(2)}',
        style: TextStyle(
          fontSize: 15,
          fontWeight: FontWeight.bold,
          color: scheme.primary,
        ),
      ),
    );
  }
}
