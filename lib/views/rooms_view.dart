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
            label: room1.roomNumber,
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            value: room1.roomCleaned,
            onPressed: () async {
                //Buraya linked label checkbox tarzı bir şey yap. Başka sayfaya geççek ve 
                //housemenden yardım isticek üstte odanın ismini görecek ve odayı temizleyip
                //temizlemediğini sölicek
            },
            onChanged: (bool newValue) {
              setState(() {
                room1.roomCleaned = newValue;
              });
            },
          ),
          LinkedLabelCheckbox(
            onPressed: () async {
                
            },
            label: room2.roomNumber,
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            value: room2.roomCleaned,
            onChanged: (bool newValue) {
              setState(() {
                room2.roomCleaned = newValue;
              });
            },
          ),
          LinkedLabelCheckbox(
            onPressed: () async {
                
            },
            label: room3.roomNumber,
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            value: room3.roomCleaned,
            onChanged: (bool newValue) {
              setState(() {
                room3.roomCleaned = newValue;
              });
            },
          ),
          LinkedLabelCheckbox(
            onPressed: () async {
                
            },
            label: room4.roomNumber,
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            value: room4.roomCleaned,
            onChanged: (bool newValue) {
              setState(() {
                room4.roomCleaned = newValue;
              });
            },
          ),
          LinkedLabelCheckbox(
            onPressed: () async {
                
            },
            label: room5.roomNumber,
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            value: room5.roomCleaned,
            onChanged: (bool newValue) {
              setState(() {
                room5.roomCleaned = newValue;
              });
            },
          ),
        ],
      )    
    );
  }
}

