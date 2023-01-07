import 'dart:developer';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:first_app/main.dart';
import 'package:flutter/material.dart';
import '../../Classes/housekeeper.dart';
import '../../Classes/rooms.dart';
import '../../views/manager/manager_view.dart';
import '../housekeeper/linked_check2.dart';

Future addUserDetails(HouseKeeper a) async{

    await FirebaseFirestore.instance.collection('Users').add({
      'whichRooms' : a.whichRooms,
    });
  
  }

Future <dynamic> UserPopOut(BuildContext context)
{
  CollectionReference Users = FirebaseFirestore.instance.collection('Users');
  CollectionReference Rooms = FirebaseFirestore.instance.collection('Rooms');

  return showDialog(
    context: context,
    builder: (context) {
    return StatefulBuilder(
      builder: (context, setState) {
        return AlertDialog(
            title: const Text("Housekeepers"),
            insetPadding: EdgeInsets.zero,
            content: Stack(
              clipBehavior: Clip.none, children: <Widget>[
                Form(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      SizedBox(
                        height: 350,
                        width: 250,
                        child: ListView.builder(
                            itemCount: housekeepers.length,
                            itemBuilder: (_, index) {
                              return LinkedLabelCheckbox2(
                                label: housekeepers[index].name,
                                padding: const EdgeInsets.symmetric(horizontal: 5.0),
                                value: housekeepers[index].cleaningRooms,
                                onChanged: (bool? newValue) {
                                  setState(() {
                                    housekeepers[index].cleaningRooms = !housekeepers[index].cleaningRooms; 
                                  }); 
                                },
                              );
                            }
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: TextButton(
                          child: const Text("Assign"),
                          onPressed: () {
                            for(int j=0;j<housekeepers.length;j++){
                              if(housekeepers[j].cleaningRooms == true){                                    
                                log(housekeepers[j].name.toString());                                
                              }
                            }
                            int a=0;
                            for(int i=0;i<liste.length;i++){
                              if(liste[i].someoneAlreadyCleaning == false && liste[i].someoneCleaning == true){
                                Rooms
                                .doc(liste[i].uid)
                                .update
                                  ({
                                    'someoneAlreadyCleaning': true,
                                  });
                                
                                for(int j=0;j<housekeepers.length;j++){
                                  if(housekeepers[j].cleaningRooms == true){                                    
                                    log(housekeepers[j].whichRooms.toString());
                                    a=j;
                                    liste[i].whoCleans = housekeepers[j].name;
                                    Rooms
                                      .doc(liste[i].uid)
                                      .update
                                        ({
                                          'whoCleans': housekeepers[j].name,
                                        });
                                    housekeepers[j].whichRooms.add(liste[i].roomNumber);                                                                     
                                    log(liste[i].roomNumber.toString());
                                  }
                                }
                                
                              }
                            }
                            housekeepers[a].cleaningRooms = false;
                            Users
                              .doc(housekeepers[a].name)
                              .update
                                ({
                                  'whichRooms':housekeepers[a].whichRooms,
                                });
                            
                            
                            Navigator.of(context, rootNavigator: true).pop('dialog');
                            showDialog
                            ( 
                              context: context,
                              builder:(context) =>AlertDialog(
                              title: const Text("Operation is succesfull"),
                              actions: [
                                TextButton(
                                  onPressed: () async {
                                    Navigator.pop(context, 'OK');
                                    Navigator.of(context).pushAndRemoveUntil
                                      (MaterialPageRoute(
                                        builder: (context)=> const ManagerView()
                                      ),(route)=>false
                                    );
                                    log("asdad");
                                    await refresh();
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

