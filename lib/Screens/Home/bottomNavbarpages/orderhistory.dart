import 'package:dronaidapp/orders/tabs/Orders.dart';
import 'package:flutter/material.dart';


class OrderHistory extends StatefulWidget {
  const OrderHistory({Key? key}) : super(key: key);

  @override
  State<OrderHistory> createState() => _OrderHistoryState();
}

class _OrderHistoryState extends State<OrderHistory> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return DefaultTabController(
        length: 4,
        child: Scaffold(
        body: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.only(left: size.width*0.05,bottom: size.height*0.04),
              child: Text('My Orders',style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.w500,
                fontSize: size.width*0.06,
              ),),
            ),
            TabBar(
              isScrollable: true,
                tabs:[
                  Tab(child: Text('Orders',style: TextStyle(
                    color: Colors.black,
                    fontSize: size.width*0.04,
                  ),),),
                  Tab(child: Text('Subscription',style: TextStyle(
                    color: Colors.black,
                    fontSize: size.width*0.04,
                  ),),),
                  Tab(child: Text('Diagnostics',style: TextStyle(
                    color: Colors.black,
                    fontSize: size.width*0.04,
                  ),),),
                  Tab(child: Text('Consultation',style: TextStyle(
                    color: Colors.black,
                    fontSize: size.width*0.04,
                  ),),),
             ],
            ),
            Expanded(
              child: TabBarView(children: [
                Orders(),
                SingleChildScrollView(),
                SingleChildScrollView(),
                SingleChildScrollView(),
              ],),
            ),
          ],
      ),
        ),
    ));
  }
}
