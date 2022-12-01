import 'package:first_app/widget/linked_check2.dart';
import 'package:flutter/material.dart';
import '../Classes/rooms.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

Future <void> PopOutManager(BuildContext context,Room room )
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
                        label: "Room is cleaned",
                        padding: const EdgeInsets.symmetric(horizontal: 20.0),
                        value: room.roomCleaned,
                        onChanged: (bool newValue) {
                          setState(() {});
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
