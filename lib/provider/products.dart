import 'dart:math';

import 'package:flutter/material.dart';
import 'package:project1/provider/product.dart';

class Products with ChangeNotifier {
  final List<Product> _productsItem = [
    Product(
        quantity: 5,
        informations: "kkkkkkkkkkkkkkkkkkkkkk",
        id: "1",
        title: "title",
        price: 15.31,
        image: "1.jpg",
        categoryTitle: "Watches",
        brandTitle: ""),
    Product(
        quantity: 8,
        informations: "kkkkkkkkkkkkkkkkkkkkkk",
        id: "2",
        title: "title",
        price: 19.45,
        image: "2.jpg",
        categoryTitle: "Watches",
        brandTitle: ""),
    Product(
        quantity: 11,
        informations:
            "kkkkkkkkkkkkkkkkkkkkkk \n kkkkkkkkkkkkkkkkkk \n kkkkkkkkk",
        id: "3",
        title: "Brown watch",
        price: 25.76,
        image: "3.jpg",
        categoryTitle: "Watches",
        brandTitle: "Nike"),
  ];

  final List<Product> _pointtsProductsItem = [
    Product(
        quantity: 0,
        informations: "kkkkkkkkkkkkkkkkkkkkkk",
        id: "1",
        title: "title",
        price: 0.31,
        image: "1.jpg",
        categoryTitle: "Watches",
        brandTitle: ""),
    Product(
        quantity: 0,
        informations: "kkkkkkkkkkkkkkkkkkkkkk",
        id: "2",
        title: "title",
        price: 0.45,
        image: "2.jpg",
        categoryTitle: "Watches",
        brandTitle: ""),
    Product(
        quantity: 0,
        informations:
            "kkkkkkkkkkkkkkkkkkkkkk \n kkkkkkkkkkkkkkkkkk \n kkkkkkkkk",
        id: "3",
        title: "Brown watch",
        price: 0.76,
        image: "3.jpg",
        categoryTitle: "Watches",
        brandTitle: "Nike"),
  ];
  final random = Random();

  List<Product> get randomProducts {
    final selectedItems = List<Product>.generate(
      2,
      (index) => _productsItem[random.nextInt(_productsItem.length)],
    );
    return selectedItems;
  }

  List<Product> get productsItems {
    return [..._productsItem];
  }

  List<Product> get pointtsProductsItem {
    return [..._pointtsProductsItem];
  }

  void removeProduct(String id) {
    _productsItem.removeWhere(
      (element) => element.id == id,
    );
    notifyListeners();
  }

  void removeQuantity(String id) {
    for (var element in _productsItem) {
      if (element.id == id) element.quantity -= 1;
    }
  }

  void addQuantity(String id, int q) {
    for (var element in _productsItem) {
      if (element.id == id) element.quantity += q;
    }
  }

  void addSingleQuantity(String id) {
    for (var element in _productsItem) {
      if (element.id == id) element.quantity += 1;
    }
  }

  // void removeQuantityt(String id, int z, int quantity) {
  //   _productsItem.where(
  //     (element) {
  //       if (element.id == id) {
  //         element.quantity -= z;
  //         return ;
  //       }
  //     },
  //   );

  //   notifyListeners();
  // }

  List<Product> searchProducts(String query) {
    return _productsItem
        .where((element) => element.title.contains(query))
        .toList();
  }

  List<Product> get favoriteProductsItem {
    return [..._productsItem.where((element) => element.isFavorite == true)];
  }

  void addProduct(Product prod) {
    final newProduct = Product(
        title: prod.title,
        brandTitle: prod.brandTitle,
        categoryTitle: prod.categoryTitle,
        id: DateTime.now().toString(),
        image: prod.image,
        informations: prod.informations,
        price: prod.price,
        quantity: prod.quantity);
    _productsItem.add(newProduct);
    notifyListeners();
  }

  final List<Product> addedProducts = [];

  List<Product> get added {
    return [...addedProducts];
  }

  void addPro(
      String title, double price, int quantity, String desc, String image) {
    Product nepr = Product(
        quantity: quantity,
        id: DateTime.now().toString(),
        title: title,
        price: price,
        image: image,
        categoryTitle: "Watches",
        informations: desc,
        brandTitle: "brandTitle");
    added.add(nepr);
    notifyListeners();
  }
}
