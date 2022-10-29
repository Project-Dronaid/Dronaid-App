import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'product.dart';
import 'package:http/http.dart' as http;

// Here Product class is using mixin Chage Notifier
class Products with ChangeNotifier{
   List<Product> _items = [];

  var _showFavouriteOnly = false;
  var _isinit = true;

  // this is the getter which is getting the data
  List<Product> get items{
    return [..._items];
  }

  List<Product> get favourite{
    return _items.where((prodItem)=> prodItem.isFavourite).toList();
  }

  //This method provides the product after searching by ID
  Product findById(String id){
    return _items.firstWhere((element) => element.id == id);
  }

  Future<void> fetchAndSetProduct()async{
        const url = 'https://project-dronaid-480ca-default-rtdb.firebaseio.com/INVENTORY.json';
        try{
          final response  = await http.get(Uri.parse(url));
          final extractedData = json.decode(response.body) as Map<String, dynamic>;
          print(extractedData);
          final List<Product> onlineList = [];
          extractedData.forEach((key, value) {
            onlineList.add(Product(id: value["id"].toString(), title: value["name"].toString() , description: value["category"].toString(), imageUrl: value["url"]));
          });

          _items = onlineList;
          notifyListeners();
        }
        catch(e){
          print('Error occured in fetching!');
        };
   }

  void addProduct(){
    //  _items.add(value)
      notifyListeners();

  }

}