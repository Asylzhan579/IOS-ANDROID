import '../models/product.dart';

const List<Product> products = [
  Product(
    id: 1,
    title: 'Wireless Headphones',
    description:
        'Over-ear headphones with active noise cancellation, 30 hours of battery life and fast USB-C charging.',
    imageUrl: 'https://picsum.photos/id/1/600/400',
    price: 129.99,
    category: 'Electronics',
  ),
  Product(
    id: 2,
    title: 'Smart Watch',
    description:
        'Fitness tracker with heart-rate monitor, GPS, sleep tracking and a bright AMOLED display.',
    imageUrl: 'https://picsum.photos/id/26/600/400',
    price: 199.50,
    category: 'Wearables',
  ),
  Product(
    id: 3,
    title: 'Leather Backpack',
    description:
        'Handmade genuine leather backpack with a padded 15" laptop compartment and water-resistant lining.',
    imageUrl: 'https://picsum.photos/id/20/600/400',
    price: 89.00,
    category: 'Accessories',
  ),
  Product(
    id: 4,
    title: 'Mechanical Keyboard',
    description:
        'Compact 75% mechanical keyboard with hot-swappable switches, RGB backlight and Bluetooth 5.0.',
    imageUrl: 'https://picsum.photos/id/180/600/400',
    price: 74.90,
    category: 'Electronics',
  ),
];
