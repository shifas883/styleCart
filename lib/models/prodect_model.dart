class Product {
  final int id;
  final String title;
  final double price;
  final String image;
  int quantity;
  final String description;
  final String category;

  Product({
    required this.id,
    required this.title,
    required this.price,
    required this.image,
    this.quantity = 1,
    required this.description,
    required this.category,
  });

  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      id: json['id'],
      quantity: json['quantity'] ?? 1,
      category: json['category'],
      title: json['title'],
      price: json['price'].toDouble(),
      image: json['image'],
      description: json['description'],
    );
  }
}
