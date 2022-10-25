import 'package:dronaidapp/Screens/Shopping/provider/cart.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({Key? key}) : super(key: key);
  static const routeName = '/Cart';
  @override
  Widget build(BuildContext context) {
    final cart = Provider.of<Cart>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('Your Cart'),
      ),
      body: Column(children: <Widget>[
        Card(
          margin: EdgeInsets.all(15),
          child: Padding(
            padding: EdgeInsets.all(8),
            child: Row(
              children: [
                Text('Total', style: TextStyle(fontSize: 20)),
                SizedBox(width: 10,),
                Chip(label: Text('\$${cart.totalAmount}', style: TextStyle(color: Colors.white),),backgroundColor: Theme.of(context).primaryColor, ),
              ],
            ),
          ),
        )
      ],),
    );
  }
}
