import 'package:ecommerce_bloc/widgets/widgets.dart';
import 'package:flutter/material.dart';

class WishlistScreen extends StatelessWidget {
  const WishlistScreen({Key? key}) : super(key: key);
  static const String routeName = '/wishlist';
  static Route route() {
    return MaterialPageRoute(
      // ignore: prefer_const_constructors
      settings: RouteSettings(name: routeName),
      // ignore: prefer_const_constructors
      builder: (_) => WishlistScreen(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: 'Wishlist'),
      // ignore: prefer_const_constructors
      bottomNavigationBar: CustomNavBar(),
    );
  }
}
