import 'package:flutter/material.dart';
import 'package:project1/screen/admin_sub_categories_screen.dart';
import 'package:project1/widget/admin_category_item.dart';
import 'package:provider/provider.dart';

import '../provider/categories.dart';

class AdminCategoriesScreen extends StatelessWidget {
  const AdminCategoriesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final categories = Provider.of<Categories>(context);
    final mainCategories = categories.mainCategoriesItems;
    final subCategories = categories.subCategoriesItems;
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 209, 232, 241),
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 63, 124, 155),
        actions: [
          IconButton(
            onPressed: () {
              // Navigator.of(context).push(
              //   MaterialPageRoute(
              //     builder: (ctx) => const EditProductScreen(),
              //
              // ),
              // );
            },
            icon: const Icon(Icons.add),
          ),
        ],
        title: const Text("Your Categories"),
      ),
      body: Container(
        height: 700,
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        child: ListView.builder(
          itemCount: mainCategories.length,
          itemBuilder: (ctx, index) => AdminCategoriesItem(
              X: AdminSubCategoriesScreen(
                  xcategories: subCategories,
                  title: mainCategories[index].title),
              id: mainCategories[index].id,
              title: mainCategories[index].title,
              image: mainCategories[index].image),
        ),
      ),
    );
  }
}
