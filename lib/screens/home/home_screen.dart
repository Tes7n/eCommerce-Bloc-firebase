// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:carousel_slider/carousel_slider.dart';
import 'package:ecommerce_bloc/models/category_model.dart';
import 'package:ecommerce_bloc/models/models.dart';
import 'package:ecommerce_bloc/widgets/widgets.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);
  static const String routeName = '/';
  static Route route() {
    return MaterialPageRoute(
      settings: RouteSettings(name: routeName),
      builder: (_) => HomeScreen(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: 'Zero To Unicorn'),
      bottomNavigationBar: CustomNavBar(),
      // ignore: avoid_unnecessary_containers
      body: SingleChildScrollView(
        // ignore: avoid_unnecessary_containers
        child: Container(
          child: Column(
            children: [
              // ignore: avoid_unnecessary_containers
              Container(
                child: CarouselSlider(
                  options: CarouselOptions(
                      aspectRatio: 1.5,
                      viewportFraction: 0.9,
                      enlargeCenterPage: true,
                      enlargeStrategy: CenterPageEnlargeStrategy.height,
                      enableInfiniteScroll: true,
                      initialPage: 2),
                  items: Category.category
                      .map((e) => HeroCarouselCard(category: e))
                      .toList(),
                ),
              ),
              SectionTitle(title: 'RECOMMENDED'),
              ProductCarousel(
                products: Product.products
                    .where((element) => element.isRecommended)
                    .toList(),
              ),
              SectionTitle(title: 'POPULAR'),
              ProductCarousel(
                products: Product.products
                    .where((element) => element.isPopular)
                    .toList(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
