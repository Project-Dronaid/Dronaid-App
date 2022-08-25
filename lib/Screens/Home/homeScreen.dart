import 'package:flutter/material.dart';
import 'package:flutter_tabler_icons/flutter_tabler_icons.dart';
import 'profilePage.dart';
import 'webPage.dart';
import 'helpMainPage.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      resizeToAvoidBottomInset: false,
      body: HomeListView(),
    );
  }
}

class HomeListView extends StatefulWidget {
  const HomeListView({Key? key}) : super(key: key);

  @override
  State<HomeListView> createState() => _HomeListViewState();
}

class _HomeListViewState extends State<HomeListView> {
  int pageIndex = 0;

  final pages = [
    WebPage(),
    HelpPage(),
    ProfilePage(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffC4DFCB),
      body: pages[pageIndex],
      bottomNavigationBar: buildMyNavBar(context),
    );
  }

  Container buildMyNavBar(BuildContext context) {
    return Container(
      height: 85,
      decoration: BoxDecoration(
        color: const Color(0xFFECECFA),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 5,
            blurRadius: 7,
            offset: const Offset(0, 3), // changes position of shadow
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Column(
            children: [
              IconButton(
                enableFeedback: false,
                onPressed: () {
                  setState(() {
                    pageIndex = 0;
                  });
                },
                icon: pageIndex == 0
                    ? const Icon(
                        Icons.home_filled,
                        color: Color(0xFF0304A0),
                        size: 35,
                      )
                    : const Icon(
                        Icons.home_outlined,
                        color: Color(0xFF8689C6),
                        size: 35,
                      ),
              ),
              const Text('Home'),
            ],
          ),
          Column(
            children: [
              IconButton(
                enableFeedback: false,
                onPressed: () {
                  setState(() {
                    pageIndex = 1;
                  });
                  // Navigator.push(
                  //   context,
                  //   MaterialPageRoute(builder: (context) => MapScreen()),
                  // );
                },
                icon: pageIndex == 1
                    ? const Icon(
                        TablerIcons.drone,
                        color: Color(0xFF0304A0),
                        size: 35,
                      )
                    : const Icon(
                        TablerIcons.drone,
                        color: Color(0xFF8689C6),
                        size: 35,
                      ),
              ),
              const Text('Help'),
            ],
          ),
          Column(
            children: [
              IconButton(
                enableFeedback: false,
                onPressed: () {
                  setState(() {
                    pageIndex = 2;
                  });
                },
                icon: pageIndex == 2
                    ? const Icon(
                        Icons.person,
                        color: Color(0xFF0304A0),
                        size: 35,
                      )
                    : const Icon(
                        Icons.person,
                        color: Color(0xFF8689C6),
                        size: 35,
                      ),
              ),
              const Text('Profile'),
            ],
          ),
        ],
      ),
    );
  }
}
