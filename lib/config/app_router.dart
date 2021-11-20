import 'package:ecommerce_bloc/models/category_model.dart';
import 'package:ecommerce_bloc/models/models.dart';
import 'package:ecommerce_bloc/screens/checkout/checkout_screen.dart';
import 'package:ecommerce_bloc/screens/screens.dart';
import 'package:flutter/material.dart';

class AppRouter {
  static Route onGenerateRoute(RouteSettings routeSettings) {
    // ignore: avoid_print
    print('This is route: ${routeSettings.name}');
    switch (routeSettings.name) {
      case HomeScreen.routeName:
        return HomeScreen.route();

      case CartScreen.routeName:
        return CartScreen.route();

      case CatalogScreen.routeName:
        return CatalogScreen.route(
            category: routeSettings.arguments as Category);

      case ProductScreen.routeName:
        return ProductScreen.route(product: routeSettings.arguments as Product);

      case WishlistScreen.routeName:
        return WishlistScreen.route();

      case CheckoutScreen.routeName:
        return CheckoutScreen.route();

      default:
        return _errorRoute();
    }
  }

  static Route _errorRoute() {
    return MaterialPageRoute(
      // ignore: prefer_const_constructors
      settings: RouteSettings(name: "error"),
      // ignore: prefer_const_constructors
      builder: (_) => Scaffold(
        appBar: AppBar(
          // ignore: prefer_const_constructors
          title: Text('Error'),
        ),
      ),
    );
  }
}
