import 'package:flutter/cupertino.dart';
import '../models/product.dart';

// Here Product class is using mixin Chage Notifier
class Products with ChangeNotifier{
  List<Product> _items = [
    Product(id: 'p1', title: 'Red shirt', description: 'A red shirt', price: 45245, imageUrl: 'https://cdn.pixabay.com/photo/2014/02/27/16/10/flowers-276014__340.jpg'),
    Product(id: 'p2', title: 'white shirt', description: 'This is a wite shirt', price: 63556, imageUrl: 'https://cdn.pixabay.com/photo/2014/02/27/16/10/flowers-276014__340.jpg')
  ];


  // this is the getter which is getting the data
  List<Product> get items{
    return [..._items];
  }

  void addProduct(){
    //  _items.add(value)
      notifyListeners();

  }

}