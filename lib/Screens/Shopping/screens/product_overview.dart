import 'package:flutter/material.dart';
import '../provider/product.dart';
import '../widgets/product_grid.dart';
import '../widgets/product_items.dart';


class ProductOverviewScreen extends StatelessWidget {
  ProductOverviewScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('MyShop'),
        actions: <Widget>[
          PopupMenuButton(itemBuilder: (_)=>[
            PopupMenuItem(child: Text("Only Favourites"), value: 0,)
          ])
        ]
      ),
      body: ProductGrid(),
    );
  }
}

