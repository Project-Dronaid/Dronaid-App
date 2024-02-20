import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:dronaidapp/Screens/Products/ProductPage.dart';
import 'package:dronaidapp/Screens/Shopping/provider/products.dart';
import 'package:dronaidapp/Screens/Shopping/screens/cart_screen.dart';
import 'package:dronaidapp/Screens/Shopping/widgets/badge.dart' as badge;
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../provider/cart.dart';
import 'package:carousel_slider/carousel_slider.dart';
import '../widgets/product_grid.dart';
import '../widgets/product_items.dart';

enum FilterOptions { favourites, All }

class ProductOverviewScreen extends StatefulWidget {
  const ProductOverviewScreen({super.key});

  @override
  State<ProductOverviewScreen> createState() => _ProductOverviewScreenState();
}

class _ProductOverviewScreenState extends State<ProductOverviewScreen> {
  var isFavourite = true;
  var isnit = true;

  var databaseRef1 = FirebaseDatabase.instance.ref('HOME/OPTIONS');
  var databaseRef2 = FirebaseDatabase.instance.ref('HOME/TYPES');
  var list= [["About Us", "assets/carousel_photos/about_us.jpg"],["Our Achivements", "assets/carousel_photos/achivements.jpg"], ["The Board","assets/carousel_photos/board.jpg"]];

