import 'dart:developer';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:first_app/views/manager_view.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../views/manager_rooms_view.dart';
import '../views/register_rooms.dart';
import 'appbar.dart';

String name="";

String? nameApply(){

  final user = FirebaseAuth.instance.currentUser;  

  try{
  for(int i=0;i<emailStore.length;i++){
    log(emailStore.length.toString());
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
    name = nameApply()!;
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
              text: "Home Page",
              icon: Icons.home,
              onClicked: (){
                 Navigator.of(context).push
                  (MaterialPageRoute(builder: (BuildContext context){
                  return const ManagerView();
                }));
              },
            ),
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

