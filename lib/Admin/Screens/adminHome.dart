import 'package:flutter/material.dart';

class adminHome extends StatefulWidget {
  const adminHome({Key? key}) : super(key: key);
  static const String id = 'adminHome';

  @override
  State<adminHome> createState() => _adminHomeState();
}

class _adminHomeState extends State<adminHome> {
  int pageIndex = 0;

  final pages = [
    NewOrdersaa(),
    ConfirmedOrderaa(),
    Profileaa(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages[pageIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: pageIndex,
        onTap: (value) {
          setState(() {
            pageIndex = value;
          });
        },
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.assignment), // You can replace this icon with the one you prefer
            label: "New",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.check), // You can replace this icon with the one you prefer
            label: "Confirmed",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person), // You can replace this icon with the one you prefer
            label: "Profile",
          ),
        ],
      ),
    );
  }
}

class NewOrdersaa extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.blue,
      child: Center(
        child: Text('New Orders'),
      ),
    );
  }
}

class ConfirmedOrderaa extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.green,
      child: Center(
        child: Text('Confirmed Orders'),
      ),
    );
  }
}

class Profileaa extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.orange,
      child: Center(
        child: Text('Profile'),
      ),
    );
  }
}
