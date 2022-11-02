import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../provider/cart.dart';

class CartItems extends StatelessWidget {

  final String id;
  final String productId;
  final int price;
  final int quantity;
  final String title;

  CartItems({required this.quantity, required this.productId, required this.title, required this.price, required this.id});

  @override
  Widget build(BuildContext context) {
    return Dismissible(
      key: ValueKey(id),
      onDismissed: (direction){
        Provider.of<Cart>(context, listen: false).remove(productId);
      },
      background: Container(color: Colors.red,
      child: Icon(Icons.delete),
        alignment: Alignment.centerRight,
      ),
      direction: DismissDirection.endToStart,
      child: Card(
        margin: EdgeInsets.symmetric(
          horizontal: 15.0,
          vertical: 4.0,
        ),
        child: Padding(
          padding: EdgeInsets.all(8.0),
          child: ListTile(
            leading: CircleAvatar(child: Padding(padding: EdgeInsets.all(8),child: FittedBox(child: Text('\$${price}'))),),
            title: Text(title),
            subtitle: Text('${quantity*price}'),
            trailing: Text('${quantity} x'),
          ),
        ),
      ),
    );
  }
}
