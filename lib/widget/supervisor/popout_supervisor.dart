import 'dart:developer';
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
                        label: "Room is fine",
                        padding: const EdgeInsets.symmetric(horizontal: 20.0),
                        value: room.roomFine,
                        onChanged: (bool newValue) {
                          setState(() {
                            if(room.roomCleaned == true){
                              room.roomFine = newValue;
                              rooms
                              .doc(room.uid)
                              .update
                                ({
                                  'roomFine': room.roomFine,
                                });
                            }
                          });
                        },
                      ),
                      Padding(
                        padding: const EdgeInsets.only(right: 1.0),
                        child: DropdownButton<String>(
                          hint: const Text("What room needs?"),
                          value: dropValue,
                          elevation: 16,
                          onChanged: (String? value) {
                            setState(() {                             
                              dropValue = value!;
                              log(dropValue);
                              room.roomNeeds = dropValue;
                              rooms
                              .doc(room.uid)
                              .update
                                ({
                                  'roomNeeds': room.roomNeeds,
                                });
                            });
                          },
                          items: items.map<DropdownMenuItem<String>>((String value) {
                            return DropdownMenuItem<String>(
                              value: value,
                              child: Text(value),
                            );
                          }).toList(),
                        ),
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
