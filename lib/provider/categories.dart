import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:project1/model/category.dart';

class Categories with ChangeNotifier {
  final List<Category> _mainCategoriesItem = [
    Category(id: "1", title: "Clothes", image: "clothes.jpg"),
    Category(id: "2", title: "Plants", image: "plants.jpg"),
    Category(id: "3", title: "Food", image: "food.jpg"),
    Category(id: "4", title: "Toys", image: "toys.jpg"),
    Category(id: "5", title: "Makeup", image: "makeup.jpg"),
    Category(id: "6", title: "Tools", image: "tools.jpg"),
  ];

  final List<SubCategory> _subCategoriesItem = [
    SubCategory(
        id: "11",
        title: "Kids",
        image: "kids.jpg",
        maincategorytitle: 'Clothes'),
    SubCategory(
        id: "12", title: "Men", image: "men.jpg", maincategorytitle: 'Clothes'),
    SubCategory(
        id: "13",
        title: "Women",
        image: "women.jpg",
        maincategorytitle: 'Clothes'),
    SubCategory(
        id: "111",
        title: "Jeans",
        image: "jeans.jpeg",
        maincategorytitle: 'Men'),
    SubCategory(
        id: "112",
        title: "Shoes",
        image: "shoes.jpeg",
        maincategorytitle: 'Men'),
    SubCategory(
        id: "113",
        title: "Watches",
        image: "watches.jpg",
        maincategorytitle: 'Men'),
    SubCategory(
        id: "114",
        title: "Shirts",
        image: "shirts.jpg",
        maincategorytitle: 'Men'),
  ];

  List<Category> get subCategoriesItems {
    return [..._subCategoriesItem];
  }

  final random = Random();

  List<SubCategory> get randomcategories {
    final selectedItems = List<SubCategory>.generate(
      5,
      (index) => _subCategoriesItem[random.nextInt(_subCategoriesItem.length)],
    );
    return selectedItems;
  }

  void removemaincategory(String id) {
    _mainCategoriesItem.removeWhere((element) => element.id == id);
    notifyListeners();
  }

  void removesubcategory(String id) {
    _subCategoriesItem.removeWhere((element) => element.id == id);
    notifyListeners();
  }

  List<Category> get mainCategoriesItems {
    return [..._mainCategoriesItem];
  }
}
