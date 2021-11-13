import 'package:ecommerce_bloc/widgets/widgets.dart';
import 'package:flutter/material.dart';

class CatalogScreen extends StatelessWidget {
  const CatalogScreen({Key? key}) : super(key: key);
  static const String routeName = '/catalog';
  static Route route() {
    return MaterialPageRoute(
      // ignore: prefer_const_constructors
      settings: RouteSettings(name: routeName),
      // ignore: prefer_const_constructors
      builder: (_) => CatalogScreen(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: 'Catalog'),
      // ignore: prefer_const_constructors
      bottomNavigationBar: CustomNavBar(),
    );
  }
}
