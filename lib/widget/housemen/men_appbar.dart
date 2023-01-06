import 'package:first_app/main.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../../views/housemen/housemen_view.dart';
import '../appbar.dart';

String ?name="";

void nameApply(){

  final user = FirebaseAuth.instance.currentUser;
  for(int i=0;i<allWorkers.length;i++){

    if(user?.email.toString() == allWorkers[i].email.toString()){
      name = allWorkers[i].name;
    }
  }

}

class HousemenAppBar extends StatelessWidget {

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
                  return const HousemenView();
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

