import 'package:flutter/material.dart';
import 'package:first_app/Classes/rooms.dart';
import '../widget/linked_check.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class RoomsView extends StatefulWidget {
  const RoomsView({Key? key}) : super(key: key);

  @override
  State<RoomsView> createState() => _RoomsViewState();
}


class _RoomsViewState extends State<RoomsView> {  


  @override
  Widget build(BuildContext context) {

    CollectionReference users = FirebaseFirestore.instance.collection('Rooms');

    /*users
        .doc(room1.uid)
        .set
              ({
                'initialCleaning':room1.initialCleaning,
                'roomCleaned': room1.roomCleaned,
              });
    
    users
        .doc(room2.uid)
        .set
              ({
                'initialCleaning':room2.initialCleaning,
                'roomCleaned': room2.roomCleaned,
              });

    users
        .doc(room3.uid)
        .set
              ({
                'initialCleaning':room3.initialCleaning,
                'roomCleaned': room3.roomCleaned,
              });

    users
        .doc(room4.uid)
        .set
              ({
                'initialCleaning':room4.initialCleaning,
                'roomCleaned': room4.roomCleaned,
              });

    users
        .doc(room5.uid)
        .set
              ({
                'initialCleaning':room5.initialCleaning,
                'roomCleaned': room5.roomCleaned,
              }); */

    return Scaffold(
      appBar: AppBar(
        title: const Text("Rooms"),
        backgroundColor: const Color.fromARGB(255, 122, 83, 238), 
      ),
      backgroundColor: Colors.grey[300],
      body:  Column(
        children:  <Widget> [
          const SizedBox(height: 10,),
          LinkedLabelCheckbox(
            room: room1,
          ),
          LinkedLabelCheckbox(
            room: room2,
          ),
          LinkedLabelCheckbox(
            room: room3,
          ),
          LinkedLabelCheckbox(
            room: room4,
          ),
          LinkedLabelCheckbox(
            room: room5,
          ),
        ],
      )    
    );
  }
}

