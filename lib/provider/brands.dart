import 'package:flutter/cupertino.dart';

class Brand {
  final String id;
  final String title;
  final String image;
  Brand({required this.id, required this.title, required this.image});
}

class Brands with ChangeNotifier {
  final List<Brand> _brandsItem = [
    Brand(id: "1", title: "Nike", image: "nike.png")
  ];

  List<Brand> get brandsItem {
    return [..._brandsItem];
  }
}
