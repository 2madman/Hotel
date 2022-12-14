import 'package:first_app/Classes/rooms.dart';
import 'package:first_app/widget/manager/room_register_check.dart';
import 'package:flutter/material.dart';

import '../../widget/manager/assign_popout.dart';

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
        children:[ 
          const SizedBox(height: 20,),
          Row(
            children : [
              const SizedBox(height: 30,),
              LinkedLabelCheckbox3(
                room: room1,
              ),
              LinkedLabelCheckbox3(
                room: room2,
              ),
            ],
          ),
          const SizedBox(height: 20,),
          Row(
            children : [
              const SizedBox(height: 30,),
              LinkedLabelCheckbox3(
                room: room3,
              ),
              LinkedLabelCheckbox3(
                room: room4,
              ),
            ],
          ),
          const SizedBox(height: 20,),
          Row(
            children : [
              const SizedBox(height: 30,),
              LinkedLabelCheckbox3(
                room: room5,
              ),
              LinkedLabelCheckbox3(
                room: room6,
              ),
            ],
          ),
          const SizedBox(height: 20,),
          Row(
            children : [
              const SizedBox(height: 30,),
              LinkedLabelCheckbox3(
                room: room7,
              ),
              LinkedLabelCheckbox3(
                room: room8,
              ),
            ],
          ),
          const SizedBox(height: 20,),
          Row(
            children : [
              const SizedBox(height: 30,),
              LinkedLabelCheckbox3(
                room: room9,
              ),
              LinkedLabelCheckbox3(
                room: room10,
              ),
            ],
          ),
          Expanded(
            child: Align(
              alignment: FractionalOffset.bottomCenter,
              child: TextButton(
                onPressed: () => {
                  UserPopOut(context)
                },
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