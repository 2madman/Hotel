import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:first_app/main.dart';
import 'package:flutter/material.dart';
import 'package:first_app/Classes/rooms.dart';
import '../../widget/housekeeper/keeperappbar.dart';
import '../../widget/housekeeper/linked_check.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

var userRooms = [];
var userRoomsNums = [];

Future whichRooms() async{
    
  final user = FirebaseAuth.instance.currentUser;

  await FirebaseFirestore.instance.collection('Users').get().then(
  (snapshot) => snapshot.docs.forEach((element) {
    
    if(user?.email.toString() ==  (element.data()['email'].toString())){
      userRoomsNums = (element.data()['whichRooms']);
    }
  }));
}

void addRooms(){

  if(userRoomsNums.length > userRooms.length )
  {
    for(int i=0;i<liste.length;i++){
      for(int j=0;j<userRoomsNums.length;j++){
        if(liste[i].roomNumber == userRoomsNums[j]){    
          userRooms.add(liste[i]);
        }
      }
    }
  }
}

class RoomsView extends StatefulWidget {
  const RoomsView({Key? key}) : super(key: key);

  @override
  State<RoomsView> createState() => _RoomsViewState();
}

class _RoomsViewState extends State<RoomsView> {  

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


  Widget listViewBuilder(List liste){

    return Expanded(
      child: ListView.builder(
        itemCount: liste.length,
        itemBuilder: (context,index){
          return LinkedLabelCheckbox(
            room: liste[index],
          );
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    
    addListe();
    refresh();
    addRooms();
    return Scaffold(
      appBar: AppBar(
        title: const Text("Rooms"),
        backgroundColor: const Color.fromARGB(255, 122, 83, 238), 
      ),
      drawer: HouseAppBar(),
      backgroundColor: Colors.grey[300],
      body: 
        RefreshIndicator(
          backgroundColor: Colors.grey[400],
          onRefresh: _refresh,
          child: listViewBuilder(userRooms),
        ),  
    );
  }
}