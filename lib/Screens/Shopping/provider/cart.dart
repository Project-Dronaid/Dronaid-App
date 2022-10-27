import 'package:flutter/foundation.dart';
import 'package:provider/provider.dart';

class CartItem {
  final String id;
  final String title;
  final int quantity;
  final double price;

  CartItem({required this.id, required this.title, required this.price, required this.quantity});
}

class Cart with ChangeNotifier{
    Map<String, CartItem> _items={};
    Map<String, CartItem> get items{
      return {..._items};
    }

    int get itemCount{
      return _items == null?0:_items.length;
    }

    void addItem(String productId, double price, String title){
      if(_items.containsKey(productId)){
        // Chhange the quantity
        _items.update(productId, (existingCartItem) => CartItem(id: existingCartItem.id, title: existingCartItem.title, price: existingCartItem.price, quantity: existingCartItem.quantity+1));
      }else{
        _items.putIfAbsent(productId, () => CartItem(
          id: DateTime.now().toString(),
          title: title,
          price: price,
          quantity: 1
        ));
      }
      notifyListeners();
    }

    double get totalAmount{
      var total = 0.0;
      _items.forEach((key, value) {total+= value.price*value.quantity;});
      return total;
    }

    void remove(String productId){
      _items.remove(productId);
      notifyListeners();
    }
}