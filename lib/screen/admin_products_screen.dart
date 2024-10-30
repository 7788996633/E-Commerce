import 'package:flutter/material.dart';
import 'package:project1/provider/products.dart';
import 'package:project1/screen/add_product_screen.dart';
import 'package:project1/widget/admin_product_item.dart';
import 'package:provider/provider.dart';

class AdminProductScreen extends StatelessWidget {
  const AdminProductScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final productsData = Provider.of<Products>(context);
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 209, 232, 241),
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 63, 124, 155),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (ctx) => const AddProductScreen(),
                ),
              );
            },
            icon: const Icon(Icons.add),
          ),
        ],
        title: const Text("Your Products"),
      ),
      body: productsData.productsItems.isEmpty
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
                              quantity:
                                  productsData.productsItems[index].quantity,
                              informations: productsData
                                  .productsItems[index].informations,
                              price: productsData.productsItems[index].price,
                              id: productsData.productsItems[index].id,
                              title: productsData.productsItems[index].title,
                              image: productsData.productsItems[index].image),
                          const Divider(),
                        ],
                      ),
                  itemCount: productsData.productsItems.length),
            ),
    );
  }
}
