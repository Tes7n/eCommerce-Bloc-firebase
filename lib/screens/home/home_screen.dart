// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:carousel_slider/carousel_slider.dart';
import 'package:ecommerce_bloc/blocs/category/category_bloc.dart';
import 'package:ecommerce_bloc/blocs/product/product_bloc.dart';
import 'package:ecommerce_bloc/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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
                child: BlocBuilder<CategoryBloc, CategoryState>(
                  builder: (context, state) {
                    if (state is CategoryLoading) {
                      return Center(child: CircularProgressIndicator());
                    }
                    if (state is CategoryLoaded) {
                      return CarouselSlider(
                        options: CarouselOptions(
                            aspectRatio: 1.5,
                            viewportFraction: 0.9,
                            enlargeCenterPage: true,
                            enlargeStrategy: CenterPageEnlargeStrategy.height,
                            enableInfiniteScroll: true,
                            initialPage: 2),
                        items: state.categories
                            .map((e) => HeroCarouselCard(category: e))
                            .toList(),
                      );
                    } else {
                      return Center(child: Text('something went wrong!'));
                    }
                  },
                ),
              ),
              SectionTitle(title: 'RECOMMENDED'),
              BlocBuilder<ProductBloc, ProductState>(
                builder: (context, state) {
                  if (state is ProductLoading) {
                    return Center(child: CircularProgressIndicator());
                  }
                  if (state is ProductLoaded) {
                    return ProductCarousel(
                      products: state.products
                          .where((element) => element.isRecommended)
                          .toList(),
                    );
                  } else {
                    return Center(child: Text('something went wrong!'));
                  }
                },
              ),
              SectionTitle(title: 'POPULAR'),
              BlocBuilder<ProductBloc, ProductState>(
                builder: (context, state) {
                  if (state is ProductLoading) {
                    return Center(child: CircularProgressIndicator());
                  }
                  if (state is ProductLoaded) {
                    return ProductCarousel(
                      products: state.products
                          .where((element) => element.isPopular)
                          .toList(),
                    );
                  } else {
                    return Center(child: Text('something went wrong!'));
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
