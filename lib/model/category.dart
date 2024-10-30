class Category {
  final String id;
  final String title;
  final String image;
  Category({required this.id, required this.title, required this.image});
}

class SubCategory extends Category {
  final String maincategorytitle;

  SubCategory(
      {required this.maincategorytitle,
      required super.id,
      required super.title,
      required super.image});
}

class SecSubCategory extends Category {
  final String subcategorytitle;

  SecSubCategory(
      {required this.subcategorytitle,
      required super.id,
      required super.title,
      required super.image});
}
