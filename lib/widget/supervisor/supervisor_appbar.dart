import 'package:first_app/main.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../../views/supervisor/supervisor_view.dart';
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

class SupervisorAppBar extends StatelessWidget {

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
              "       $name - Supervisor",
              style: const TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold, 
                fontSize: 20 
              ),
            ),
            const SizedBox(height: 15,),
            /*buildMenuItem(
              text: "Home Page",
              icon: Icons.home,
              onClicked: (){
                 Navigator.of(context).push
                  (MaterialPageRoute(builder: (BuildContext context){
                  return const ManagerView();
                }));
              },
            ),*/
            buildMenuItem(
              text: "Rooms",
              icon: Icons.meeting_room,
              onClicked: (){
                 Navigator.of(context).push
                  (MaterialPageRoute(builder: (BuildContext context){
                  return const SupervisorView();
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

