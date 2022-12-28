import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:first_app/main.dart';
import 'package:first_app/widget/manager/delete_pop.dart';
import 'package:flutter/material.dart';

import '../../Classes/housekeeper.dart';
import '../../Classes/rooms.dart';
import '../../widget/housekeeper/linked_check2.dart';
import '../../widget/manager/assign_popout.dart';
import '../../widget/manager/delete_pop2.dart';

class DeleteUser extends StatefulWidget {
  const DeleteUser({super.key});

  @override
  State<DeleteUser> createState() => _DeleteUserState();
}

class _DeleteUserState extends State<DeleteUser> {

  Future refresh() async {

    /*await FirebaseFirestore.instance.collection('Users').get().then(
    (snapshot) => snapshot.docs.forEach((element) {
      
      for(int i=0;i<workersExManager.length;i++){
        if(workersExManager[i].name == element.data()['name']){
          
        }
      }
    }));*/
  }


  Future<void> _refresh(){
    
    refresh();
    return Future.delayed(
      const Duration(seconds: 1),
    );
  }

  @override
  Widget build(BuildContext context) {
     return Scaffold(      
      appBar: AppBar(
        title: const Text("Employees"),
        backgroundColor: const Color.fromARGB(255, 122, 83, 238), 
      ),
      backgroundColor: Colors.grey[300],
      body: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          const SizedBox(
            width: 400,
          ),
          TextButton(
            onPressed: () async {
              DeletePopOut2(context,housekeepers,"Housekeepers");
            },
            child: const Text(
              "Housekeepers",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 17,
                color: Colors.blueAccent
              ),
            ),
          ),
          TextButton(
            onPressed: () async {
              DeletePopOut2(context,housemens,"Housemens");
            },
            child: const Text(
              "Housemen",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 17,
                color: Colors.blueAccent
              ),
            ),
          ),
          TextButton(
            onPressed: () async {
              DeletePopOut2(context,supervisors,"Supervisors");
            },
            child: const Text(
              "Supervisors",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 17,
                color: Colors.blueAccent
              ),
            ),
          ),              
          /*Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextButton(
              child: const Text("Fire employee"),
              onPressed: () {      
                HouseKeeper employee = HouseKeeper("","","","");
                for(int i=0;i<workersExManager.length;i++){
                  if(workersExManager[i].delete == true){
                    employee = workersExManager[i];
                  }
                }  
                DeletePopOut(context, employee);
              },
            ),
          ),*/
        ],
      ),

    );
  }
}