import 'package:dronaidapp/Screens/Shopping/provider/products.dart';
import 'package:dronaidapp/Screens/Shopping/widgets/product_items.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ProductGrid extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    final productsData = Provider.of<Products>(context);
    final products = productsData.items;
    return GridView.builder(
      padding: const EdgeInsets.all(10.0),
      itemCount: products.length,
      // This defines how every items is build and it takes context and index as argument.
      //Here using changeNotifier we are checking for the any change in every productItem.
      itemBuilder: (ctx, i)=>ChangeNotifierProvider(create: (c)=> products[i], child: ProductItem(),) ,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2, childAspectRatio: 3/2, crossAxisSpacing: 10, mainAxisSpacing: 10),
    );
  }
}
