import 'package:dronaidapp/Screens/Shopping/provider/products.dart';
import 'package:dronaidapp/Screens/Shopping/screens/cart_screen.dart';
import 'package:dronaidapp/Screens/Shopping/widgets/badge.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../provider/cart.dart';
import 'package:carousel_slider/carousel_slider.dart';
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
  var isnit = true;
  @override
  void initState() {
    //print('This executed');
    Provider.of<Products>(context, listen: false).fetchAndSetProduct();
    super.initState();
  }

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
              icon: const Icon(Icons.more_vert),
              itemBuilder: (_)=>[
            const PopupMenuItem(value: FilterOptions.favourites,child: Text("Only Favourites"),),
            const PopupMenuItem(value: FilterOptions.All,child: Text("Show all"),),
            
          ]),
          Consumer<Cart>(builder: (_, cart, ch)=>Badge(value: cart.itemCount.toString(),child: ch as Widget,),child: IconButton(icon: const Icon(Icons.shopping_cart), onPressed: () { Navigator.of(context).pushNamed(CartScreen.routeName); }, ))
        ]
      ),
      body: StreamBuilder<Object>(
        stream: null,
        builder: (context, snapshot) {
          return Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 14, bottom: 14),
                child: CarouselSlider(
                  options: CarouselOptions(height: 200.0),
                  items: [1,2,3,4,5].map((i) {
                    return Builder(
                      builder: (BuildContext context) {
                        return Container(
                            width: MediaQuery.of(context).size.width,
                            margin: EdgeInsets.symmetric(horizontal: 5.0),
                            decoration: BoxDecoration(
                                color: Colors.amber,
                              borderRadius: BorderRadius.circular(8)
                            ),
                            child: Text('text $i', style: TextStyle(fontSize: 16.0),)
                        );
                      },
                    );
                  }).toList(),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 16),
                child: Container(child: const Text("Our Products", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),), alignment: Alignment.centerLeft,),
              ),
              Expanded(child: ProductGrid(showFavs: isFavourite)),
            ],
          );
        }
      ),
    );
  }
}

