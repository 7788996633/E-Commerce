import 'package:flutter/material.dart';
import 'package:project1/provider/products.dart';
import 'package:project1/widget/admin_product_item.dart';
import 'package:provider/provider.dart';

class AdminProductsByCategoryScreen extends StatelessWidget {
  const AdminProductsByCategoryScreen({super.key, required this.categoryTitle});
  final String categoryTitle;
  @override
  Widget build(BuildContext context) {
    final productsList = Provider.of<Products>(context);
    final currproductlist = productsList.productsItems
        .where((element) => element.categoryTitle == categoryTitle)
        .toList();
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 209, 232, 241),
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 63, 124, 155),
        title: Text("$categoryTitle products"),
      ),
      body: currproductlist.isEmpty
          ? const Center(
              child: Text(
                "Add some products...",
                style: TextStyle(fontSize: 30),
              ),
            )
          : Padding(
              padding: const EdgeInsets.all(8),
              child: ListView.builder(
                  itemBuilder: (_, index) => Column(
                        children: [
                          AdminProductItem(
                              quantity: currproductlist[index].quantity,
                              informations: currproductlist[index].informations,
                              price: currproductlist[index].price,
                              id: currproductlist[index].id,
                              title: currproductlist[index].title,
                              image: currproductlist[index].image),
                          const Divider(),
                        ],
                      ),
                  itemCount: currproductlist.length),
            ),
    );
  }
}
