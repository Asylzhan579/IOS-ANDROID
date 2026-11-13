class Product {
  final int id;
  final String title;
  final double price;
  final String description;
  final String category;
  final String imageUrl;
  final double rating;
  final int reviewCount;

  const Product({
    required this.id,
    required this.title,
    required this.price,
    required this.description,
    required this.category,
    required this.imageUrl,
    required this.rating,
    required this.reviewCount,
  });

  List<String> get gallery => [imageUrl, imageUrl, imageUrl];

  String get deepLink => 'narxoz://store/product/$id';

  factory Product.fromJson(Map<String, dynamic> json) {
    final rating = (json['rating'] as Map<String, dynamic>?) ?? const {};
    return Product(
      id: (json['id'] as num?)?.toInt() ?? 0,
      title: (json['title'] as String?) ?? 'No title',
      price: ((json['price'] as num?) ?? 0).toDouble(),
      description: (json['description'] as String?) ?? '',
      category: (json['category'] as String?) ?? 'unknown',
      imageUrl: (json['image'] as String?) ?? '',
      rating: ((rating['rate'] as num?) ?? 0).toDouble(),
      reviewCount: ((rating['count'] as num?) ?? 0).toInt(),
    );
  }
}
