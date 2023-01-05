import 'dart:developer';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:first_app/Classes/housekeeper.dart';
import 'package:first_app/Classes/rooms.dart';
import 'package:first_app/main.dart';
import 'package:first_app/widget/manager/men_assign.dart';
import 'package:first_app/widget/manager/room_register_check.dart';
import 'package:flutter/material.dart';
import '../../widget/manager/assign_popout.dart';

class RegisterRoomsMenView extends StatefulWidget {
  const RegisterRoomsMenView({super.key});

  @override
  State<RegisterRoomsMenView> createState() => _RegisterRoomsMenViewState();
}

class _RegisterRoomsMenViewState extends State<RegisterRoomsMenView> {
  
  Widget listViewBuilder(List liste){

    return Expanded(
      child: ListView.builder(
        itemCount: notCleanedRooms.length % 2 == 0 ? notCleanedRooms.length ~/ 2 : notCleanedRooms.length ~/ 2 + 1,
        itemBuilder: (_, index) {
          return Row(
            children: [
                LinkedLabelCheckbox3(
                  room: notCleanedRooms[index*2],
                ),
              if (index * 2 +1+ 1 <= notCleanedRooms.length)
                LinkedLabelCheckbox3(
                  room: notCleanedRooms[index*2+1],
                ),
            ],
          );
        },
      ),
    );

  }

  Future addUserDetails(HouseKeeper a) async{

    await FirebaseFirestore.instance.collection('Users').add({
      'whichRooms' : a.whichRooms,
    });
  
  }

  Future refresh() async {

    await FirebaseFirestore.instance.collection('Rooms').get().then(
    (snapshot) => snapshot.docs.forEach((element) {
      
      for(int i=0;i<10;i++){
        if(liste[i].uid == element.data()['uid']){
          liste[i].someoneCleaning = element.data()['someoneAlreadyCleaning'];
        }
      }
    }));
  }


  Future<void> _refresh(){
    
    refresh();
    return Future.delayed(
      const Duration(seconds: 1),
    );
  }

  @override
  Widget build(BuildContext context) {
    
    CollectionReference users = FirebaseFirestore.instance.collection('Users');
    return Scaffold(
      backgroundColor: Colors.grey[300],
      appBar: AppBar(
        title: const Text("Rooms To Assign"),
        backgroundColor: const Color.fromARGB(255, 122, 83, 238), 
      ),
      body:  Column(
        children:[ 
          const SizedBox(height: 20,),
          listViewBuilder(menRooms),
          Expanded(
            child: Align(
              alignment: FractionalOffset.bottomCenter,
              child: TextButton(
                onPressed: () => {
                  UserPopOutMen(context)
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

