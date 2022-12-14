import 'dart:developer';
import 'package:first_app/views/manager/manager_rooms_view.dart';
import 'package:first_app/views/manager/manager_view.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../../views/manager/register_rooms.dart';
import '../../views/manager/register_view.dart';
import '../appbar.dart';

String ?name="";

String? nameApply(){

  final user = FirebaseAuth.instance.currentUser;  
  try{
  for(int i=0;i<emailStore.length;i++){
    if(user!.email.toString() == emailStore[i]){
      name = nameStore[i].toString();
      return name;
    }
  }
  }catch(e){
    log(e.toString());
  }
  return null;
}


class ManagerAppBar extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    name = nameApply();
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

