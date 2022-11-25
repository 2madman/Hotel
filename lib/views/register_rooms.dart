import 'package:first_app/Classes/rooms.dart';
import 'package:flutter/material.dart';

import '../widget/linked_check.dart';
import '../widget/room_register_check.dart';

class RegisterRoomsView extends StatefulWidget {
  const RegisterRoomsView({super.key});

  @override
  State<RegisterRoomsView> createState() => _RegisterRoomsViewState();
}

class _RegisterRoomsViewState extends State<RegisterRoomsView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      appBar: AppBar(
        title: const Text("Rooms To Assign"),
        backgroundColor: const Color.fromARGB(255, 122, 83, 238), 
      ),
      body:  Column(
        children:  <Widget> [
          const SizedBox(height: 10,),
          LinkedLabelCheckbox3(
            room: room1,
          ),
          LinkedLabelCheckbox3(
            room: room2,
          ),
          LinkedLabelCheckbox3(
            room: room3,
          ),
          LinkedLabelCheckbox3(
            room: room4,
          ),
          LinkedLabelCheckbox3(
            room: room5,
          ),
          Expanded(
            child: Align(
              alignment: FractionalOffset.bottomCenter,
              child: TextButton(
                onPressed: () => {},
                child: const Text(
                  "Assign",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 17,
                    color: Colors.black
                  ),
                ),
              ),
            ),
          ),  
        ],
      ),
      
    );
  }
}