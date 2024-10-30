import 'package:flutter/material.dart';
import 'package:project1/widget/appbar.dart';
import 'package:provider/provider.dart';
import '../provider/categories.dart';
import '../widget/category_item.dart';

class SubCategoriesScreen extends StatelessWidget {
  const SubCategoriesScreen(
      {super.key, required this.title, required this.xcategories});
  final List xcategories;
  final String title;
  @override
  Widget build(BuildContext context) {
    final categories = Provider.of<Categories>(context);
    final subCategoriesItems = categories.subCategoriesItems;

    final subcategories = xcategories
        .where((element) => element.maincategorytitle == title)
        .toList();
    return MyAppBar(
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        child: GridView.builder(
          itemCount: subcategories.length,
          itemBuilder: (ctx, index) => CategoryItem(
              X: SubCategoriesScreen(
                title: subcategories[index].title,
                xcategories: subCategoriesItems,
              ),
              id: subcategories[index].id,
              title: subcategories[index].title,
              image: subcategories[index].image),
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              childAspectRatio: 2 / 3,
              mainAxisSpacing: 10,
              crossAxisSpacing: 10),
        ),
      ),
    );
  }
}
