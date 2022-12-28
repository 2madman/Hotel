import 'package:flutter/material.dart';
import '../../Classes/housekeeper.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

Future <void> DeletePopOut(BuildContext context,HouseKeeper employee)
{

  CollectionReference users = FirebaseFirestore.instance.collection('Users');
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
                          onPressed: () {
                            users
                              .doc(employee.name)
                              .delete();
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
