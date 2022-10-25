import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../provider/cart.dart';
import '../provider/product.dart';
class ProductItem extends StatelessWidget {

  // final String id;
  // final String title;
  // final String imageUrl;

  //ProductItem( this.id, this.title, this.imageUrl );

  @override
  Widget build(BuildContext context) {
    final product = Provider.of<Product>(context);
    final cart = Provider.of<Cart>(context);
    return ClipRRect(
      borderRadius: BorderRadius.circular(10),
      child: GridTile(
        footer: GridTileBar(
          title: Text(product.title, textAlign: TextAlign.center,),
          backgroundColor: Colors.black87,
          // Here consumer is the replacement  of Provider.of and we can say it is an advance version to wrap only small piece of widget to prevent from building entire widget tree
          leading: Consumer<Product>(
            builder: (ctx, product, child) => IconButton(
              icon: Icon(product.isFavourite?Icons.favorite:Icons.favorite_outline),
              onPressed: (){
                product.toggleFavouriteStatus();
              },
              color: Colors.deepOrange,
            ),
          ),
          trailing: IconButton(icon: Icon(Icons.shopping_cart),
            onPressed: (){
            cart.addItem(product.id, product.price, product.title);
            },
            color: Colors.deepOrange,
          ),
        ),
        child:  GestureDetector(child: Image.network(product.imageUrl, fit: BoxFit.cover,),
          onTap: (){
            //This is where I have used named routes
            Navigator.pushNamed(context, '/product_detail', arguments: product.id);
          },
        ),
      ),
    );
  }
}

