import 'package:flutter/cupertino.dart';

class Product with ChangeNotifier {
  late final String id;
  final String title;
  final double price;
  final String image;
  bool isFavorite;
  final String categoryTitle;
  final String informations;
  final String brandTitle;
  int quantity;

  Product(
      {required this.quantity,
      required this.id,
      required this.title,
      required this.price,
      required this.image,
      this.isFavorite = false,
      required this.categoryTitle,
      required this.informations,
      required this.brandTitle});

  void changeFav() {
    isFavorite = !isFavorite;
    notifyListeners();
  }
}
