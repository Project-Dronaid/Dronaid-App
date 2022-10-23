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
  // var databaseRef = FirebaseDatabase.instance.ref('USERS');

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    // final user = auth.currentUser!.uid.toString();
    // setState(() {
    //   databaseRef = FirebaseDatabase.instance.ref("USERS/"+user);
    // });
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    final user = auth.currentUser!.uid.toString();
    final databaseRef = FirebaseDatabase.instance.ref('USERS'+'/'+user+'/'+'Order History');
    return Container(
      color: Colors.white12,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: size.width*0.05,vertical: size.height*0.02),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text('Your Previous Orders',style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold,fontSize: size.height*0.015)),
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
                        return Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(
                            color: Colors.white,
                            child: Column(
                              children: [
                                Row(
                                  children: [
                                    Text(list[index]['Name'].toString(),style: TextStyle(fontWeight: FontWeight.bold),),
                                  ],
                                ),
                                Row(
                                  children: [
                                    Text(list[index]['Status'].toString(),style: TextStyle(fontWeight: FontWeight.w500)),
                                  ],
                                ),
                                Column(
                                  children: (list[index]['Items'] as Map<dynamic,dynamic> ).values.map((e) => Text(e)).toList()
                                ),
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
