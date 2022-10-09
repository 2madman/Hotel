import 'package:first_app/views/login_view.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:first_app/firebase_options.dart';


class NavigationDrawerWidget extends StatelessWidget {

  final padding = EdgeInsets.symmetric(horizontal:20);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Material(
        color: const Color.fromRGBO(50, 75, 205, 1),
        child: ListView(
          children: <Widget>[
            const SizedBox(height: 30),
            //const SizedBox(width: 15,),
            const Text(
              "       "+"Sedat Efe Oner",
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold, 
                fontSize: 20 
              ),
            ),
            const SizedBox(height: 15,),
            buildMenuItem(
              text: "Rooms",
              icon: Icons.meeting_room
            ),
            buildMenuItem(
              text: "Facility",
              icon: Icons.public
            ),
            buildMenuItem(
              text: "Laundry",
              icon: Icons.local_laundry_service
            ),
            buildMenuItem(
              text: "Settings", 
              icon: Icons.settings
            ),
            buildMenuItem(
              text: "Log Out", 
              icon: Icons.logout,
              onClicked: (){
                 showAlertDialog(context);
              },
            ),
          ],
        )
      )
    );
  }
}

showAlertDialog(BuildContext context) {

  // set up the buttons
  Widget cancelButton = TextButton(
    child: const Text("Cancel"),
    onPressed:  () {
      Navigator.of(context, rootNavigator: true).pop('dialog');
    },
  );
  Widget continueButton = TextButton(
    child: const Text("Log Out"),
    onPressed: () async {
      
      final FirebaseAuth user = FirebaseAuth.instance;
      
      await FirebaseAuth.instance.signOut();
      /*Navigator.of(context).push
      (MaterialPageRoute(builder: (BuildContext context){
        return const LoginView();
      }));*/
    },
  );

  // set up the AlertDialog
  AlertDialog alert = AlertDialog(
    title: const Text("Log out?"),
    actions: [
      cancelButton,
      continueButton,
    ],
  );

  // show the dialog
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return alert;
    },
  );
}

Widget buildMenuItem({
  required String text,
  required IconData icon,
  VoidCallback? onClicked,
}) {
  final color = Colors.white;

  return ListTile(
    leading: Icon(icon, color: color),
    title: Text(text, style: TextStyle(color:color)),
    onTap: onClicked,
  );

}
