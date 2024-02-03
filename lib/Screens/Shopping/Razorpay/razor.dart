import 'package:dronaidapp/Screens/tracking.dart';
import 'package:dronaidapp/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/utils.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:marquee/marquee.dart';
import 'package:provider/provider.dart';
import 'package:razorpay_flutter/razorpay_flutter.dart';

import '../provider/cart.dart';
import '../widgets/cart_item.dart';


class RazorPayClass extends StatefulWidget {
  final int Amount;
  final LatLng? destination;
  RazorPayClass({required this.Amount, required this.destination});

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<RazorPayClass> {
  late var _razorpay;
  var amountController = TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    _razorpay = Razorpay();
    _razorpay.on(Razorpay.EVENT_PAYMENT_SUCCESS, _handlePaymentSuccess);
    _razorpay.on(Razorpay.EVENT_PAYMENT_ERROR, _handlePaymentError);
    _razorpay.on(Razorpay.EVENT_EXTERNAL_WALLET, _handleExternalWallet);
    super.initState();
  }

  void _handlePaymentSuccess(PaymentSuccessResponse response) {
    // Do something when payment succeeds
    Navigator.push(context, MaterialPageRoute(builder: (context) => Tracking(destination: widget.destination),),);

    print("Payment Done");
  }

  void _handlePaymentError(PaymentFailureResponse response) {
    // Do something when payment fails

    print("Payment Fail");
  }

  void _handleExternalWallet(ExternalWalletResponse response) {
    // Do something when an external wallet is selected
  }

  @override
  Widget build(BuildContext context) {

    final cart = Provider.of<Cart>(context);
    var amount = widget.Amount;
    var height = MediaQuery.of(context).size.height;
    var width= MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(

        backgroundColor: Colors.white,
        title: Text(
          'Checkout',
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),

      ),

      body: Column(
        children: [
          // Scrollable content
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Container(
                    padding: EdgeInsets.only(top: height*0.015),
                    margin: EdgeInsets.only(bottom: height*0.03),
                    height: height*0.06, // Adjust the height as needed
                    color:  Color.fromRGBO(245, 238, 248, 1),
                    child: Marquee(
                      text: 'Thank You for choosing DRONAID!!',
                      style: TextStyle(fontSize: height*0.02, fontWeight: FontWeight.bold, color: Color(0xff00078B)),
                      scrollAxis: Axis.horizontal,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      blankSpace: 60.0,
                      velocity: 40.0,
                      pauseAfterRound: Duration(seconds: 0),
                      startPadding: 10.0,
                      accelerationDuration: Duration(seconds: 0),
                      accelerationCurve: Curves.linear,
                      decelerationDuration: Duration(milliseconds: 0),
                      decelerationCurve: Curves.easeOut,
                    ),
                  ),
                  Column(
                    children: List.generate(
                      cart.items.values.toList().length,
                          (id) => CartItems(
                          id: cart.items.values.toList()[id].id,
                          productId: cart.items.keys.toList()[id],
                          title: cart.items.values.toList()[id].title,
                          price: cart.items.values.toList()[id].price,
                          quantity: cart.items.values.toList()[id].quantity),
                    ),
                  ),
                ],
              ),
            ),
          ),
          // Persistent container at the bottom
          Container(
            padding: EdgeInsets.all(15),
            height: height * 0.1, // Set the desired height of the bottom container
            decoration: BoxDecoration(
              color: Color.fromRGBO(245, 238, 248, 1),
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(width * 0.06),
                topRight: Radius.circular(width * 0.06),
              ),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text("Total: ₹$amount", style: TextStyle(fontSize: height*0.025, fontWeight: FontWeight.bold),),
                GestureDetector(
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                    height: height*0.2,
                    width: width*0.35,

                    decoration: BoxDecoration(
                      color: Colors.green,
                      borderRadius: BorderRadius.all(
                        Radius.circular(width * 0.02),
                      ),
                    ),
                    child: Row(
                     crossAxisAlignment: CrossAxisAlignment.stretch,
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Text("Pay", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold,fontSize: height*0.035),),
                        Icon(CupertinoIcons.arrowtriangle_right_fill, size: height*0.035,)
                      ],
                    ),
                  ),
                    onTap: () {
                      ///Make payment
                      var options = {
                        'key': "rzp_test_akq5S37G2uCNxH",
                        // amount will be multiple of 100
                        'amount': (amount * 100)
                            .toString(), //So its pay 500
                        'name': 'Dronaid',
                        'description': 'Demo',
                        'timeout': 300, // in seconds
                        'prefill': {
                          'contact': '9369204281',
                          'email': 'contact4rai@gmail.com'
                        }
                      };
                      _razorpay.open(options);
                    }
                )
              ],
            ),
          ),
        ],
      ),

    );
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _razorpay.clear();
    super.dispose();
  }
}
