import 'package:ecommerce_bloc/blocs/blocs.dart';
import 'package:ecommerce_bloc/models/models.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProductCard extends StatelessWidget {
  final Product product;
  final double widthFactor;
  final double leftPosition;
  final bool isWishlist;
  const ProductCard({
    Key? key,
    required this.product,
    this.widthFactor = 2.5,
    this.leftPosition = 5,
    this.isWishlist = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final double widthValue = MediaQuery.of(context).size.width / widthFactor;
    return InkWell(
      onTap: () {
        Navigator.pushNamed(
          context,
          '/product',
          arguments: product,
        );
      },
      child: Stack(
        children: [
          SizedBox(
            width: widthValue,
            height: 150,
            child: Image.network(
              product.imageUrl,
              fit: BoxFit.cover,
            ),
          ),
          Positioned(
            bottom: 1,
            left: leftPosition,
            child: Container(
              width: widthValue - leftPosition,
              height: 60,
              decoration: BoxDecoration(
                color: Colors.black.withAlpha(50),
              ),
            ),
          ),
          Positioned(
            bottom: 1,
            left: leftPosition + 5,
            child: Container(
              width: widthValue - 10 - leftPosition,
              height: 50,
              decoration: const BoxDecoration(
                color: Colors.black,
              ),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    Expanded(
                      flex: 3,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            product.name,
                            style: Theme.of(context)
                                .textTheme
                                .headline5!
                                .copyWith(color: Colors.white),
                          ),
                          const SizedBox(
                            height: 2,
                          ),
                          Text(
                            '\$${product.price}',
                            style: Theme.of(context)
                                .textTheme
                                .headline6!
                                .copyWith(color: Colors.white),
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                      child: IconButton(
                        onPressed: () {},
                        icon: const Icon(
                          Icons.add_circle,
                          color: Colors.white,
                        ),
                      ),
                    ),
                    isWishlist
                        ? BlocBuilder<WishlistBloc, WishlistState>(
                            builder: (context, state) {
                              return IconButton(
                                onPressed: () {
                                  context.read<WishlistBloc>().add(
                                      RemoveWishlistProduct(product: product));
                                  // ignore: prefer_const_declarations
                                  final snackBar = const SnackBar(
                                      content: Text(
                                          'Product removed from your wishlist!'));
                                  ScaffoldMessenger.of(context)
                                      .showSnackBar(snackBar);
                                },
                                icon: const Icon(
                                  Icons.delete,
                                  color: Colors.white,
                                ),
                              );
                            },
                          )
                        : const SizedBox(),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
