import 'package:dronaidapp/Screens/Shopping/screens/product_overview.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';

class Orders extends StatefulWidget {
  @override
  State<Orders> createState() => _OrdersState();
}

class _OrdersState extends State<Orders> {
  final auth = FirebaseAuth.instance;
  var TextColor = Colors.red;
  // var databaseRef = FirebaseDatabase.instance.ref('USERS');

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    final user = auth.currentUser!.uid.toString();
    final databaseRef = FirebaseDatabase.instance.ref('USERS'+'/'+user+'/'+'Order History');
    return Container(
      color: Colors.grey.shade50,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: size.width*0.05,vertical: size.height*0.02),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text('Your Previous Orders',style: TextStyle(color: Colors.black,fontWeight: FontWeight.w600,fontSize: size.height*0.022)),
              ],
            ),
          ),
          Expanded(
              child: StreamBuilder(
             stream: databaseRef.onValue,
             builder: (context,AsyncSnapshot<DatabaseEvent> snapshot){
              if(!snapshot.hasData){
                return Center(child: CircularProgressIndicator(strokeWidth: 1.0,));
              }
              else {
                try{
                  Map<dynamic,dynamic> map = snapshot.data!.snapshot.value as dynamic;
                  List<dynamic> list = [];
                  list = map.values.toList();
                  return ListView.builder(
                      itemCount: snapshot.data!.snapshot.children.length,
                      itemBuilder: (context, index) {
                        var buttText = 'TRACK ORDER';
                        list[index]['Status'].toString()=='Cancelled'? buttText = 'REORDER' : buttText = 'TRACK ORDER';
                        list[index]['Status'].toString()=='Delivered'? TextColor = Colors.green: TextColor = Colors.red;
                        var sizeofOrder = (list[index]['Items'] as Map<dynamic,dynamic>).length;
                        return Padding(
                          padding: EdgeInsets.only(left: size.width*0.02,bottom: size.height*0.03),
                          child: Container(
                            decoration: BoxDecoration(
                              boxShadow: [
                                BoxShadow(
                                  offset: const Offset(
                                    5.0,
                                    5.0,
                                  ),
                                  color: Color(0xFF000161).withOpacity(0.2),
                                  blurRadius: 10.0,
                                  spreadRadius: 2.0,
                                ), //BoxShadow
                                BoxShadow(
                                  color: Colors.white,
                                  offset: const Offset(0.0, 0.0),
                                  blurRadius: 0.0,
                                  spreadRadius: 0.0,
                                ), //BoxShadow
                              ],
                            ),
                            // color: Colors.white,
                            child: Column(
                              children: [
                                Padding(
                                  padding: EdgeInsets.only(left: size.width*0.05,bottom: size.height*0.01,top: size.height*0.02),
                                  child: Row(
                                    children: [
                                      Text(list[index]['Name'].toString(),style: TextStyle(fontWeight: FontWeight.bold,fontSize: size.height*0.02),),
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.only(left: size.width*0.05,bottom: size.height*0.01),
                                  child: Row(
                                    children: [
                                      Text(list[index]['Status'].toString(),style: TextStyle(fontWeight: FontWeight.w500,color: TextColor,fontSize: size.height*0.018)),
                                    ],
                                  ),
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Padding(
                                      padding: EdgeInsets.only(left: size.width*0.05),
                                      child: Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: (list[index]['Items'] as Map<dynamic,dynamic> ).values.map((e) => Padding(
                                          padding: EdgeInsets.only(bottom: size.height*0.01),
                                          child: Row(
                                            children: [
                                              Text(e,style: TextStyle(fontSize: size.height*0.017),),
                                            ],
                                          ),
                                        )).toList()
                                      ),
                                    ),
                                  ],
                                ),
                                Padding(
                                  padding: EdgeInsets.only(top: size.height*0.01, bottom: size.height*0.02),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                    children: [
                                      Container(
                                          child: TextButton(onPressed: (){}, child: Text('View Details',style: TextStyle(color: Colors.grey.shade700),),
                                            clipBehavior: Clip.antiAlias,),
                                      color: Colors.grey.shade200,
                                      width: size.width*0.45,),
                                      Container(
                                          child: TextButton(
                                            onPressed: (){}, child: Text(buttText,style: TextStyle(color: Colors.white),
                                          ),
                                          clipBehavior: Clip.antiAlias,),
                                        color: Color(0xFF000161).withOpacity(0.7),
                                          width: size.width*0.45,
                                      ),
                                    ],
                                  ),
                                )
                              ],
                            ),
                          ),
                        );
                      });
                }
                catch (error) {
                  return Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          child: Image.asset('assets/images/NoOrders.png'),
                          width: size.width*0.8,
                          height: size.height*0.4,
                          decoration: BoxDecoration(
                            color: Colors.transparent,
                          ),
                        ),
                        Text('No Orders Placed!',style: TextStyle(fontWeight: FontWeight.bold,fontSize: size.height*0.03),),
                        SizedBox(
                          height: size.height*0.01,
                        ),
                        Text('Currently you don\'t have any Orders.'),
                        SizedBox(
                          height: size.height*0.02,
                        ),
                        Container(
                          child: TextButton(
                              onPressed: (){
                                Navigator.push(context, MaterialPageRoute(builder: (context)=>ProductOverviewScreen()));
                              }, child: Text('ORDER NOW',style: TextStyle(color: Colors.white),)),
                          color: Color(0xFF000161),
                          width: size.width*0.3,
                        )
                      ],
                    );
                }
              }
            },
           ),
          ),
        ],
      ),
    );
  }
}
