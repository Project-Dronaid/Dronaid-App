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
              return Center(child: CircularProgressIndicator());
            }else {
              Map<dynamic,dynamic> map = snapshot.data!.snapshot.value as dynamic;
              List<dynamic> list = [];
              list = map.values.toList();
              return ListView.builder(
                  itemCount: snapshot.data!.snapshot.children.length,
                  itemBuilder: (context, index) {
                    return ListTile(
                      title: Text(list[index]['Name']),
                      subtitle: Text(list[index]['Status']),
                    );
                  });
              }
          },
         ),
        ),
      ],
    );
  }
}
