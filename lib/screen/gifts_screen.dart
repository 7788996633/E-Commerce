import 'package:flutter/material.dart';
import 'package:project1/provider/orders.dart';
import 'package:project1/widget/gift_item.dart';
import 'package:provider/provider.dart';

import '../provider/colors.dart';
import '../provider/language.dart';
import '../provider/products.dart';

class GiftsScreen extends StatelessWidget {
  const GiftsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final orders = Provider.of<Orders>(context);
    final productsList = Provider.of<Products>(context);
    final gifpro = productsList.pointtsProductsItem;
    final colors = Provider.of<MyColors>(context);
    final lang = Provider.of<Language>(context);
    final langList = lang.chosenWords;

    return Directionality(
      textDirection: lang.english ? TextDirection.ltr : TextDirection.rtl,
      child: Scaffold(
        backgroundColor: colors.backGroundColor,
        appBar: AppBar(
          backgroundColor: colors.appBarColor,
          title: Text(langList[10]),
        ),
        body: Container(
          padding: const EdgeInsets.symmetric(horizontal: 13, vertical: 13),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Card(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "${langList[25]} = ",
                        style: const TextStyle(fontSize: 25),
                      ),
                      Text(
                        " \$${orders.po.toStringAsFixed(2)}",
                        style: const TextStyle(fontSize: 25),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 700,
                  child: GridView.builder(
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 1,
                              childAspectRatio: 1.3,
                              mainAxisSpacing: 20,
                              crossAxisSpacing: 20),
                      itemBuilder: (context, index) =>
                          ChangeNotifierProvider.value(
                            value: gifpro[index],
                            child: const GiftItem(),
                          ),
                      itemCount: gifpro.length),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
