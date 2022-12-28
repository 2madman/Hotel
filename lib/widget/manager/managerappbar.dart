import 'package:first_app/main.dart';
import 'package:first_app/views/manager/manager_rooms_view.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../../views/manager/delete_users.dart';
import '../../views/manager/register_rooms.dart';
import '../../views/manager/register_view.dart';
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

class ManagerAppBar extends StatelessWidget {

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
              "       $name - Manager",
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
                  return const ManagerRoomsView();
                }));
              },
            ),
            buildMenuItem(
              text: "Register Rooms", 
              icon: Icons.assignment_ind_rounded,
              onClicked: (){
                 Navigator.of(context).push
                  (MaterialPageRoute(builder: (BuildContext context){
                  return const RegisterRoomsView();
                }));
              },
            ),
            buildMenuItem(
              text: "Register New Employee", 
              icon: Icons.add_circle,
              onClicked: (){
                 Navigator.of(context).push
                  (MaterialPageRoute(builder: (BuildContext context){
                  return const RegisterView();
                }));
              },
            ),
            buildMenuItem(
              text: "Delete Employee", 
              icon: Icons.line_weight,
              onClicked: (){
                 Navigator.of(context).push
                  (MaterialPageRoute(builder: (BuildContext context){
                  return const DeleteUser();
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

