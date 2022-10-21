import 'package:dronaidapp/Screens/Shopping/provider/products.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ProductDetailScreen extends StatelessWidget {
  final String title;
  static const routeName = '/product_detail';
  ProductDetailScreen(this.title);

  @override
  Widget build(BuildContext context) {
    final productId = ModalRoute.of(context)?.settings.arguments as String;
    final loadedProduct =  Provider.of<Products>(context).items.firstWhere(((prod) => prod.id == productId));
    return Scaffold(
      appBar: AppBar(
        title: Text(loadedProduct.title),
      ),
    );
  }
}
