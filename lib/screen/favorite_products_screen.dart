import 'package:flutter/material.dart';
import 'package:project1/provider/products.dart';
import 'package:project1/widget/product_item.dart';
import 'package:provider/provider.dart';

class FavProductScreen extends StatelessWidget {
  const FavProductScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final productList = Provider.of<Products>(context);
    final favProductsList = productList.favoriteProductsItem;
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 13),
      child: favProductsList.isEmpty
          ? const Center(
              child: Text("There is no favorite... add some"),
            )
          : GridView.builder(
              scrollDirection: Axis.vertical,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 1,
                childAspectRatio: 0.8,
                mainAxisSpacing: 20,
              ),
              itemBuilder: (context, index) => ChangeNotifierProvider.value(
                value: favProductsList[index],
                child:  ProductItem(poroductId: favProductsList[index].id),
              ),
              itemCount: favProductsList.length,
            ),
    );
  }
}
