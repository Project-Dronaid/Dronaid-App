//this is the product model class which contains the basic requirements of product widgets

import 'package:flutter/cupertino.dart';

class Product with ChangeNotifier {
  final String id;
  final String title;
  final String description;
  final double price;
  final String imageUrl;
  bool isFavourite;

  Product({
    required this.id,
    required this.title,
    required this.description,
    required this.price,
    required this.imageUrl,
    this.isFavourite = true});

  void toggleFavouriteStatus() {
    isFavourite = !isFavourite;
    notifyListeners();
  }

}