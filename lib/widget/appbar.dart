import 'dart:developer';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:first_app/views/login_view.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:first_app/views/housekeeper/rooms_view.dart';
import '../views/manager/register_rooms.dart';

List <String> docIDs = [];
String name="";

Future getDocId() async {

  await FirebaseFirestore.instance.collection('Users').get().then(
  (snapshot) => snapshot.docs.forEach((element) {
    docIDs.add(element.data()['email']);  
    docIDs.add(element.data()['name']);
      
  }));

}

String nameApply(){
  getDocId();
  final user = FirebaseAuth.instance.currentUser;

  try{
    for(int i=0;i<docIDs.length;i++){
      if(user!.email.toString() == docIDs[i]){
        name = docIDs[i+1].toString();
        return docIDs[i+1].toString();
      }
    }
  }catch(e){
    log(e.toString());
    
  }
  return "null";
}


class NavigationDrawerWidget extends StatelessWidget {


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
              text: "Register Rooms", 
              icon: Icons.logout,
              onClicked: (){
                 Navigator.of(context).push
                  (MaterialPageRoute(builder: (BuildContext context){
                  return const RegisterRoomsView();
                }));
              },
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
      await FirebaseAuth.instance.signOut();
      Navigator.of(context).push
      (MaterialPageRoute(builder: (BuildContext context){
        return const LoginView();
      }));
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
