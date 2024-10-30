import 'package:flutter/material.dart';
import 'package:project1/provider/products.dart';
import 'package:project1/widget/appbar.dart';
import 'package:provider/provider.dart';

import '../provider/colors.dart';
import '../widget/product_item.dart';

class ProductsScreen1 extends StatelessWidget {
  const ProductsScreen1({super.key, required this.brandTitle});
  final String brandTitle;
  @override
  Widget build(BuildContext context) {
    final colors = Provider.of<MyColors>(context);

    final productsList = Provider.of<Products>(context);
    final currproductlist = productsList.productsItems
        .where((element) => element.brandTitle == brandTitle)
        .toList();
    return MyAppBar(
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 13, vertical: 10),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Text(
                "All Products",
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
                "Trending",
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
            ],
          ),
        ),
      ),
    );
  }
}
