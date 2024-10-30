import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../provider/mode.dart';

class ThemeSwitcherPage extends StatelessWidget {
  const ThemeSwitcherPage({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => ThemeProvider(),
      child: Consumer<ThemeProvider>(
        builder: (context, themeProvider, child) {
          return MaterialApp(
            theme: themeProvider.themeData,
            darkTheme: ThemeData.dark(),
            themeMode: themeProvider.themeMode == ThemeModeType.dark
                ? ThemeMode.dark
                : ThemeMode.light,
            home: Scaffold(
              appBar: AppBar(
                title: const Text('تبديل الوضع'),
              ),
              body: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      'مرحبًا بك في التبديل بين الوضعين',
                      style: TextStyle(fontSize: 18),
                    ),
                    const SizedBox(height: 20),
                    ElevatedButton(
                      onPressed: () {
                        themeProvider.toggleTheme();
                      },
                      child: const Text(
                        'تبديل الوضع',
                        style: TextStyle(fontSize: 16),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
