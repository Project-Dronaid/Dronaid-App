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
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
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
                      return ListTile(
                        title: Text(list[index]['Name'].toString()),
                        subtitle: Text(list[index]['Status'].toString()),
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
    );
  }
}
