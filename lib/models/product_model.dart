import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';

class Product extends Equatable {
  final String name;
  final String category;
  final String imageUrl;
  final double price;
  final bool isRecommended;
  final bool isPopular;

  // ignore: prefer_const_constructors_in_immutables
  Product(
      {required this.name,
      required this.category,
      required this.imageUrl,
      required this.price,
      required this.isRecommended,
      required this.isPopular});

  // f() to covert Doc.snapshot to Category instance
  static Product fromSnapshot(DocumentSnapshot snap) {
    Product product = Product(
      name: snap['name'],
      imageUrl: snap['imageUrl'],
      category: snap['category'],
      isPopular: snap['isPopular'],
      isRecommended: snap['isRecommended'],
      price: snap['price'],
    );
    return product;
  }

  @override
  List<Object?> get props =>
      [name, category, imageUrl, price, isPopular, isRecommended];

  static List<Product> products = [
    Product(
        name: 'Drink1',
        category: 'Soft Drink',
        imageUrl:
            'https://images.unsplash.com/photo-1559019736-dcf2caefe954?ixid=MnwxMjA3fDB8MHxzZWFyY2h8MTh8fGNhbnxlbnwwfHwwfHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=500&q=60',
        price: 2.99,
        isRecommended: true,
        isPopular: true),
    Product(
        name: 'Drink2',
        category: 'Soft Drink',
        imageUrl:
            'https://images.unsplash.com/photo-1586401003307-f0c6b1e65c41?ixid=MnwxMjA3fDB8MHxzZWFyY2h8MTJ8fGNhbnxlbnwwfHwwfHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=500&q=60',
        price: 2.19,
        isRecommended: true,
        isPopular: false),
    Product(
        name: 'Drink3',
        category: 'Soft Drink',
        imageUrl:
            'https://images.unsplash.com/photo-1531384370597-8590413be50a?ixid=MnwxMjA3fDB8MHxzZWFyY2h8N3x8Y2FufGVufDB8fDB8fA%3D%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=500&q=60',
        price: 1.98,
        isRecommended: true,
        isPopular: true),
    Product(
        name: 'Drink4',
        category: 'Smoothies',
        imageUrl:
            'https://images.unsplash.com/photo-1553530666-ba11a7da3888?ixid=MnwxMjA3fDB8MHxzZWFyY2h8Mnx8c21vb3RoaWV8ZW58MHx8MHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=500&q=60',
        price: 2.99,
        isRecommended: true,
        isPopular: false),
    Product(
        name: 'Drink5',
        category: 'Smoothies',
        imageUrl:
            'https://images.unsplash.com/photo-1610970881699-44a5587cabec?ixid=MnwxMjA3fDB8MHxzZWFyY2h8MTh8fHNtb290aGllfGVufDB8fDB8fA%3D%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=500&q=60',
        price: 2.19,
        isRecommended: true,
        isPopular: true),
  ];
}
