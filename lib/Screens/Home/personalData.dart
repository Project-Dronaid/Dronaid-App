import 'package:project_dronaid/components/constants.dart';
import 'package:flutter/material.dart';

class PersonalData extends StatefulWidget {
  @override
  State<PersonalData> createState() => _PersonalDataState();
}

class _PersonalDataState extends State<PersonalData> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: const Color(0xFFF2F3FC),
      body: ListView(
        shrinkWrap: true,
        children: [
          Column(
            children: [
              const Padding(
                padding: EdgeInsets.only(bottom: 8.0),
                child: Text(
                  'Personal Data',
                  style: kProfileTextStyle,
                ),
              ),
              const CircleAvatar(
                radius: 50.0,
                backgroundImage: AssetImage('assets/images/profilepicture.png'),
              ),
              const SizedBox(
                height: 20.0,
                width: 250.0,
              ),
              Column(
                children: [
                  ProfileCardWidgetwithOptions(
                    iconData: Icons.person,
                    textContext: 'Personal Data',
                    iconDataWithArrow: Icons.arrow_right,
                    color: Color(0xFF8689C6),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class ProfileCardWidgetwithOptions extends StatelessWidget {
  ProfileCardWidgetwithOptions({
    required this.iconData,
    required this.textContext,
    required this.iconDataWithArrow,
    required this.color,
  });
  // ProfileCardWidgetwithOptions({required this.iconData, required this.onPress, required this.textContext});

  final IconData iconData;
  final String textContext;
  final IconData iconDataWithArrow;
  final Color color;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          alignment: Alignment.center,
          child: const Text('Your Name'),
        ),
        Card(
          margin: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 30.0),
          //padding: EdgeInsets.all(10.0),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(40), // if you need this
            side: BorderSide(
              color: Colors.grey.withOpacity(0.0),
              width: 1,
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.all(2.0),
            child: ListTile(
              title: Text(
                textContext,
                style: kProfileStyle,
              ),
              trailing: Icon(
                iconDataWithArrow,
              ),
            ),
          ),
        ),
        Container(
          alignment: Alignment.center,
          child: const Text('Your Name'),
        ),
        Card(
          margin: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 30.0),
          //padding: EdgeInsets.all(10.0),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(40), // if you need this
            side: BorderSide(
              color: Colors.grey.withOpacity(0.0),
              width: 1,
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.all(2.0),
            child: ListTile(
              title: Text(
                textContext,
                style: kProfileStyle,
              ),
              trailing: Icon(
                iconDataWithArrow,
              ),
            ),
          ),
        ),
        Container(
          alignment: Alignment.center,
          child: const Text('Your Name'),
        ),
        Card(
          margin: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 30.0),
          //padding: EdgeInsets.all(10.0),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(40), // if you need this
            side: BorderSide(
              color: Colors.grey.withOpacity(0.0),
              width: 1,
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.all(2.0),
            child: ListTile(
              title: Text(
                textContext,
                style: kProfileStyle,
              ),
              trailing: Icon(
                iconDataWithArrow,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
