import 'package:equatable/equatable.dart';

class Product extends Equatable {
  final String name;
  final String category;
  final String imageUrl;
  final double price;
  final bool isRecommended;
  final bool isPopular;

  Product(
      {required this.name,
      required this.category,
      required this.imageUrl,
      required this.price,
      required this.isRecommended,
      required this.isPopular});

  @override
  List<Object?> get props =>
      [name, category, imageUrl, price, isPopular, isRecommended];

  static List<Product> products = [
    Product(
        name: 'Drink1',
        category: 'Soft Drink',
        imageUrl:
            'https://media.istockphoto.com/photos/coke-picture-id458464735?k=20&m=458464735&s=612x612&w=0&h=CW8rzEiIMvuO23X9I3b6U_g2aBUQSZnWYLjWauLMxtg=',
        price: 2.99,
        isRecommended: true,
        isPopular: false),
    Product(
        name: 'Drink2',
        category: 'Soft Drink',
        imageUrl:
            'https://media.istockphoto.com/photos/pepsi-can-with-water-droplets-picture-id459396911?k=20&m=459396911&s=612x612&w=0&h=aI3BywjC-1zg09TfLaoqLVvZbjsAuTEGTzhJ5sCreoY=',
        price: 2.19,
        isRecommended: true,
        isPopular: false),
    Product(
        name: 'Drink3',
        category: 'Soft Drink',
        imageUrl:
            'https://media.istockphoto.com/vectors/template-design-for-orange-cola-aluminum-can-vector-id846279482?k=20&m=846279482&s=612x612&w=0&h=xbIovxxHGNlzYZt7BiF_v__Uk1Q27kR0rbNz-AQrUY4=',
        price: 1.98,
        isRecommended: false,
        isPopular: true),
    Product(
        name: 'Drink4',
        category: 'Smoothies',
        imageUrl:
            'https://media.istockphoto.com/photos/glass-of-blueberry-milkshake-or-cocktail-picture-id673492292?k=20&m=673492292&s=612x612&w=0&h=2ONm-OSJg3zxr-Qew_1eMMolqQ9bmrsyn2HVXQ1n6u0=',
        price: 2.99,
        isRecommended: true,
        isPopular: false),
    Product(
        name: 'Drink5',
        category: 'Smoothies',
        imageUrl:
            'https://media.istockphoto.com/photos/glass-of-kiwi-smoothie-picture-id1046212566?k=20&m=1046212566&s=612x612&w=0&h=Y5xsZS2Fk84RLLpvGU5049Rf0YprPTGC3uQ4uo2QsxM=',
        price: 2.19,
        isRecommended: false,
        isPopular: true),
  ];
}
