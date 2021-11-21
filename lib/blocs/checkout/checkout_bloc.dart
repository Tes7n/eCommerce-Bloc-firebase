import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:ecommerce_bloc/blocs/cart/cart_bloc.dart';
import 'package:ecommerce_bloc/models/models.dart';
import 'package:ecommerce_bloc/repositories/checkout/checkout_repository.dart';
import 'package:equatable/equatable.dart';

part 'checkout_event.dart';
part 'checkout_state.dart';

class CheckoutBloc extends Bloc<CheckoutEvent, CheckoutState> {
  // ignore: unused_field
  final CartBloc _cartBloc;
  final CheckoutRepository _checkoutRepository;
  // ignore: unused_field
  StreamSubscription? _cartSubscription;
  StreamSubscription? _checkoutSubscription;
  CheckoutBloc(
      {required CartBloc cartBloc,
      required CheckoutRepository checkoutRepository})
      : _cartBloc = cartBloc,
        _checkoutRepository = checkoutRepository,
        super(cartBloc.state is CartLoaded
            ? CheckoutLoaded(
                products: (cartBloc.state as CartLoaded).cart.products,
                deliveryFee:
                    (cartBloc.state as CartLoaded).cart.deliveryFeeString,
                subtotal: (cartBloc.state as CartLoaded).cart.subtotalString,
                total: (cartBloc.state as CartLoaded).cart.totalString)
            : CheckoutLoading()) {
    _cartSubscription = cartBloc.stream.listen((state) {
      if (state is CartLoaded) {
        add(UpdateCheckout(cart: state.cart));
      }
    });

    on<UpdateCheckout>((event, emit) {
      emit(CheckoutLoaded(
        email: event.email ?? (state as CheckoutLoaded).email,
        fullName: event.fullName ?? (state as CheckoutLoaded).fullName,
        products: event.cart?.products ?? (state as CheckoutLoaded).products,
        deliveryFee: event.cart?.deliveryFeeString ??
            (state as CheckoutLoaded).deliveryFee,
        subtotal:
            event.cart?.subtotalString ?? (state as CheckoutLoaded).subtotal,
        total: event.cart?.totalString ?? (state as CheckoutLoaded).total,
        address: event.address ?? (state as CheckoutLoaded).address,
        city: event.city ?? (state as CheckoutLoaded).city,
        country: event.country ?? (state as CheckoutLoaded).country,
        zipCode: event.zipCode ?? (state as CheckoutLoaded).zipCode,
      ));
    });

    on<ConfirmCheckout>((event, emit) async {
      _checkoutSubscription?.cancel();
      try {
        await _checkoutRepository.addCheckout(event.checkout);
        // ignore: avoid_print
        print('Done');
        emit(CheckoutLoading());
      } catch (_) {}
    });
  }
}
