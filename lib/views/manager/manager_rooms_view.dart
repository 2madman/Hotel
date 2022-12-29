import 'dart:developer';
import 'package:first_app/widget/manager/managerappbar.dart';
import 'package:flutter/material.dart';
import 'package:first_app/Classes/rooms.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '../../main.dart';
import '../../widget/manager/see_rooms_cleaned.dart';

class ManagerRoomsView extends StatefulWidget {
  const ManagerRoomsView({Key? key}) : super(key: key);

  @override
  State<ManagerRoomsView> createState() => _ManagerRoomsViewState();
}

class _ManagerRoomsViewState extends State<ManagerRoomsView> {  

  List <String> docIDs = [];

  Future refresh() async {

    await FirebaseFirestore.instance.collection('Rooms').get().then(
    (snapshot) => snapshot.docs.forEach((element) {
      docIDs.add(element.reference.id);  
      
      for(int i=0;i<10;i++){
        if(liste[i].uid == element.data()['uid']){
          liste[i].roomCleaned = element.data()['roomCleaned'];
          liste[i].initialCleaning = element.data()['initialCleaning'];
          liste[i].someoneCleaning = element.data()['someoneCleaning'];
          liste[i].someoneAlreadyCleaning = element.data()['someoneAlreadyCleaning'];
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

  Widget listViewBuilder(List liste){

    return Expanded(
      child: ListView.builder(
        itemCount: liste.length % 2 == 0 ? liste.length ~/ 2 : liste.length ~/ 2 + 1,
        itemBuilder: (_, index) {
          return Row(
            children: [
              Checkboxxx(
                room: liste[index*2],
              ),
              if (index * 2 +1+ 1 <= liste.length)
                Checkboxxx(
                  room: liste[index*2+1],
                ),
            ],
          );
        },
      ),
    );

  }

  int cleanedRoomNumber(liste){

    int count = 0;
    for(int i=0;i<liste.length;i++){
      if(liste[i].roomCleaned == true){
        count++;
      }
    }
    return count;
  }

  Widget Checkboxx(Room room ){
    return Checkbox(
      value: room.roomCleaned,
      onChanged: (bool? newValue) {
        setState(() {    });
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    
    refresh();
    cleaned = cleanedRoomNumber(liste);
    notCleaned = liste.length - cleaned;

    return Scaffold(
      appBar: AppBar(
        title: const Text("Rooms"),
        backgroundColor: const Color.fromARGB(255, 122, 83, 238), 
      ),
      drawer: ManagerAppBar(),
      backgroundColor: Colors.grey[300],
      body: Column(
        children: [
          const SizedBox(height: 30,),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 27.0),
              child: Container(
                padding: const EdgeInsets.all(18),
                decoration: BoxDecoration(
                color: Colors.deepPurple,
                borderRadius: BorderRadius.circular(18),
                ),
                child:  Center(
                  child: Text(
                    'Cleaned room number: $cleaned',
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                      color: Colors.white
                    ),
                  ),
                ),
              ),
            ),
          const SizedBox(height: 30,),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 27.0),
            child: Container(
              padding: const EdgeInsets.all(18),
              decoration: BoxDecoration(
                color: Colors.deepPurple,
                borderRadius: BorderRadius.circular(18),
              ),
              child:  Center(
                child: Text(
                  'Uncleaned room number: $notCleaned',
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                    color: Colors.white
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(height:30),
          listViewBuilder(liste),
        ],
      ),

    );
  }
}