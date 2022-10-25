import 'package:dronaidapp/Screens/Shopping/provider/products.dart';
import 'package:dronaidapp/Screens/Shopping/screens/cart_screen.dart';
import 'package:dronaidapp/Screens/Shopping/widgets/badge.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../provider/cart.dart';
import '../provider/product.dart';
import '../widgets/product_grid.dart';
import '../widgets/product_items.dart';

enum FilterOptions{
  favourites,
  All
}

class ProductOverviewScreen extends StatefulWidget {
  const ProductOverviewScreen({super.key});


  @override
  State<ProductOverviewScreen> createState() => _ProductOverviewScreenState();
}

class _ProductOverviewScreenState extends State<ProductOverviewScreen> {
  var isFavourite = false;
  @override
  Widget build(BuildContext context) {
    // Here I have made listen false because here we dont need to listen to data change we are just interested in the container of product widget
    final productContainer = Provider.of<Products>(context, listen: false);
    return Scaffold(
      appBar: AppBar(
        title: const Text('MyShop'),
        actions: <Widget>[
          PopupMenuButton(
              onSelected: (FilterOptions selectedValue){
                setState(() {
                  if(selectedValue ==  FilterOptions.favourites){
                    isFavourite = true;
                  }
                  else{
                    isFavourite = false;
                  }
                });

              },
              icon: Icon(Icons.more_vert),
              itemBuilder: (_)=>[
            PopupMenuItem(child: Text("Only Favourites"), value: FilterOptions.favourites,),
            PopupMenuItem(child: Text("Show all"), value: FilterOptions.All,),
            
          ]),
          Consumer<Cart>(builder: (_, cart, ch)=>Badge(value: cart.itemCount.toString(),child: ch as Widget,),child: IconButton(icon: const Icon(Icons.shopping_cart), onPressed: () { Navigator.of(context).pushNamed(CartScreen.routeName); }, ))
        ]
      ),
      body: ProductGrid(showFavs: isFavourite),
    );
  }
}

