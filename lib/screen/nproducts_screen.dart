import 'package:flutter/material.dart';
import 'package:project1/provider/products.dart';
import 'package:project1/widget/addedpritem.dart';
import 'package:provider/provider.dart';

class NewProductsScreen extends StatelessWidget {
  const NewProductsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final productsList = Provider.of<Products>(context);
    final addedp = productsList.addedProducts;
    return Scaffold(
      appBar: AppBar(
        title: const Text("data"),
        backgroundColor: Colors.green,
      ),
      body: Column(
        children: [
          const Text("A"),
          SizedBox(
            height: 300,
            child: GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 1,
                    childAspectRatio: 1.3,
                    mainAxisSpacing: 20,
                    crossAxisSpacing: 20),
                itemBuilder: (context, index) => ChangeNotifierProvider.value(
                      value: addedp[index],
                      child: AddedProductItem(poroductId: addedp[index].id),
                    ),
                itemCount: addedp.length),
          ),
        ],
      ),
    );
  }
}
