import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/cart_provider.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final cart = context.watch<CartProvider>();
    final scheme = Theme.of(context).colorScheme;

    return Scaffold(
      appBar: AppBar(
        title: Text('Cart (${cart.count})'),
        actions: [
          TextButton.icon(
            onPressed: cart.items.isEmpty ? null : cart.clear,
            icon: const Icon(Icons.delete_sweep_outlined),
            label: const Text('Clear All'),
          ),
        ],
      ),
      body: cart.items.isEmpty
          ? Center(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(Icons.remove_shopping_cart_outlined,
                      size: 80, color: scheme.outline),
                  const SizedBox(height: 12),
                  Text('Your cart is empty',
                      style: Theme.of(context).textTheme.titleLarge),
                ],
              ),
            )
          : Column(
              children: [
                Expanded(
                  child: ListView.separated(
                    itemCount: cart.items.length,
                    separatorBuilder: (_, __) => const Divider(height: 1),
                    itemBuilder: (context, index) {
                      final p = cart.items[index];
                      return ListTile(
                        leading: CircleAvatar(
                          backgroundColor: scheme.primaryContainer,
                          child: Icon(p.icon, color: scheme.onPrimaryContainer),
                        ),
                        title: Text(p.title),
                        subtitle: Text('\$${p.price.toStringAsFixed(2)}'),
                        trailing: IconButton(
                          tooltip: 'Remove',
                          icon: const Icon(Icons.close, color: Colors.red),
                          onPressed: () => cart.remove(p),
                        ),
                      );
                    },
                  ),
                ),
                SafeArea(
                  top: false,
                  child: Container(
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: scheme.surfaceContainerHighest,
                      border: Border(top: BorderSide(color: scheme.outlineVariant)),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('Total', style: Theme.of(context).textTheme.titleMedium),
                        Text(
                          '\$${cart.totalPrice.toStringAsFixed(2)}',
                          style: Theme.of(context)
                              .textTheme
                              .headlineSmall
                              ?.copyWith(fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
    );
  }
}
