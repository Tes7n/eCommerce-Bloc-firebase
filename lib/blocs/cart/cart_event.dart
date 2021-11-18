part of 'cart_bloc.dart';

abstract class CartEvent extends Equatable {
  const CartEvent();

  @override
  List<Object> get props => [];
}

class CartStarted extends CartEvent {}

class CartProductAdded extends CartEvent {
  final Product product;

  const CartProductAdded({required this.product});
  @override
  List<Object> get props => [product];
}

class CartProductRemoved extends CartEvent {
  final Product product;

  const CartProductRemoved({required this.product});
  @override
  List<Object> get props => [product];
}
