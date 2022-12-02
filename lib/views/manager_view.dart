import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:first_app/widget/managerappbar.dart';
import 'package:flutter/material.dart';

import '../Classes/rooms.dart';

List <String> nameStore = [];
List <String> emailStore = [];


class ManagerView extends StatefulWidget {
  const ManagerView({super.key});

  @override
  State<ManagerView> createState() => _ManagerViewState();
}

class _ManagerViewState extends State<ManagerView> {

  Future getDocId() async {
  int flag = 0;
  await FirebaseFirestore.instance.collection('Users').get().then(
    (snapshot) => snapshot.docs.forEach((element) {

      for(int i=0;i<nameStore.length;i++){
        if(element.data()['name'].toString() == nameStore[i]){
          flag = 1;
        }
      }
      if(flag != 1){
        nameStore.add(element.data()['name'].toString());  
        emailStore.add(element.data()['email'].toString()); 
      }
    }));
  }

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
    getDocId();
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepPurple,
        title: const Text("Manager"),
      ),
      backgroundColor: Colors.grey[300],
      drawer: ManagerAppBar(),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
        ),
      ),
    );
    
  }
}