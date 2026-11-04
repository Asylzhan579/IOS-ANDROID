import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models/product.dart';
import '../providers/cart_provider.dart';
import '../widgets/cart_badge_button.dart';
import 'cart_screen.dart';

class CatalogScreen extends StatelessWidget {
  const CatalogScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Catalog'),
        actions: [
          CartBadgeButton(
            onPressed: () => Navigator.push(
              context,
              MaterialPageRoute(builder: (_) => const CartScreen()),
            ),
          ),
          const SizedBox(width: 8),
        ],
      ),
      body: ListView.separated(
        padding: const EdgeInsets.all(12),
        itemCount: kProducts.length,
        separatorBuilder: (_, __) => const SizedBox(height: 8),
        itemBuilder: (context, index) => _ProductCard(product: kProducts[index]),
      ),
    );
  }
}

class _ProductCard extends StatelessWidget {
  const _ProductCard({required this.product});

  final Product product;

  @override
  Widget build(BuildContext context) {
    final scheme = Theme.of(context).colorScheme;
    final inCart = context.watch<CartProvider>().contains(product);

    return Card(
      child: ListTile(
        contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        leading: CircleAvatar(
          backgroundColor: scheme.primaryContainer,
          child: Icon(product.icon, color: scheme.onPrimaryContainer),
        ),
        title: Text(product.title,
            style: const TextStyle(fontWeight: FontWeight.w600)),
        subtitle: Text('${product.category} • \$${product.price.toStringAsFixed(2)}'),
        trailing: inCart
            ? FilledButton.icon(
                onPressed: () => context.read<CartProvider>().toggle(product),
                icon: const Icon(Icons.check, size: 18),
                label: const Text('In Cart'),
              )
            : OutlinedButton.icon(
                onPressed: () => context.read<CartProvider>().toggle(product),
                icon: const Icon(Icons.add_shopping_cart, size: 18),
                label: const Text('Add'),
              ),
      ),
    );
  }
}
