import 'package:flutter/material.dart';
import 'package:project1/provider/colors.dart';
import 'package:project1/provider/products.dart';
import 'package:project1/widget/appbar.dart';
import 'package:provider/provider.dart';

import '../provider/language.dart';
import '../widget/product_item.dart';

class ProductsScreen extends StatelessWidget {
  const ProductsScreen({super.key, required this.categoryTitle});
  final String categoryTitle;
  @override
  Widget build(BuildContext context) {
    final colors = Provider.of<MyColors>(context);

    final productsList = Provider.of<Products>(context);
    final currproductlist = productsList.productsItems
        .where((element) => element.categoryTitle == categoryTitle)
        .toList();
    final lang = Provider.of<Language>(context);
    final langList = lang.chosenWords;

    return MyAppBar(
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 13, vertical: 10),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Text(
                langList[4],
                style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                    color: colors.textColor),
              ),
              SizedBox(
                height: 320,
                child: GridView.builder(
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 1,
                            childAspectRatio: 1.3,
                            mainAxisSpacing: 20,
                            crossAxisSpacing: 20),
                    itemBuilder: (context, index) =>
                        ChangeNotifierProvider.value(
                          value: currproductlist[index],
                          child:  ProductItem(poroductId: currproductlist[index].id),
                        ),
                    itemCount: currproductlist.length),
              ),
              const SizedBox(
                height: 10,
              ),
              const Divider(),
              Text(
                langList[5],
                style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                    color: colors.textColor),
              ),
              SizedBox(
                height: 300,
                child: GridView.builder(
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 1,
                            childAspectRatio: 1.3,
                            mainAxisSpacing: 20,
                            crossAxisSpacing: 20),
                    itemBuilder: (context, index) =>
                        ChangeNotifierProvider.value(
                          value: currproductlist[index],
                          child:  ProductItem(poroductId: currproductlist[index].id),
                        ),
                    itemCount: currproductlist.length),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
