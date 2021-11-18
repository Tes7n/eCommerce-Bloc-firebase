import 'package:ecommerce_bloc/blocs/wishlist/wishlist_bloc.dart';
import 'package:ecommerce_bloc/config/app_router.dart';
import 'package:ecommerce_bloc/config/theme.dart';
import 'package:flutter/material.dart';
import 'blocs/blocs.dart';
import 'screens/screens.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(
    MyApp(),
  );
}

// ignore: use_key_in_widget_constructors
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (_) => WishlistBloc()..add(StartWishlist()),
        ),
      ],
      child: MaterialApp(
        title: 'Zero To Unicorn',
        theme: theme(),
        onGenerateRoute: AppRouter.onGenerateRoute,
        initialRoute: HomeScreen.routeName,
      ),
    );
  }
}
