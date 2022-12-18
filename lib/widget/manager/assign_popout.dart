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
                            itemCount: allWorkers.length,
                            itemBuilder: (_, index) {
                              return LinkedLabelCheckbox2(
                                label: allWorkers[index].name,
                                padding: const EdgeInsets.symmetric(horizontal: 5.0),
                                value: allWorkers[index].cleaningRooms,
                                onChanged: (bool? newValue) {
                                  setState(() {
                                    allWorkers[index].cleaningRooms = !allWorkers[index].cleaningRooms; 
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
                            int a=0;
                            for(int i=0;i<liste.length;i++){
                              if(liste[i].someoneAlreadyCleaning == false && liste[i].someoneCleaning == true){
                                for(int j=0;j<allWorkers.length;j++){
                                  if(allWorkers[j].cleaningRooms == true){                                    
                                    a=j;
                                    allWorkers[j].whichRooms.add(liste[i].roomNumber);                                 
                                  }
                                }
                              }
                            }
                            Users
                              .doc(allWorkers[a].name)
                              .update
                                ({
                                  'whichRooms':allWorkers[a].whichRooms,
                                });
                            
                            
                            Navigator.of(context, rootNavigator: true).pop('dialog');
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

