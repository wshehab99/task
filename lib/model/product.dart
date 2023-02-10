import 'category.dart';

class ProductModel {
  List<Product> newest;
  List<Product> higherRating;

  List<Category> category;
  ProductModel(
      {required this.newest,
      required this.higherRating,
      required this.category});
}

class Product {
  String name;
  double price;
  String image;
  Product(this.name, this.price, this.image);
}
