import 'package:flutter/material.dart';
import 'package:project1/provider/brands.dart';
import 'package:project1/provider/cart.dart';
import 'package:project1/provider/categories.dart';
import 'package:project1/provider/colors.dart';
import 'package:project1/provider/language.dart';
import 'package:project1/provider/orders.dart';
import 'package:project1/provider/products.dart';
import 'package:project1/screen/home_page.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (ctx) => Categories(),
        ),
        ChangeNotifierProvider(
          create: (ctx) => Products(),
        ),
        ChangeNotifierProvider(
          create: (ctx) => Cart(),
        ),
        ChangeNotifierProvider(
          create: (ctx) => Orders(),
        ),
        ChangeNotifierProvider(
          create: (ctx) => Brands(),
        ),
        ChangeNotifierProvider(
          create: (ctx) => MyColors(),
        ),
        ChangeNotifierProvider(
          create: (ctx) => Language(),
        ),
      ],
      child: const MaterialApp(
        home: HomePage(),
      ),
    );
  }
}
