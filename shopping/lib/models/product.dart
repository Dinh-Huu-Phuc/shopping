class Product {
  final String name;
  final String category;
  final double price;
  final double? oldPrice;
  final String imageUrl;
  final bool isFavorite;
  final String description;



  const Product({
    required this.category,
    required this.description,
    required this.imageUrl,
    required this.name,
    required this.price,
    this.oldPrice,
    this.isFavorite = false,
  });
}
final List<Product> products =[
  const Product(
    name: 'Shoes',
    category: 'Footwear',
    price: 69.00,
    oldPrice: 189.00,
    isFavorite: true,
    imageUrl: 'assets/image/denim_jacket_white.jpg',
    description: 'This is a description of the product 1',
  ),
  const Product(
    name: 'Shoes',
    category: 'Footwear',
    price: 120.00,
    oldPrice: 189.00,
    isFavorite: true,
    imageUrl: 'assets/image/hoodie_classic_gray.jpg',
    description: 'This is a description of the product 2',
  ),
  const Product(
    name: 'Quần',
    category: 'Quần Dài',
    price: 99.00,
    oldPrice: 120.00,
    imageUrl: 'assets/image/wide_leg_pants_white.jpg',
    description: 'This is a description of the product 3',
  ),
  const Product(
    name: 'Áo',
    category: 'Áo trắng',
    price: 100.00,
    oldPrice: 190.00,
    imageUrl: 'assets/image/slim_fit_shirt_white.jpg',
    description: 'This is a description of the product 4',
  ),
  const Product(
    name: 'T-shirt',
    category: 'Footwear',
    price: 299.00,
    oldPrice: 500.00,
    imageUrl: 'assets/image/still-life-rendering-jackets-display.jpg',
    description: 'This is a description of the product 5',
  ),
  const Product(
    name: 'T-shirt',
    category: 'Footwear',
    price: 599.00,
    oldPrice: 1550.00,
    imageUrl: 'assets/image/Screenshot 2025-08-20 204545.png',
    description: 'This is a description of the product 6',
  ),
];