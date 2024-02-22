import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:dronaidapp/Screens/Products/ProductPage.dart';
import 'package:dronaidapp/Screens/Shopping/provider/products.dart';
import 'package:dronaidapp/Screens/Shopping/screens/cart_screen.dart';
import 'package:dronaidapp/Screens/Shopping/widgets/badge.dart' as badge;
import 'package:dronaidapp/test_insta.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';
import '../provider/cart.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:dronaidapp/Utils/Utils.dart';

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
  var list= [["Dronaid", "assets/carousel_photos/about_us.jpg"],["2nd position in Vayurvya RotorCraft Multirotor Competition", "assets/carousel_photos/achivements.jpg"], ["The Board","assets/carousel_photos/board.jpg"], ["Interaction with Hon'ble Union Minister Rajeev Chandrasekhar","assets/carousel_photos/minister_interaction.png"], ["Drone used for deliveries","assets/carousel_photos/drone_hex.jpeg"
      ""],];
  void _launchURL(String url) async {
    try {
      if (await canLaunch(url)) {
        await launch(url);
      } else {
        print('Could not launch $url');
        Utils().toastmessage("Sorry couldn't open link.");
      }
    } catch (e) {
      print('Error launching URL: $e');
      Utils().toastmessage("Sorry couldn't open link.");

    }
  }

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
     // backgroundColor: Color(0xf7f3fb),
      backgroundColor: Colors.white70,
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        physics: AlwaysScrollableScrollPhysics(),
        child: Container(

          //color: Color(0xFF8689C6).withOpacity(0.03),
          child: Column(mainAxisSize: MainAxisSize.min, children: [
            Padding(
              padding: EdgeInsets.symmetric(vertical: size.height * 0.03),
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
                              //Navigator.push(context, MaterialPageRoute(builder: (context) => InstagramCarouselScreen()));
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
                          'https://clipart-library.com/data_images/90015.jpg',                          fit: BoxFit.cover,
                          loadingBuilder: (BuildContext context, Widget child, ImageChunkEvent? loadingProgress) {
                            if (loadingProgress == null) {
                              return child;
                            } else {
                              return Center(
                                child: CircularProgressIndicator(
                                  value: loadingProgress.expectedTotalBytes != null
                                      ? loadingProgress.cumulativeBytesLoaded / (loadingProgress.expectedTotalBytes ?? 1)
                                      : null,
                                ),
                              );
                            }
                          },
                        ),
                      ),
                    ),

                  ],
                ),
              ),
            ),


            SizedBox(
              height: height*0.25,
              child: CarouselSlider.builder(
                itemCount: list.length,
                  itemBuilder: (BuildContext context, int itemIndex,
                      int pageViewIndex) =>
                      Container(
                        width: MediaQuery.of(context).size.width,
                        margin: EdgeInsets.symmetric(horizontal: 5.0),
                        decoration: BoxDecoration(
                          // Add any additional decoration properties if needed
                        ),
                        child: SizedBox(
                          width: MediaQuery.of(context).size.width, // Ensure SizedBox width matches the container width
                          child: Stack(
                            children: [
                              Image.asset(
                                list[itemIndex][1],
                                width: MediaQuery.of(context).size.width, // Set the image width to the container width
                                fit: BoxFit.fitWidth,
                              ),
                              Positioned(
                                bottom: 0,
                                left: 0,
                                right: 0,
                                child: Container(
                                  color: Colors.black.withOpacity(0.5), // Optional: Add a semi-transparent background for better text readability
                                  padding: EdgeInsets.all(8.0), // Optional: Add padding for text
                                  child: Text(
                                    list[itemIndex][0],
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                      fontSize: width*0.04
                                      // Optional: Set text color
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),

                options: CarouselOptions(height: 400.0,
                enlargeCenterPage: true,
                  autoPlay: true
                ),

              ),
            ),

            Container(
              margin: EdgeInsets.symmetric(vertical: height*0.02),
              padding: EdgeInsets.symmetric(vertical: height*0.02, horizontal: width*0.02),
              width: width*0.95,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(10)),
                border: Border.all(color: Colors.black, width: 3),
                gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [
                    Color(0xFF405DE6).withOpacity(0.8), // Purple
                    Color(0xFF5851DB).withOpacity(0.8), // Purple-Blue
                    Color(0xFF833AB4).withOpacity(0.8), // Dark Purple
                    Color(0xFFC13584).withOpacity(0.8), // Pink
                    Color(0xFFFF6476).withOpacity(0.8), // Orange-Pink
                    Color(0xFFFF7643).withOpacity(0.8), // Orange
                  ],
                  stops: [0.1, 0.3, 0.5, 0.7, 0.9, 1.0],
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Container(
                    padding: EdgeInsets.symmetric(vertical: height*0.006, horizontal: width*0.04),
                    child: Text("Our Socials!!", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: width*0.05), ),
                    decoration: BoxDecoration(
                      color: Colors.black.withOpacity(0.55),
                      borderRadius: BorderRadius.all(Radius.circular(100))
                    ),
                  ),
                  SizedBox(height: height*0.01,),
                  Container(
                    width: width,
                    padding: EdgeInsets.symmetric(vertical: height*0.006, horizontal: width*0.04),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            SvgPicture.asset("assets/icons/instagram.svg", height: height*0.04,),
                            SizedBox(width: width*0.02,),
                            Text("project.dronaid", style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: width*0.05), ),
                          ],
                        ),
                        ElevatedButton(
                          onPressed: () {
                            _launchURL("https://www.instagram.com/project.dronaid/");
                          },
                          style: ElevatedButton.styleFrom(
                            padding: EdgeInsets.symmetric(vertical: height * 0.006, horizontal: width * 0.06), backgroundColor: Colors.black.withOpacity(0.55),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.all(Radius.circular(100)),
                            ),
                          ),
                          child: Text(
                            "Open",
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: height * 0.018,
                            ),
                          ),
                        ),

                      ],
                    ),
                    decoration: BoxDecoration(
                        color: Colors.white.withOpacity(0.55),
                        borderRadius: BorderRadius.all(Radius.circular(10))
                    ),

                  ),
                  SizedBox(height: height*0.01,),
                  Container(
                    width: width,
                    padding: EdgeInsets.symmetric(vertical: height*0.006, horizontal: width*0.04),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            SvgPicture.asset("assets/icons/linkedin.svg", height: height*0.04,),
                            SizedBox(width: width*0.02,),
                            Text("dronaid", style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: width*0.05), ),
                          ],
                        ),
                        ElevatedButton(
                          onPressed: () {
                            _launchURL("https://www.linkedin.com/company/dronaid/");
                          },
                          style: ElevatedButton.styleFrom(
                            padding: EdgeInsets.symmetric(vertical: height * 0.006, horizontal: width * 0.06), backgroundColor: Colors.black.withOpacity(0.55),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.all(Radius.circular(100)),
                            ),
                          ),
                          child: Text(
                            "Open",
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: height * 0.018,
                            ),
                          ),
                        ),

                      ],
                    ),
                    decoration: BoxDecoration(
                        color: Colors.white.withOpacity(0.55),
                        borderRadius: BorderRadius.all(Radius.circular(10))
                    ),

                  ),
                  SizedBox(height: height*0.01,),
                  Container(
                    width: width,
                    padding: EdgeInsets.symmetric(vertical: height*0.006, horizontal: width*0.04),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            SvgPicture.asset("assets/icons/x.svg", height: height*0.04,),
                            SizedBox(width: width*0.02,),
                            Text("projectdronaid", style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: width*0.05), ),
                          ],
                        ),
                        ElevatedButton(
                          onPressed: () {
                            _launchURL("https://twitter.com/projectdronaid");
                          },
                          style: ElevatedButton.styleFrom(
                            padding: EdgeInsets.symmetric(vertical: height * 0.006, horizontal: width * 0.06), backgroundColor: Colors.black.withOpacity(0.55),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.all(Radius.circular(100)),
                            ),
                          ),
                          child: Text(
                            "Open",
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: height * 0.018,
                            ),
                          ),
                        ),

                      ],
                    ),
                    decoration: BoxDecoration(
                        color: Colors.white.withOpacity(0.55),
                        borderRadius: BorderRadius.all(Radius.circular(10))
                    ),

                  ),
                  SizedBox(height: height*0.01,),
                  Container(
                    width: width,
                    padding: EdgeInsets.symmetric(vertical: height*0.006, horizontal: width*0.04),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            SvgPicture.asset("assets/icons/web.svg", height: height*0.04, color: Color.fromRGBO(103, 80, 164, 1),),
                            SizedBox(width: width*0.02,),
                            Text("Our Website", style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: width*0.05), ),
                          ],
                        ),
                        ElevatedButton(
                          onPressed: () {
                            _launchURL("https://www.dronaid.in/");
                          },
                          style: ElevatedButton.styleFrom(
                            padding: EdgeInsets.symmetric(vertical: height * 0.006, horizontal: width * 0.06), backgroundColor: Colors.black.withOpacity(0.55),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.all(Radius.circular(100)),
                            ),
                          ),
                          child: Text(
                            "Open",
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: height * 0.018,
                            ),
                          ),
                        ),

                      ],
                    ),
                    decoration: BoxDecoration(
                        color: Colors.white.withOpacity(0.55),
                        borderRadius: BorderRadius.all(Radius.circular(10))
                    ),

                  ),
                ],
              ),
            ),


            Padding(
              padding: EdgeInsets.only(bottom: size.height * 0.1, top: height*0.01),
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
                width: width*0.95,
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
                          loadingBuilder: (BuildContext context, Widget child, ImageChunkEvent? loadingProgress) {
                            if (loadingProgress == null) {
                              return child;
                            } else {
                              return Center(
                                child: CircularProgressIndicator(
                                  value: loadingProgress.expectedTotalBytes != null
                                      ? loadingProgress.cumulativeBytesLoaded / (loadingProgress.expectedTotalBytes ?? 1)
                                      : null,
                                ),
                              );
                            }
                          },
                        ),
                      ),
                    ),

                  ],
                ),
              ),
            ),


          ]),
        ),
      ),
    );
  }
}
