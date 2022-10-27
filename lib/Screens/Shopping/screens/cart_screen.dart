import 'package:dronaidapp/Screens/Shopping/provider/cart.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../widgets/cart_item.dart';

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
            child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Total', style: TextStyle(fontSize: 20)),
                Spacer(),
                Chip(label: Text('\$${cart.totalAmount}', style: TextStyle(color: Colors.white),),backgroundColor: Theme.of(context).primaryColor, ),
                TextButton(onPressed: (){}, child: const Text('ORDER NOW'),),
              ],
            ),
          ),
        ),
        SizedBox(height: 10,),
        Expanded(child: ListView.builder(itemBuilder: (ctx, id)=> CartItems(id: cart.items.values.toList()[id].id, productId: cart.items.keys.toList()[id], title: cart.items.values.toList()[id].title, price: cart.items.values.toList()[id].price, quantity: cart.items.values.toList()[id].quantity), itemCount: cart.itemCount,),),

      ],),
    );
  }
}
