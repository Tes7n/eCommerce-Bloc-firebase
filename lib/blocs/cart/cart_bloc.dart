import 'package:bloc/bloc.dart';
import 'package:ecommerce_bloc/models/cart_model.dart';
import 'package:ecommerce_bloc/models/product_model.dart';
import 'package:equatable/equatable.dart';

part 'cart_event.dart';
part 'cart_state.dart';

class CartBloc extends Bloc<CartEvent, CartState> {
  CartBloc() : super(CartLoading()) {
    on<CartStarted>((event, emit) async {
      emit(CartLoading());
      try {
        await Future<void>.delayed(const Duration(seconds: 1));
        emit(const CartLoaded());
      } catch (_) {}
    });
    on<CartProductAdded>((event, emit) async {
      try {
        emit(
          CartLoaded(
            cart: Cart(
              products: List.from((state as CartLoaded).cart.products)
                ..add(event.product),
            ),
          ),
        );
      } catch (_) {}
    });
    on<CartProductRemoved>((event, emit) async {
      try {
        emit(
          CartLoaded(
            cart: Cart(
              products: List.from((state as CartLoaded).cart.products)
                ..remove(event.product),
            ),
          ),
        );
      } catch (_) {}
    });
  }
}
