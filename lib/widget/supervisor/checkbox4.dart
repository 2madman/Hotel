import 'package:flutter/material.dart';
import '../../Classes/rooms.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '../supervisor/popout_supervisor.dart';


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
            "Room  ${widget.room.roomNumber}",
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

  Widget Checkboxx(Room room ){

    CollectionReference rooms = FirebaseFirestore.instance.collection('Rooms');
    return Checkbox(
      value: room.roomCleaned,
      onChanged: (bool? newValue) {
        setState(() {
          if(room.roomCleaned == true)
          { 
            room.roomCleaned = newValue!;
            rooms
            .doc(room.uid)
            .update
              ({
                'roomCleaned': room.roomCleaned,
              });        
          }
        });
      },
    );
  }

}
