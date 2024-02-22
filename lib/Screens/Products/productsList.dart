import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../medicines.dart';
import '../Shopping/provider/cart.dart';
import '../Shopping/provider/product.dart';
import '../Shopping/provider/products.dart';

class ProductList extends StatefulWidget {
  final String category;

  const ProductList({Key? key, required this.category}) : super(key: key);

  @override
  State<ProductList> createState() => _ProductListState();
}

class _ProductListState extends State<ProductList> {
  late List<Product> filteredProductList; // Declare the filtered product list

  @override
  final List productList = medicines;
  void initState() {
    filteredProductList = []; // Initialize the filtered product list
    Provider.of<Products>(context, listen: false).fetchAndSetProduct();

    for (var product in medicines) {
      product.quantity = 1;
      if (product.category == widget.category) {
        filteredProductList.add(product); // Append products to the filtered list
      }
    }

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var height= MediaQuery.sizeOf(context).height;
    var width= MediaQuery.sizeOf(context).width;
    final cart = Provider.of<Cart>(context);

    return ListView.builder(
      scrollDirection: Axis.vertical,
      itemBuilder: (context, index) {
        return Card(

          margin: EdgeInsets.all(16),
          child: SizedBox(
            width: 300, // Width of the horizontal rectangle card
            child: Column(
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[

                    Padding(
                      padding: EdgeInsets.symmetric(vertical: 10, horizontal: 40),
                      child: Column(

                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          SizedBox(
                            height: height*0.02,

                          ),
                          SizedBox(
                            width: width*0.52, // Adjust the width based on your design
                            child: Text(
                              filteredProductList[index].title,
                              overflow: TextOverflow.fade,
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),

                          Text(
                            "Price: \u20B9" + productList[index].price.toString(),
                            style: TextStyle(fontSize: 17),
                          ),

                        ],
                      ),

                    ),
                    Padding(
                      padding: const EdgeInsets.only(right: 20, top: 10, bottom: 10),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          ElevatedButton(onPressed: () {
                            cart.addItem(productList[index].id, productList[index].price, productList[index].title, filteredProductList[index].quantity);
                          }, child: Icon(Icons.shopping_cart),
                            style: ButtonStyle(
                                backgroundColor: MaterialStatePropertyAll(Colors.white),
                                padding: MaterialStatePropertyAll(EdgeInsets.all(5))
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Row(
                            children: [
                              GestureDetector(
                                child: Container(
                                  padding: EdgeInsets.symmetric(vertical: 0, horizontal: 5),
                                  decoration: BoxDecoration(
                                      color: Color.fromARGB(255, 103, 80, 164),
                                      borderRadius: BorderRadius.only(topLeft: Radius.circular(5), bottomLeft: Radius.circular(5)),
                                      border: Border.all(color: Colors.white, width: 1)
                                  ),
                                  child: Text("-", style: TextStyle(color: Colors.white, fontSize:15),),
                                ),
                                onTap: (){
                                  if(productList[index].quantity==1){
                                    print("MIN");

                                  }
                                  else{
                                    setState(() {
                                      filteredProductList[index].quantity-=1;
                                    });
                                  }
                                },
                              ),
                              Container(
                                padding: EdgeInsets.symmetric(vertical: 0, horizontal: 5),
                                decoration: BoxDecoration(
                                  color: Color.fromARGB(255, 103, 80, 164),

                                ),
                                child: Text(filteredProductList[index].quantity.toString(), style: TextStyle(color: Colors.white, fontSize:15)),
                              ),
                              GestureDetector(
                                child: Container(
                                  padding: EdgeInsets.symmetric(vertical: 0, horizontal: 5),
                                  decoration: BoxDecoration(
                                      color: Color.fromARGB(255, 103, 80, 164),
                                      borderRadius: BorderRadius.only(topRight: Radius.circular(5), bottomRight: Radius.circular(5)),
                                      border: Border.all(color: Colors.white, width: 1)
                                  ),
                                  child: Text("+", style: TextStyle(color: Colors.white, fontSize:15)),
                                ),
                                onTap: (){
                                  setState(() {
                                    filteredProductList[index].quantity+=1;
                                  });

                                },
                              )
                            ],
                          )
                        ],
                      ),
                    )
                  ],
                ),
                Container(
                  margin: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                  padding: EdgeInsets.symmetric(vertical: 5, horizontal: 5),
                  decoration: BoxDecoration(
                     color: Color.fromRGBO(103, 80, 164, 0.7),
                    borderRadius: BorderRadius.all(Radius.circular(10))
                  ),
                  child: Text(filteredProductList[index].description, textAlign: TextAlign.center, style: TextStyle(color: Colors.white, fontWeight: FontWeight.w600, fontSize: 14),),
                )
              ],
            ),
          ),
        );
      },
      itemCount: filteredProductList.length,
    );
  }
}
