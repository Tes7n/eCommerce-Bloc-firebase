import 'package:ecommerce_bloc/models/product_model.dart';
import 'package:ecommerce_bloc/models/wishlist_model.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'wishlist_event.dart';
part 'wishlist_state.dart';

class WishlistBloc extends Bloc<WishlistEvent, WishlistState> {
  WishlistBloc() : super(WishlistLoading()) {
    on<StartWishlist>((event, emit) async {
      emit(WishlistLoading());
      try {
        await Future<void>.delayed(const Duration(seconds: 1));
        emit(const WishlistLoaded());
      } catch (_) {}
    });
    on<AddWishlistProduct>((event, emit) {
      if (state is WishlistLoaded) {
        try {
          emit(WishlistLoaded(
              wishlist: Wishlist(
                  products:
                      List.from((state as WishlistLoaded).wishlist.products)
                        ..add(event.product))));
        } catch (_) {}
      }
    });
    on<RemoveWishlistProduct>((event, emit) {
      if (state is WishlistLoaded) {
        try {
          emit(WishlistLoaded(
              wishlist: Wishlist(
                  products:
                      List.from((state as WishlistLoaded).wishlist.products)
                        ..remove(event.product))));
        } catch (_) {}
      }
    });
  }
}
