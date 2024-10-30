import 'package:flutter/material.dart';
import 'package:project1/widget/admin_sub_category_item.dart';
import 'package:provider/provider.dart';

import '../provider/categories.dart';

class AdminSubCategoriesScreen extends StatelessWidget {
  const AdminSubCategoriesScreen(
      {super.key, required this.xcategories, required this.title});
  final List xcategories;
  final String title;

  @override
  Widget build(BuildContext context) {
    final categories = Provider.of<Categories>(context);
    final subCategoriesItems = categories.subCategoriesItems;

    final subcategories = xcategories
        .where((element) => element.maincategorytitle == title)
        .toList();

    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 209, 232, 241),
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 63, 124, 155),
        title: const Text("Sub"),
      ),
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        child: ListView.builder(
          itemCount: subcategories.length,
          itemBuilder: (ctx, index) => AdminSubCategoriesItem(
              X: AdminSubCategoriesScreen(
                title: subcategories[index].title,
                xcategories: subCategoriesItems,
              ),
              id: subcategories[index].id,
              title: subcategories[index].title,
              image: subcategories[index].image),
        ),
      ),
    );
  }
}
