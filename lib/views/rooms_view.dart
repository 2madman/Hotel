import 'package:firebase_database/firebase_database.dart';
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

  read_data(){

    DocumentReference documentReference = 
      FirebaseFirestore.instance
  }

  @override
  Widget build(BuildContext context) {

    

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
          LinkedLabelCheckbox(
            room: room6,
          ),
          LinkedLabelCheckbox(
            room: room7,
          ),
          LinkedLabelCheckbox(
            room: room8,
          ),
          LinkedLabelCheckbox(
            room: room9,
          ),
          LinkedLabelCheckbox(
            room: room10,
          ),
        ],
      )    
    );
  }
}

