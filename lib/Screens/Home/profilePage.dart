import 'package:project_dronaid/components/constants.dart';
import 'package:flutter/material.dart';


class ProfilePage extends StatefulWidget {
  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: const Color(0xFFF2F3FC),
      body: ListView(
        shrinkWrap: true,
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 50.0),
            child: Column(
              children: [
                Column(
                  children: [
                    const CircleAvatar(
                      radius: 50.0,
                      backgroundImage: AssetImage('assets/images/profilepicture.png'),
                    ),
                  ],
                ),
                const Text(
                  'Prathmesh Sinha',
                  style: kProfileTextStyle,
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
                      color: const Color(0xFF8689C6),
                      onPress: () {
                        setState(() {
                          Navigator.pushNamed(context, 'Personal Data');
                        });
                      },
                    ),
                    ProfileCardWidgetwithOptions(
                      iconData: Icons.medical_services_rounded,
                      textContext: 'Medical History',
                      iconDataWithArrow: Icons.arrow_right,
                      color: const Color(0xFF8689C6),
                      onPress: () {
                      },
                    ),
                    ProfileCardWidgetwithOptions(
                      iconData: Icons.settings,
                      textContext: 'Settings',
                      iconDataWithArrow: Icons.arrow_right,
                      color: const Color(0xFF8689C6),
                      onPress: () {
                        setState(() {
                          Navigator.pushNamed(context, 'Personal Data');
                        });
                      },
                    ),
                    ProfileCardWidgetwithOptions(
                      iconData: Icons.exit_to_app_rounded,
                      textContext: 'Sign Out',
                      iconDataWithArrow: Icons.arrow_right,
                      color: const Color(0xFF8689C6),
                      onPress: () {
                        setState(() {
                          Navigator.pushNamed(context, 'Personal Data');
                        });
                      },
                    ),
                    const SizedBox(
                      height: 20.0,
                      width: 250.0,
                    ),
                    ProfileCardWidgetwithOptions(
                      iconData: Icons.message_rounded,
                      textContext: 'FAQ',
                      iconDataWithArrow: Icons.arrow_right,
                      color: const Color(0xFF8689C6),
                      onPress: () {
                        setState(() {
                          Navigator.pushNamed(context, 'Personal Data');
                        });
                      },
                    ),
                    ProfileCardWidgetwithOptions(
                      iconData: Icons.group_add,
                      textContext: 'Community',
                      iconDataWithArrow: Icons.arrow_right,
                      color: const Color(0xFF8689C6),
                      onPress: () {
                        setState(() {
                          Navigator.pushNamed(context, 'Personal Data');
                        });
                      },
                    ),
                    ProfileCardWidgetwithOptions(
                      iconData: Icons.file_copy_rounded,
                      textContext: 'License',
                      color: const Color(0xFF8689C6),
                      onPress: () {
                        setState(() {
                          Navigator.pushNamed(context, 'Personal Data');
                        });
                      },
                      iconDataWithArrow: Icons.arrow_right,
                    ),
                    ProfileCardWidgetwithOptions(
                      iconData: Icons.headset_mic_rounded,
                      textContext: 'Feel Free To ask. We are Ready to Help',
                      iconDataWithArrow: Icons.arrow_right,
                      color: const Color(0xFF8689C6),
                      onPress: () {
                        setState(() {
                          Navigator.pushNamed(context, 'Personal Data');
                        });
                      },
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class ProfileCardWidgetwithOptions extends StatefulWidget {
  ProfileCardWidgetwithOptions({
    required this.iconData,
    required this.textContext,
    required this.iconDataWithArrow,
    required this.color,
    required this.onPress,
  });

  final IconData iconData;
  final String textContext;
  final IconData iconDataWithArrow;
  final Color color;
  final Function onPress;

  @override
  State<ProfileCardWidgetwithOptions> createState() =>
      _ProfileCardWidgetwithOptionsState();
}

class _ProfileCardWidgetwithOptionsState
    extends State<ProfileCardWidgetwithOptions> {
  void onSearchButtonPressed(routeName) {
    setState(() {
      Navigator.pushNamed(context, routeName);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Card(
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
          leading: Icon(
            widget.iconData,
            color: widget.color,
          ),
          title: Text(
            widget.textContext,
            style: kProfileStyle,
          ),
          trailing: IconButton(
            icon: Icon(widget.iconDataWithArrow),
            onPressed: () {
              onSearchButtonPressed(widget.textContext);
              widget.onPress;
            },
          ),
        ),
      ),
    );
  }
}
