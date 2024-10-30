import 'package:flutter/material.dart';
import 'package:project1/provider/orders.dart';
import 'package:project1/widget/order_item.dart';
import 'package:provider/provider.dart';

import '../provider/colors.dart';
import '../provider/language.dart';

class OrdersScreen extends StatelessWidget {
  const OrdersScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final orderData = Provider.of<Orders>(context);
    final colors = Provider.of<MyColors>(context);
    final lang = Provider.of<Language>(context);
    final langList = lang.chosenWords;

    return Directionality(
      textDirection: lang.english ? TextDirection.ltr : TextDirection.rtl,
      child: Scaffold(
        backgroundColor: colors.backGroundColor,
        appBar: AppBar(
          backgroundColor: colors.appBarColor,
          title: Text(langList[9]),
        ),
        body: ListView.builder(
          itemCount: orderData.items.length,
          itemBuilder: (context, index) => OrderItem(
            order: orderData.items[index],
          ),
        ),
      ),
    );
  }
}
