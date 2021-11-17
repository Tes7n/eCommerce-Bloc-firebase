import 'package:ecommerce_bloc/models/product_model.dart';
import 'package:equatable/equatable.dart';

class Cart extends Equatable {
  Cart();

  double deliveryFee(subtotal) {
    if (subtotal >= 30.0) {
      return 0;
    } else {
      return 10.0;
    }
  }

  double total(subtotal, deliveryFee) {
    return subtotal + deliveryFee;
  }

  String freeDelivery(subtotal) {
    if (subtotal >= 30.0) {
      return 'You have FREE Delivery!';
    } else {
      double missing = 30.0 - subtotal;
      return 'Add \$${missing.toStringAsFixed(2)} for FREE Delivery!';
    }
  }

  double get subtotal => products.fold(
      0, (previousValue, element) => previousValue + element.price);
  String get subtotalString => subtotal.toStringAsFixed(2);

  String get deliveryFeeString => deliveryFee(subtotal).toStringAsFixed(2);
  String get totalString =>
      total(subtotal, deliveryFee(subtotal)).toStringAsFixed(2);
  String get freeDeliveryString => freeDelivery(subtotal);

  List<Product> products = [
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

  @override
  List<Object?> get props => [];
}
