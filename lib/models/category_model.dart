import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';

class Category extends Equatable {
  final String name;
  final String imageUrl;

  // ignore: prefer_const_constructors_in_immutables
  Category({required this.name, required this.imageUrl});

  // f() to covert Doc.snapshot to Category instance
  static Category fromSnapshot(DocumentSnapshot snap) {
    Category category = Category(
      name: snap['name'],
      imageUrl: snap['imageUrl'],
    );
    return category;
  }

  @override
  List<Object?> get props => [name, imageUrl];

  static List<Category> category = [
    Category(
        name: 'Soft Drink',
        imageUrl:
            'https://media.istockphoto.com/photos/cola-with-a-large-splash-isolated-on-blue-picture-id157476159?b=1&k=20&m=157476159&s=170667a&w=0&h=8ErZIAVchr5TQ55x_sHWIfl34NtivmOr96tr72u0w7U='),
    Category(
        name: 'Smoothies',
        imageUrl:
            'https://media.istockphoto.com/photos/pumpkin-pie-smoothie-with-cinnamon-in-mason-jar-picture-id853394934?b=1&k=20&m=853394934&s=170667a&w=0&h=JaPcp9Ir4jswYPAObXF-Ipc13YhhZ9syOUX92JUZvt8='),
    Category(
        name: 'Water',
        imageUrl:
            'https://media.istockphoto.com/photos/detox-picture-id1302149011?b=1&k=20&m=1302149011&s=170667a&w=0&h=ELYUBrE20daxm1zwIG6lvxKCxorS78qO6O2b61-Y_fU='),
  ];
}
