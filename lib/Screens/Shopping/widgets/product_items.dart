import 'package:flutter/material.dart';
class ProductItem extends StatelessWidget {

  final String id;
  final String title;
  final String imageUrl;

  ProductItem( this.id, this.title, this.imageUrl );

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(10),
      child: GridTile(
        footer: GridTileBar(
          title: Text(title, textAlign: TextAlign.center,),
          backgroundColor: Colors.black87,
          leading: IconButton(
            icon: Icon(Icons.favorite_outline),
            onPressed: (){},
            color: Colors.deepOrange,
          ),
          trailing: IconButton(icon: Icon(Icons.shopping_cart),
            onPressed: (){},
            color: Colors.deepOrange,
          ),
        ),
        child:  GestureDetector(child: Image.network(imageUrl, fit: BoxFit.cover,),
          onTap: (){
            //This is where I have used named routes
            Navigator.pushNamed(context, '/product_detail', arguments: id);
          },
        ),
      ),
    );
  }
}

