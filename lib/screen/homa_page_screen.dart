import 'package:flutter/material.dart';
import 'package:project1/provider/categories.dart';
import 'package:project1/provider/colors.dart';
import 'package:project1/provider/products.dart';
import 'package:project1/screen/sub_categories_screen.dart';
import 'package:project1/widget/category_item.dart';
import 'package:provider/provider.dart';

import '../widget/product_item.dart';

class HomePageScreen extends StatefulWidget {
  const HomePageScreen({super.key});

  @override
  State<HomePageScreen> createState() => _HomePageScreenState();
}

class _HomePageScreenState extends State<HomePageScreen> {
  @override
  Widget build(BuildContext context) {
    final products = Provider.of<Products>(context);
    final colors = Provider.of<MyColors>(context);
    final randomProducts = products.randomProducts;
    final categories = Provider.of<Categories>(context);
    final randomCategories = categories.randomcategories;
    final subcategories = categories.subCategoriesItems;
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 13, vertical: 10),
      child: SingleChildScrollView(
        child: Column(
          children: [
            Text(
              "Offers",
              style: TextStyle(color: colors.textColor, fontSize: 20),
            ),
            const SizedBox(
              height: 5,
            ),
            SizedBox(
              height: 300,
              child: GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 1,
                    childAspectRatio: 1.3,
                    mainAxisSpacing: 20,
                    crossAxisSpacing: 20),
                itemCount: randomProducts.length,
                itemBuilder: (context, index) => ChangeNotifierProvider.value(
                  value: randomProducts[index],
                  child:  ProductItem(poroductId: randomProducts[index].id),
                ),
              ),
            ),
            const Divider(),
            // const ClipRRect(
            //   child: Image(
            //     fit: BoxFit.fill,
            //     height: 300,
            //     width: double.infinity,
            //     image: AssetImage("assets/logo.jpg"),
            //   ),
            // ),
            // const SizedBox(
            //   height: 10,
            // ),
            Text(
              "Recommended Products",
              style: TextStyle(color: colors.textColor, fontSize: 20),
            ),
            const SizedBox(
              height: 5,
            ),
            SizedBox(
              height: 300,
              child: GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 1,
                    childAspectRatio: 1.3,
                    mainAxisSpacing: 20,
                    crossAxisSpacing: 20),
                itemCount: randomProducts.length,
                itemBuilder: (context, index) => ChangeNotifierProvider.value(
                  value: randomProducts[index],
                  child:  ProductItem(poroductId: randomProducts[index].id),
                ),
              ),
            ),
            const Divider(),
            Text(
              "Recommended Categoris",
              style: TextStyle(color: colors.textColor, fontSize: 20),
            ),
            const SizedBox(
              height: 5,
            ),
            SizedBox(
              height: 300,
              child: GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 1,
                    childAspectRatio: 1.3,
                    mainAxisSpacing: 20,
                    crossAxisSpacing: 20),
                itemCount: randomCategories.length,
                itemBuilder: (context, index) => CategoryItem(
                  title: randomCategories[index].title,
                  image: randomCategories[index].image,
                  id: randomCategories[index].id,
                  X: SubCategoriesScreen(
                    title: randomCategories[index].title,
                    xcategories: subcategories,
                  ),
                ),
              ),
            ),
            const Divider()
          ],
        ),
      ),
    );
  }
}
