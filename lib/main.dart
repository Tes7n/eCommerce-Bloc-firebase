import 'package:ecommerce_bloc/config/app_router.dart';
import 'package:ecommerce_bloc/config/theme.dart';
import 'package:flutter/material.dart';
import 'screens/screens.dart';

void main() {
  runApp(
    MyApp(),
  );
}

// ignore: use_key_in_widget_constructors
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Zero To Unicorn',
      theme: theme(),
      onGenerateRoute: AppRouter.onGenerateRoute,
      initialRoute: HomeScreen.routeName,
    );
  }
}