  @override
  void initState() {
    //print('This executed');"
    Provider.of<Products>(context, listen: false).fetchAndSetProduct();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    var height= MediaQuery.sizeOf(context).height;
    var width= MediaQuery.sizeOf(context).width;
    // Here I have made listen false because here we dont need to listen to data change we are just interested in the container of product widget
    final productContainer = Provider.of<Products>(context, listen: false);
    return Scaffold(
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
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        physics: AlwaysScrollableScrollPhysics(),
        child: Container(
          height: size.height * 1,
          color: Color(0xFF8689C6).withOpacity(0.03),
          child: Column(mainAxisSize: MainAxisSize.min, children: [
            Padding(
              padding: EdgeInsets.symmetric(vertical: size.height * 0),
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.4),
                      blurStyle: BlurStyle.solid,
                      blurRadius: 2.5,
                    ),
                  ],
                ),
                width: double.infinity,
                height: size.height * 0.2,
                child: Row(
                  children: [
                    Expanded(
                      child: Column(
                        children: [
                          Padding(
                            padding:  EdgeInsets.only(left: width*0.06),
                            child: Text(
                              'Fulfill all your medicinal needs here!!',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: size.height * 0.019
                              ),
                            ),
                          ),
                          SizedBox(
                            height: height*0.01,
                          ),
                          InkWell(
                            onTap: (){
                              Navigator.of(context).pushNamed(ProductPage.routeName);
                            },
                            child: Container(
                              padding: EdgeInsets.symmetric(horizontal: width*0.09, vertical: height*0.003),
                              color: Colors.green,
                              child: Text(
                                ' GO TO STORE ',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white),
                              ),
                            ),
                          )
                        ],
                        mainAxisAlignment: MainAxisAlignment.center,
                      ),
                    ),
                    Expanded(
                      child: Padding(
                          padding: EdgeInsets.symmetric(),
                          child: Image.network(
                            'https://clipart-library.com/data_images/90015.jpg',
                            fit: BoxFit.cover,
                          )),
                    ),
                  ],
                ),
              ),
            ),

            Padding(
              padding: EdgeInsets.symmetric(vertical: size.height * 0.015),
              child: StreamBuilder(
                  stream: databaseRef1.onValue,
                  builder:
                      (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
                    if (!snapshot.hasData) {
                      return Center(
                          child: CircularProgressIndicator(strokeWidth: 1.0));
                    } else {
                      try {
                        Map<dynamic, dynamic> map =
                            snapshot.data!.snapshot.value as dynamic;
                        List<dynamic> list = [];
                        list = map.values.toList();
                        return SizedBox(
                          height: size.height * 0.1,
                          child: ListView.builder(
                              physics: NeverScrollableScrollPhysics(),
                              shrinkWrap: true,
                              scrollDirection: Axis.horizontal,
                              itemCount:
                                  snapshot.data!.snapshot.children.length,
                              itemBuilder: (context, index) {
                                return Column(
                                  children: [
                                    Expanded(
                                      flex: 2,
                                      child: Padding(
                                        padding: EdgeInsets.symmetric(
                                            horizontal: size.width * 0.015),
                                        child: InkWell(
                                          onTap: () => Navigator.of(context).pushNamed(ProductPage.routeName),
                                          child: Container(
                                            clipBehavior: Clip.antiAlias,
                                            width: size.width * 0.2,
                                            decoration: BoxDecoration(
                                              border: Border.all(
                                                color: Colors.black12,
                                              ),
                                              borderRadius:
                                                  BorderRadius.circular(22),
                                              color: Colors.white,
                                            ),
                                            child: Image.network(
                                              list[index]['IMG'].toString(),
                                              fit: BoxFit.cover,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                    Expanded(
                                        flex: 1,
                                        child: Padding(
                                          padding: EdgeInsets.symmetric(
                                              vertical: size.height * 0.005),
                                          child: Text(
                                              list[index]['TEXT'].toString(),
                                              style: TextStyle(
                                                  color: Color(0xFF000161),
                                                  fontSize:
                                                      size.height * 0.0165)),
                                        )),
                                  ],
                                );
                              }),
                        );
                      } catch (e) {
                        return Text(
                          'Currently you don\'t have any Orders.',
                          style: TextStyle(
                              color: Colors.black, fontWeight: FontWeight.bold),
                        );
                      }
                    }
                    //       catch(e){
                    //         return Text('Currently you don\'t have any Orders.',style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold),);
                    //   }
                    //       catch(e){
                    //         return Text('Currently you don\'t have any Orders.',style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold),);
                    // }
                  }),
            ),
            StreamBuilder(
                stream: databaseRef1.onValue,
                builder:
                    (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
                  if (!snapshot.hasData) {
                    return Center(
                        child: CircularProgressIndicator(strokeWidth: 1.0));
                  } else {
                    try {
                      Map<dynamic, dynamic> map =
                          snapshot.data!.snapshot.value as dynamic;
                      List<dynamic> list = [];
                      list = map.values.toList();
                      return CarouselSlider.builder(
                        itemCount: snapshot.data!.snapshot.children.length,
                        itemBuilder: (BuildContext context, int itemIndex,
                                int pageViewIndex) =>
                            Container(
                          width: size.width * 0.78,
                          child: Image.network(
                            list[itemIndex]['IMG'],
                            fit: BoxFit.fitWidth,
                          ),
                        ),
                        options: CarouselOptions(
                          height: size.height * 0.2,
                          autoPlay: true,
                        ),
                      );
                    } catch (e) {
                      return Text(
                        'Currently you don\'t have any Orders.',
                        style: TextStyle(
                            color: Colors.black, fontWeight: FontWeight.bold),
                      );
                    }
                  }
                }),

            SizedBox(
              height: height*0.2,
              child: CarouselSlider.builder(
                itemCount: list.length,
                  itemBuilder: (BuildContext context, int itemIndex,
                      int pageViewIndex) =>
                      Container(
                        width: MediaQuery.of(context).size.width,

                        margin: EdgeInsets.symmetric(horizontal: 5.0),
                        decoration: BoxDecoration(
                            color: Colors.amber
                        ),
                        child: Stack(
                          children: [
                            Image.asset(list[itemIndex][1],
                              fit: BoxFit.fitWidth,
                            ),
                            Text(list[itemIndex][0])

                          ],
                        ),
                      ),
                options: CarouselOptions(height: 400.0,
                enlargeCenterPage: false,
                  autoPlay: true
                ),

              ),
            ),

            Padding(
              padding: EdgeInsets.only(bottom: size.height * 0.025, top: height*0.025),
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.4),
                      blurStyle: BlurStyle.solid,
                      blurRadius: 2.5,
                    ),
                  ],
                ),
                width: double.infinity,
                height: size.height * 0.1,
                child: Row(
                  children: [
                    Expanded(
                      child: Column(
                        children: [
                          Text(
                            'FREE HOME DELIVERY',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Container(
                            color: Color(0xFF8689C6).withOpacity(0.7),
                            child: Text(
                              ' NO MINIMUM ORDER ',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white),
                            ),
                          )
                        ],
                        mainAxisAlignment: MainAxisAlignment.center,
                      ),
                    ),
                    Expanded(
                      child: Padding(
                          padding: EdgeInsets.symmetric(),
                          child: Image.network(
                            'https://img.freepik.com/premium-vector/drone-delivery-2d-vector-isolated-illustration-carry-cardboard-box-fast-flying-shipment-online-order-flat-scene-cartoon-background-automated-transportation-colourful-scene_151150-7857.jpg?w=1380',
                            fit: BoxFit.cover,
                          )),
                    ),
                  ],
                ),
              ),
            ),

            ProductGrid(showFavs: isFavourite),
            // Padding(
            //   padding: EdgeInsets.symmetric(vertical: size.height * 0.01),
            //   child: StreamBuilder(
            //       stream: databaseRef2.onValue,
            //       builder:
            //           (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
            //         if (!snapshot.hasData) {
            //           return Center(
            //               child: CircularProgressIndicator(strokeWidth: 1.0));
            //         } else {
            //           try {
            //             Map<dynamic, dynamic> map =
            //                 snapshot.data!.snapshot.value as dynamic;
            //             List<dynamic> list = [];
            //             list = map.values.toList();
            //             return SizedBox(
            //               height: size.height * 0.11,
            //               child: ListView.builder(
            //                   physics: ClampingScrollPhysics(),
            //                   shrinkWrap: true,
            //                   scrollDirection: Axis.horizontal,
            //                   itemCount:
            //                       snapshot.data!.snapshot.children.length,
            //                   itemBuilder: (context, index) {
            //                     return Column(
            //                       children: [
            //                         Expanded(
            //                           flex: 3,
            //                           child: Padding(
            //                             padding: EdgeInsets.symmetric(
            //                                 horizontal: size.width * 0.038),
            //                             child: Container(
            //                               clipBehavior: Clip.antiAlias,
            //                               width: size.width * 0.2,
            //                               decoration: BoxDecoration(
            //                                 border: Border.all(
            //                                   color: Colors.black12,
            //                                 ),
            //                                 borderRadius:
            //                                     BorderRadius.circular(10),
            //                                 color: Colors.transparent,
            //                               ),
            //                               child: Image.network(
            //                                 list[index]['IMG'].toString(),
            //                                 fit: BoxFit.cover,
            //                               ),
            //                             ),
            //                           ),
            //                         ),
            //                         Expanded(
            //                             flex: 1,
            //                             child: Padding(
            //                               padding: EdgeInsets.symmetric(
            //                                   vertical: size.height * 0.005),
            //                               child: Text(
            //                                   list[index]['TEXT'].toString(),
            //                                   style: TextStyle(
            //                                       color: Color(0xFF000161),
            //                                       fontSize:
            //                                           size.height * 0.0165)),
            //                             )),
            //                       ],
            //                     );
            //                   }),
            //             );
            //           } catch (e) {
            //             return Text(
            //               'Currently you don\'t have any Orders.',
            //               style: TextStyle(
            //                   color: Colors.black, fontWeight: FontWeight.bold),
            //             );
            //           }
            //         }
            //       }),
            // ),

          ]),
        ),
      ),
    );
  }
}
