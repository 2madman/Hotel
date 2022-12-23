import 'package:flutter/material.dart';
import '../../Classes/rooms.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '../housekeeper/linked_check2.dart';

List<String> items =["Towel","Shampoo","Sheet","Toilet Paper"];
String dropValue = "Towel";

Future <void> PopOut(BuildContext context,Room room )
{

  CollectionReference rooms = FirebaseFirestore.instance.collection('Rooms');

  String a = room.roomNumber.toString();
  String b = room.roomNeeds.toString();
  
  return showDialog(
    context: context,
    builder: (context) {
    return StatefulBuilder(
      builder: (context, setState) {
        return AlertDialog(
            title: Text("Room $a"),
            content: Stack(
              clipBehavior: Clip.none, children: <Widget>[
                Form(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      LinkedLabelCheckbox2(
                        label: "Initial cleaning is done.",
                        padding: const EdgeInsets.symmetric(horizontal: 20.0),
                        value: room.initialCleaning,
                        onChanged: (bool newValue) {
                          setState(() {
                            if(room.initialCleaning == true){
                              room.initialCleaning = newValue;
                              rooms
                              .doc(room.uid)
                              .update
                                ({
                                  'initialCleaning': room.initialCleaning,
                                });
                            }
                          });
                        },
                      ),
                      //buranın valuesine bak
                      if(room.roomNeeds != "")
                      LinkedLabelCheckbox2(
                        label: "Room needs $b",
                        padding: const EdgeInsets.symmetric(horizontal: 20.0),
                        value: false,
                        onChanged: (bool newValue) {
                          setState(() {
                            if(room.initialCleaning == true){
                              room.roomNeeds = "";
                              rooms
                              .doc(room.uid)
                              .update
                                ({
                                  'roomNeeds': "",
                                });
                            }
                          });
                        },
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: TextButton(
                          child: const Text("Okay"),
                          onPressed: () {
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
