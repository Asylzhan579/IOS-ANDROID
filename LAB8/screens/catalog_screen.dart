import 'package:flutter/material.dart';

import '../data/product_data.dart';
import '../models/product.dart';
import '../widgets/dismiss_background.dart';
import '../widgets/empty_state.dart';
import '../widgets/product_grid_card.dart';
import '../widgets/product_list_tile.dart';

enum ViewMode { list, grid }

class CatalogScreen extends StatefulWidget {
  const CatalogScreen({super.key});

  @override
  State<CatalogScreen> createState() => _CatalogScreenState();
}

class _CatalogScreenState extends State<CatalogScreen> {
  late List<Product> _products;
  ViewMode _mode = ViewMode.list;
  int _nextId = 100;

  @override
  void initState() {
    super.initState();
    _products = List.of(buildSeedProducts());
  }


  void _toggleMode() {
    setState(() {
      _mode = _mode == ViewMode.list ? ViewMode.grid : ViewMode.list;
    });
  }

  Future<void> _onRefresh() async {
    await Future.delayed(const Duration(milliseconds: 1500));
    if (!mounted) return;
    setState(() {
      _products.insert(0, generateNewProduct(_nextId++));
    });
  }

  void _onDismissed(Product product) {
    final index = _products.indexWhere((p) => p.id == product.id);
    if (index == -1) return;

    setState(() => _products.removeAt(index));

    final messenger = ScaffoldMessenger.of(context);
    messenger
      ..clearSnackBars()
      ..showSnackBar(
        SnackBar(
          behavior: SnackBarBehavior.floating,
          content: Text('"${product.title}" removed'),
          action: SnackBarAction(
            label: 'UNDO',
            onPressed: () {
              setState(() {
                final restoreAt =
                    index > _products.length ? _products.length : index;
                _products.insert(restoreAt, product);
              });
            },
          ),
        ),
      );
  }

  void _resetCatalog() {
    setState(() => _products = List.of(buildSeedProducts()));
  }


  Widget _buildListView() {
    return RefreshIndicator(
      onRefresh: _onRefresh,
      child: ListView.separated(
        key: const PageStorageKey('list_view'),
        physics: const AlwaysScrollableScrollPhysics(),
        itemCount: _products.length,
        separatorBuilder: (_, __) => const Divider(height: 1, thickness: 0.5),
        itemBuilder: (context, index) {
          final product = _products[index];
          return Dismissible(
            key: ValueKey(product.id),
            direction: DismissDirection.endToStart,
            background: const DismissBackground(),
            onDismissed: (_) => _onDismissed(product),
            child: ProductListTile(product: product),
          );
        },
      ),
    );
  }

  Widget _buildGridView() {
    return RefreshIndicator(
      onRefresh: _onRefresh,
      child: GridView.builder(
        key: const PageStorageKey('grid_view'),
        physics: const AlwaysScrollableScrollPhysics(),
        padding: const EdgeInsets.all(12),
        itemCount: _products.length,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 12,
          mainAxisSpacing: 12,
          childAspectRatio: 0.72,
        ),
        itemBuilder: (context, index) {
          final product = _products[index];
          return Dismissible(
            key: ValueKey(product.id),
            direction: DismissDirection.endToStart,
            background: const DismissBackground(
              borderRadius: ProductGridCard.radius,
            ),
            onDismissed: (_) => _onDismissed(product),
            child: ProductGridCard(product: product),
          );
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final isList = _mode == ViewMode.list;

    return Scaffold(
      appBar: AppBar(
        title: Text('Smart Catalog (${_products.length})'),
        actions: [
          IconButton(
            tooltip: isList ? 'Switch to Grid' : 'Switch to List',
            icon: Icon(isList ? Icons.grid_view : Icons.view_list),
            onPressed: _toggleMode,
          ),
        ],
      ),
      body: _products.isEmpty
          ? EmptyState(onReset: _resetCatalog)
          : AnimatedSwitcher(
              duration: const Duration(milliseconds: 250),
              child: KeyedSubtree(
                key: ValueKey(_mode),
                child: isList ? _buildListView() : _buildGridView(),
              ),
            ),
    );
  }
}
