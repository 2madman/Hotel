import 'package:first_app/main.dart';
import 'package:first_app/views/login_view.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:first_app/views/housekeeper/rooms_view.dart';

String name="";

void nameApply(){

  final user = FirebaseAuth.instance.currentUser;
  for(int i=0;i<allWorkers.length;i++){

    if(user?.email.toString() == allWorkers[i].email.toString()){
      name = allWorkers[i].name;
    }
  }

}

class HouseAppBar extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    nameApply();
    return Drawer(
      child: Material(
        color: const Color.fromARGB(255, 122, 83, 238),
        child: ListView(
          children: <Widget>[
            const SizedBox(height: 30),
            Text(
              "       $name",
              style: const TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold, 
                fontSize: 20 
              ),
            ),
            const SizedBox(height: 15,),
            buildMenuItem(
              text: "Rooms",
              icon: Icons.meeting_room,
              onClicked: (){
                Navigator.of(context).push
                  (MaterialPageRoute(builder: (BuildContext context){
                  return const RoomsView();
                }));
              },
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
      await FirebaseAuth.instance.signOut();
      Navigator.of(context).pushAndRemoveUntil
        (MaterialPageRoute(
          builder: (context)=> const LoginView()
        ),(route)=>false
      );
    },
  );

  // set up the AlertDialog
  AlertDialog alert = AlertDialog(
    title: const Text("Log out?"),
    content: const Text("Are you sure you want to sign out?"),
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
  const color = Colors.white;

  return ListTile(
    leading: Icon(icon, color: color),
    title: Text(text, style: const TextStyle(color:color)),
    onTap: onClicked,
  );

}
