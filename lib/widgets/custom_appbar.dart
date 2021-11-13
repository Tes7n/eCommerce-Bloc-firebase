// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget with PreferredSizeWidget {
  final String title;
  CustomAppBar({
    Key? key,
    required this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.transparent,
      elevation: 0,
      title: Container(
        color: Colors.black,
        padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
        child: Text(title,
            style: Theme.of(context)
                .textTheme
                .headline6!
                .copyWith(color: Colors.white)),
      ),
      iconTheme: IconThemeData(color: Colors.black),
      actions: [
        IconButton(
          onPressed: () {
            Navigator.pushNamed(context, '/wishlist');
          },
          icon: Icon(Icons.favorite),
        ),
      ],
      centerTitle: true,
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(50.0);
}
