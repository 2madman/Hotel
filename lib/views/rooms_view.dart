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


  Room room1 = Room(101,1,"1");
  Room room2 = Room(102,1,"2");
  Room room3 = Room(103,1,"3");
  Room room4 = Room(104,1,"4");
  Room room5 = Room(105,1,"5");

  

  @override
  Widget build(BuildContext context) {

    CollectionReference users = FirebaseFirestore.instance.collection('Rooms');

    users
        .doc(room1.uid)
        .set
              ({
                'initialCleaning':room1.initialCleaning,
                'roomCleanded': room1.roomCleaned,
              }).then((value) => print('User added'));
    
    users
        .doc(room2.uid)
        .set
              ({
                'initialCleaning':room2.initialCleaning,
                'roomCleanded': room2.roomCleaned,
              }).then((value) => print('User added'));

    users
        .doc(room3.uid)
        .set
              ({
                'initialCleaning':room3.initialCleaning,
                'roomCleanded': room3.roomCleaned,
              }).then((value) => print('User added'));

    users
        .doc(room4.uid)
        .set
              ({
                'initialCleaning':room4.initialCleaning,
                'roomCleanded': room4.roomCleaned,
              }).then((value) => print('User added'));

    users
        .doc(room5.uid)
        .set
              ({
                'initialCleaning':room5.initialCleaning,
                'roomCleanded': room5.roomCleaned,
              }).then((value) => print('User added')); 

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

