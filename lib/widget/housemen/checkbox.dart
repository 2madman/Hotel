import 'dart:developer';
import 'package:flutter/material.dart';
import '../../Classes/rooms.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '../housemen/pop_housemen.dart';



class LinkedLabelCheckbox3 extends StatefulWidget {

   const LinkedLabelCheckbox3({
    super.key,
    required this.room,

  });

  final Room room;
  
  @override
  State<LinkedLabelCheckbox3> createState() => _LinkedLabelCheckbox3State();
}

class _LinkedLabelCheckbox3State extends State<LinkedLabelCheckbox3> {
  
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15.0),
      child: Row(
        children: <Widget>[
          TextButton(
            onPressed: () async {
              PopOut(context,widget.room);
            },
            child: Text(
            "Room ${widget.room.roomNumber}",
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 21,
              color: Colors.blueAccent
            ),
          ),
        ),
          Checkboxx(widget.room),
        ],
      ),
    );
  }

  bool checkHousemen(Room room){

    if(room.initialCleaning == true || room.roomNeeds != ""){
      return true;
    }
    else {
      return false;
    }
  }

  bool check = false;
  
  Widget Checkboxx(Room room ){

    check = checkHousemen(room);
    CollectionReference rooms = FirebaseFirestore.instance.collection('Rooms');
    return Checkbox(
      value: check,
      onChanged: (bool? newValue) {
        setState(() {
          if(checkHousemen(room) == false)
          { 
            check = newValue!;                
          }
        });
      },
    );
  }

}
