import 'package:flutter/material.dart';
import 'package:project1/screen/sub_categories_screen.dart';
import 'package:project1/widget/category_item.dart';
import 'package:provider/provider.dart';

import '../provider/categories.dart';

class CategoriesScreen extends StatefulWidget {
  const CategoriesScreen({super.key});

  @override
  State<CategoriesScreen> createState() => _CategoriesScreenState();
}

class _CategoriesScreenState extends State<CategoriesScreen> {
  @override
  Widget build(BuildContext context) {
    final categories = Provider.of<Categories>(context);
    final mainCategories = categories.mainCategoriesItems;
    final subCategories = categories.subCategoriesItems;

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      child: GridView.builder(
        itemCount: mainCategories.length,
        itemBuilder: (ctx, index) => CategoryItem(
            X: SubCategoriesScreen(
                xcategories: subCategories, title: mainCategories[index].title),
            id: mainCategories[index].id,
            title: mainCategories[index].title,
            image: mainCategories[index].image),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            childAspectRatio: 2 / 3,
            mainAxisSpacing: 10,
            crossAxisSpacing: 10),
      ),
    );
  }
}
