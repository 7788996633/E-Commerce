import 'package:flutter/material.dart';

class MyColors with ChangeNotifier {
  var lightMode = true;
   Color backGroundColor = const Color.fromARGB(255, 211, 207, 207);
   Color appBarColor = const Color.fromARGB(255, 168, 147, 199);
   Color textColor = const Color.fromARGB(255, 0, 0, 0);

  void changemode() {
    lightMode = !lightMode;
    if (lightMode) {
      backGroundColor = const Color.fromARGB(255, 211, 207, 207);
      appBarColor = const Color.fromARGB(255, 168, 147, 199);
      textColor = const Color.fromARGB(255, 0, 0, 0);
    } else {
      backGroundColor = const Color.fromARGB(255, 40, 41, 41);
      appBarColor = const Color.fromARGB(255, 0, 0, 0);
      textColor = const Color.fromARGB(255, 255, 255, 255);
    }
    notifyListeners();
  }
}
