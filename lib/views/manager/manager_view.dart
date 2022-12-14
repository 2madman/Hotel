import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:first_app/Classes/rooms.dart';
import 'package:flutter/material.dart';
import 'manager_rooms_view.dart';


List <String> nameStore = [];
List <String> emailStore = [];

class ManagerView extends StatefulWidget {
  const ManagerView({super.key});

  @override
  State<ManagerView> createState() => _ManagerViewState();
}

class _ManagerViewState extends State<ManagerView> {

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
        }
      }
    }));
  }


  
  @override
  Widget build(BuildContext context) {
    
    addListe();
    refresh();
    return const ManagerRoomsView();
    
  }
}