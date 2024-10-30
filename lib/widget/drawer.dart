import 'package:flutter/material.dart';
import 'package:project1/provider/colors.dart';
import 'package:project1/provider/language.dart';
import 'package:project1/screen/admin_categories_screen.dart';
import 'package:project1/screen/gifts_screen.dart';
import 'package:project1/screen/nproducts_screen.dart';
import 'package:provider/provider.dart';

import '../provider/orders.dart';
import '../screen/orders_screen.dart';
import '../screen/admin_products_screen.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    final orders = Provider.of<Orders>(context);
    final colors = Provider.of<MyColors>(context, listen: false);
    final lang = Provider.of<Language>(context);
    final langList = lang.chosenWords;

    return Drawer(
      backgroundColor: colors.backGroundColor,
      child: Column(
        children: [
          AppBar(
            backgroundColor: colors.appBarColor,
            title: Text(
              "Hello",
              style: TextStyle(color: colors.textColor),
            ),
          ),
          ListTile(
            title: Text(
              "Admin Products",
              style: TextStyle(color: colors.textColor),
            ),
            leading: Icon(Icons.edit, color: colors.textColor),
            onTap: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (ctx) => const AdminProductScreen(),
                ),
              );
            },
          ),
          const Divider(),
          ListTile(
            title: Text(
              "Admin Categories",
              style: TextStyle(color: colors.textColor),
            ),
            leading: Icon(Icons.edit, color: colors.textColor),
            onTap: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (ctx) => const AdminCategoriesScreen(),
                ),
              );
            },
          ),
          const Divider(),
          ListTile(
            title: Text(
              langList[9],
              style: TextStyle(color: colors.textColor),
            ),
            leading:
                Icon(Icons.monetization_on_rounded, color: colors.textColor),
            onTap: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (ctx) => const OrdersScreen(),
                ),
              );
            },
          ),
          const Divider(),
          ListTile(
            title: Text(
              langList[10],
              style: TextStyle(color: colors.textColor),
            ),
            leading: Icon(Icons.redeem, color: colors.textColor),
            trailing: Text(
              " \$${orders.po.toStringAsFixed(2)}",
              style: TextStyle(color: colors.textColor),
            ),
            onTap: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (ctx) => const GiftsScreen(),
                ),
              );
            },
          ),
          const Divider(),
          ListTile(
            title: Provider.of<MyColors>(context).lightMode
                ? Text(
                    langList[1],
                    style: TextStyle(color: colors.textColor),
                  )
                : Text(
                    langList[0],
                    style: TextStyle(color: colors.textColor),
                  ),
            leading: Consumer<MyColors>(
              builder: (ctx, value, child) => IconButton(
                onPressed: () {
                  value.changemode();
                },
                icon: Icon(
                    value.lightMode ? Icons.sunny : Icons.wb_sunny_outlined,
                    size: 30,
                    color: colors.textColor),
              ),
            ),
          ),
          const Divider(),
          ListTile(
            title: lang.english
                ? Text(
                    "English",
                    style: TextStyle(color: colors.textColor),
                  )
                : Text(
                    "اللغة العربية",
                    style: TextStyle(color: colors.textColor),
                  ),
            leading: IconButton(
              onPressed: () {
                Provider.of<Language>(context, listen: false).changeLanguage();
              },
              icon: Icon(Icons.abc, size: 30, color: colors.textColor),
            ),
          ),
          const Divider(),
          ListTile(
            title: lang.english
                ? Text(
                    "English",
                    style: TextStyle(color: colors.textColor),
                  )
                : Text(
                    "اللغة العربية",
                    style: TextStyle(color: colors.textColor),
                  ),
            leading: IconButton(
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (ctx) => const NewProductsScreen(),
                  ),
                );
              },
              icon: Icon(Icons.add, size: 30, color: colors.textColor),
            ),
          ),
          const Divider(),
        ],
      ),
    );
  }
}
