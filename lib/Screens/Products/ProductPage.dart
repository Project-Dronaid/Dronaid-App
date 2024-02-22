import 'package:dronaidapp/Screens/Products/productsList.dart';
import 'package:dronaidapp/Screens/Shopping/provider/products.dart';
import 'package:dronaidapp/medicines.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../Shopping/provider/cart.dart';
import '../Shopping/provider/product.dart';
import '../Shopping/screens/cart_screen.dart';
import '../Shopping/screens/product_overview.dart';
import '../Shopping/widgets/badge.dart' as badge;

class ProductPage extends StatefulWidget {
  static const String routeName = "/product-page";
  const ProductPage({super.key});

  @override
  State<ProductPage> createState() => _ProductPageState();
}

class _ProductPageState extends State<ProductPage> {
  @override
  final List productList = medicines;
  void initState() {
    Provider.of<Products>(context, listen: false).fetchAndSetProduct();
    for (var product in productList) {
      product.quantity = 1;
    }
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    var height= MediaQuery.sizeOf(context).height;
    final cart = Provider.of<Cart>(context);


    final List listcopy = productList;
    Size size = MediaQuery.of(context).size;
    var isFavourite = false;

    return DefaultTabController(
      length: 3,
      child: Scaffold(
          appBar: AppBar(
            toolbarHeight: size.height * 0.1,
            backgroundColor: Colors.transparent,
            shadowColor: Colors.white.withOpacity(0.0),
            title: Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset('assets/images/banner.png',
                      width: size.width * 0.55),
                  SizedBox(
                    width: MediaQuery.sizeOf(context).width*0.09,
                  ),

                  Consumer<Cart>(
                    builder: (_, cart, ch) => badge.Badge(
                      value: cart.itemCount.toString(),
                      child: ch as Widget,
                    ),
                    child: IconButton(
                      icon: Icon(Icons.shopping_cart,
                          color: Color(0xFF000161), size: size.height * 0.03),
                      onPressed: () {
                        Navigator.of(context).pushNamed(CartScreen.routeName);
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
          backgroundColor: Color(0xf7f3fb),
          body: SafeArea(
            child: Column(
              children: [
                TabBar(
                  isScrollable: true,
                  tabs:[
                    Tab(child: Text('Medicine',style: TextStyle(
                      color: Colors.black,
                      fontSize: size.width*0.04,
                    ),),),
                    Tab(child: Text('Essentials',style: TextStyle(
                      color: Colors.black,
                      fontSize: size.width*0.04,
                    ),),),
                    Tab(child: Text('Beauty',style: TextStyle(
                      color: Colors.black,
                      fontSize: size.width*0.04,
                    ),),),
                  ],
                ),
                Expanded(
                  child: TabBarView(children: [
                    ProductList(category: "Medicine"),
                    ProductList(category: "Essentials"),
                    ProductList(category: "Beauty"),


                  ],),
                ),
              ],
            ),

          )
      ),
    );
  }
}
