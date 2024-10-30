import 'package:flutter/material.dart';

class Language with ChangeNotifier {
  var english = true;

  List<String> englishWords = [
    "Dark mode",
    "Light mode",
    "Sign up",
    "Login",
    "All products",
    "Trending",
    "Home",
    "Categories",
    "Brands",
    "Your Orders",
    "Gifts",
    "There is no favorite items... add some",
    "Your Cart",
    "Total",
    "Order Now",
    "Are You Sure?",
    "Do you want to remove this item?",
    "Yes",
    "No",
    "Your Products",
    "Edit",
    "Delete",
    "Add",
    "Your Categories",
    "Favorites",
    "Your points",
    "Clear All"
  ];
  List<String> arabicWords = [
    "الوضع الليلي",
    "الوضع النهاري",
    "انشاء حساب",
    "تسجيل الدخول",
    "جميع المنتجات",
    "منتجات شائعة",
    "الرئيسية",
    "الفئات",
    "الماركات",
    "طلباتك",
    "الهدايا",
    "لا يوجد عناصر في المفضلة...قم باضافة البعض",
    "السلة",
    "الاجمالي",
    "اطلب الان",
    "هل انت متأكد؟",
    "هل تريد ازالة هذا العنصر؟",
    "تأكيد",
    "تراجع",
    "منتجاتك",
    "تعديل",
    "حذف",
    "اضافة",
    "فئاتك",
    "المفضلة",
    "نقاطك",
    "حذف الكل"
  ];

  List<String> chosenWords = [
    "Dark mode",
    "Light mode",
    "Sign up",
    "Login",
    "All products",
    "Trending",
    "Home",
    "Categories",
    "Brands",
    "Your Orders",
    "Gifts",
    "There is no favorite items... add some",
    "Your Cart",
    "Total",
    "Order Now",
    "Are You Sure",
    "Do you want to remove this item",
    "Yes",
    "No",
    "Your Products",
    "Edit",
    "Delete",
    "Add",
    "Your Categories",
    "Favorites",
    "Your points",
    "Clear All"
  ];

  void changeLanguage() {
    english = !english;
    if (english) {
      chosenWords = englishWords;
    } else {
      chosenWords = arabicWords;
    }
    notifyListeners();
  }
}
