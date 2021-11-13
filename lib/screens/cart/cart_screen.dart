import 'package:ecommerce_bloc/widgets/widgets.dart';
import 'package:flutter/material.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({Key? key}) : super(key: key);
  static const String routeName = '/cart';
  static Route route() {
    return MaterialPageRoute(
      // ignore: prefer_const_constructors
      settings: RouteSettings(name: routeName),
      // ignore: prefer_const_constructors
      builder: (_) => CartScreen(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: 'Cart'),
      // ignore: prefer_const_constructors
      bottomNavigationBar: CustomNavBar(),
    );
  }
}
