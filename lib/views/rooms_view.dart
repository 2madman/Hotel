import 'package:flutter/material.dart';
import 'package:first_app/Classes/rooms.dart';

import '../widget/linked_check.dart';

class RoomsView extends StatefulWidget {
  const RoomsView({Key? key}) : super(key: key);

  @override
  State<RoomsView> createState() => _RoomsViewState();
}


class _RoomsViewState extends State<RoomsView> {
  

  Room room1 = Room(101,1);
  Room room2 = Room(102,1);
  Room room3 = Room(103,1);
  Room room4 = Room(104,1);
  Room room5 = Room(105,1);


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
        ],
      )    
    );
  }
}

