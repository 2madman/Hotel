import 'dart:developer';

import 'package:first_app/main.dart';
import 'package:flutter/material.dart';
import '../../Classes/housekeeper.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '../../Classes/rooms.dart';
import '../../views/manager/manager_view.dart';


Future <void> DeletePopOut(BuildContext context,HouseKeeper employee,String job)
{

  CollectionReference users = FirebaseFirestore.instance.collection('Users');
  CollectionReference rooms = FirebaseFirestore.instance.collection('Rooms');

  String a = employee.name;
  return showDialog(
    context: context,
    builder: (context) {
    return StatefulBuilder(
      builder: (context, setState) {
        return AlertDialog(
            title: Text("Employee $a"),
            content: Stack(
              clipBehavior: Clip.none, children: <Widget>[
                Form(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      Text(
                        "Are you sure you want to fire $a?",
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: TextButton(
                          child: const Text("Cancel"),
                          onPressed: () {
                            Navigator.of(context, rootNavigator: true).pop('dialog');
                          },
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: TextButton(
                          child: const Text("Okay"),
                          onPressed: () async {
                            log("ege");
                            var whichRooms = [];
                            await FirebaseFirestore.instance.collection('Users').get().then(
                              (snapshot) => snapshot.docs.forEach((element) {                                                                
                                if(employee.name.toString() ==  (element.data()['name'].toString())){
                                  whichRooms = (element.data()['whichRooms']);                            
                                  log("ege2");
                                }
                            }));
                            
                            if(job == "Housemens"){
                              log("ege3");
                              for(int i=0; i<liste.length ;i++){
                                for(int j=0; j<whichRooms.length;j++){
                                  if(liste[i].roomNumber == whichRooms[j]){
                                    log("eege4");
                                    liste[i].housemen = false;
                                    liste[i].someoneCleaning = false;
                                    rooms
                                      .doc(liste[i].uid)
                                      .update
                                        ({
                                          'someoneCleaning': false,
                                          'housemen': false,
                                        });

                                  }
                                }
                              }
                            }
                            else if(job == "Housekeepers"){
                              for(int i=0; i<liste.length ;i++){
                                for(int j=0; j<whichRooms.length;j++){
                                  if(liste[i].roomNumber == whichRooms[j]){
                                    
                                    liste[i].someoneAlreadyCleaning= false;
                                    liste[i].someoneCleaning = false;
                                    rooms
                                      .doc(liste[i].uid)
                                      .update
                                        ({
                                          'someoneCleaning': false,
                                          'someoneAlreadyCleaning': false,
                                        });

                                  }
                                }
                              }
                            }
                            Navigator.of(context, rootNavigator: true).pop('dialog');  

                            showDialog
                            ( context: context,
                              builder:(context) =>AlertDialog(
                              title: const Text("User has been deleted"),
                              actions: [
                                TextButton(
                                  onPressed: () async{ 
                                    users
                                      .doc(employee.name)
                                      .delete();
                                    Navigator.pop(context, 'OK');  
                                    Navigator.of(context, rootNavigator: true).pop('dialog');  
                                    Navigator.of(context).pushAndRemoveUntil
                                      (MaterialPageRoute(
                                        builder: (context)=> const ManagerView()
                                      ),(route)=>false
                                    );
                                    notCleanedRoom();
                                  },
                                  child: const Text('OK'),
                                ),
                              ],                                      
                            ));
                            
                          },
                        ),
                      )
                    ],
                  ),
                ),
              ],
            ),
          );
      },);
    }
  );
}
