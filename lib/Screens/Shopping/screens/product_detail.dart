import 'package:dronaidapp/Screens/Shopping/provider/products.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../provider/product.dart';

class ProductDetailScreen extends StatelessWidget {
  // final String title;
  static const routeName = '/product_detail';
  // This we don't need because we are using provider
  //ProductDetailScreen(this.title);

  @override
  Widget build(BuildContext context) {
    final productId = ModalRoute.of(context)?.settings.arguments as String;
    final loadedProduct =  Provider.of<Products>(context).findById(productId );
    return Scaffold(
      appBar: AppBar(
        title: Text(loadedProduct.title),
      ),
    );
  }
}
