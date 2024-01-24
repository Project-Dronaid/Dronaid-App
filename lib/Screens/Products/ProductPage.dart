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
  void initState() {
    Provider.of<Products>(context, listen: false).fetchAndSetProduct();

    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    var height= MediaQuery.sizeOf(context).height;
    final cart = Provider.of<Cart>(context);

    final List productList = medicines;

    Size size = MediaQuery.of(context).size;
    var isFavourite = false;

    return Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          toolbarHeight: size.height * 0.15,
          backgroundColor: Colors.transparent,
          shadowColor: Colors.white.withOpacity(0.0),
          titleSpacing: double.minPositive,
          centerTitle: false,
          leadingWidth: 0,
          title: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Image.asset('assets/images/banner.png',
                      width: size.width * 0.40),
                  PopupMenuButton(
                      onSelected: (FilterOptions selectedValue) {
                        setState(() {
                          if (selectedValue == FilterOptions.favourites) {
                            isFavourite = true;
                          } else {
                            isFavourite = false;
                          }
                        });
                      },
                      icon: Icon(
                        Icons.more_vert,
                        color: Color(0xFF000161),
                        size: size.height * 0.03,
                      ),
                      itemBuilder: (_) => [
                            const PopupMenuItem(
                              value: FilterOptions.favourites,
                              child: Text("Only Favourites"),
                            ),
                            const PopupMenuItem(
                              value: FilterOptions.All,
                              child: Text("Show all"),
                            ),
                          ]),
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
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 8.0, vertical: 0),
                child: Container(
                  height: size.height * 0,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(18),
                    color: Color(0xFF8689C6).withOpacity(0.2),
                  ),
                  child: TextButton(
                    onPressed: () {},
                    child: Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Row(
                        children: [
                          //Icon(Icons.search),
                          SizedBox(
                            width: size.width * 0.03,
                          ),
                          Text(''),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        body: ListView.builder(
          scrollDirection: Axis.vertical,
          itemBuilder: (context, index) {
            return Card(
              margin: EdgeInsets.all(16),
              child: SizedBox(
                width: 300, // Width of the horizontal rectangle card
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Image.asset(

                      "assets/images/banner.png",
                      fit: BoxFit.fitWidth,
                      height: 150,
                      width: 150, // Width of the image within the card
                    ),
                    Expanded(
                      child: Padding(
                        padding: EdgeInsets.symmetric(vertical: 10, horizontal: 40),
                        child: Column(

                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            SizedBox(
                              height: height*0.02,

                            ),
                            Text(
                              productList[index].title,
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            ),

                            Text(
                              "Price: " + productList[index].price.toString(),
                              style: TextStyle(fontSize: 16),
                            ),

                            ElevatedButton(onPressed: () {
                              cart.addItem(productList[index].id, productList[index].price, productList[index].title);
                            }, child: Icon(Icons.shopping_cart))
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
          itemCount: productList.length,
        ));
  }
}
