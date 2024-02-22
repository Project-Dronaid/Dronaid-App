//this is the product model class which contains the basic requirements of product widgets

import 'package:flutter/cupertino.dart';

class Product with ChangeNotifier {
  final String id;
  final String title;
  final String description;
  final int price ;
  final String category;
   String imageUrl;
  bool isFavourite;
  int quantity;

  Product({
    required this.id,
    required this.title,
    required this.description,
    required this.price,
     this.imageUrl="abc.com",
    required this.category,
    this.isFavourite = false,
    this.quantity = 1
  });

  void toggleFavouriteStatus() {
    isFavourite = !isFavourite;
    notifyListeners();
  }

}