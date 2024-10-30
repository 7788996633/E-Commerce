import 'package:flutter/material.dart';
import 'package:project1/screen/product_datail_page.dart';
import 'package:provider/provider.dart';

import '../provider/colors.dart';
import '../provider/products.dart';

class Search extends SearchDelegate {
  final Products productsList;

  Search(this.productsList);
  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(
        onPressed: () {
          query = "";
        },
        icon: const Icon(Icons.close),
      ),
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
      onPressed: () {
        close(context, null);
      },
      icon: const Icon(Icons.arrow_back),
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    final colors = Provider.of<MyColors>(context);

    final results = productsList.searchProducts(query);
    return Container(
      color: colors.backGroundColor,
      padding: const EdgeInsets.symmetric(horizontal: 13, vertical: 13),
      child: ListView.builder(
        itemCount: results.length,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              query = results[index].title;
              showResults(context);
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => ProductDetailPage(
                      id: results[index].id,
                      title: results[index].title,
                      image: results[index].image,
                      price: results[index].price,
                      informations: results[index].informations,
                      quantity: results[index].quantity),
                ),
              );
            },
            child: Card(
              color: colors.appBarColor,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(50),
                    child: Image(
                      fit: BoxFit.fill,
                      height: 100,
                      width: 100,
                      image: AssetImage("assets/${results[index].image}"),
                    ),
                  ),
                  Text(
                    results[index].title,
                    style: TextStyle(fontSize: 20, color: colors.textColor),
                  ),
                  Text(
                    "\$${results[index].price}",
                    style: TextStyle(fontSize: 15, color: colors.textColor),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    final results = productsList.searchProducts(query);
    final colors = Provider.of<MyColors>(context);

    return Container(
      color: colors.backGroundColor,
      padding: const EdgeInsets.symmetric(horizontal: 13, vertical: 13),
      child: ListView.builder(
        itemCount: results.length,
        itemBuilder: (context, index) {
          return Column(
            children: [
              ListTile(
                title: Text(
                  results[index].title,
                  style: TextStyle(fontSize: 20, color: colors.textColor),
                ),
                onTap: () {
                  query = results[index].title;
                  showResults(context);
                },
              ),
              const Divider()
            ],
          );
        },
      ),
    );
  }
}
