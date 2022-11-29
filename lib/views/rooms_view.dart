import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:first_app/Classes/rooms.dart';
import '../widget/linked_check.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class RoomsView extends StatefulWidget {
  const RoomsView({Key? key}) : super(key: key);

  @override
  State<RoomsView> createState() => _RoomsViewState();
}

class _RoomsViewState extends State<RoomsView> {  

  Future<void> _refresh(){
    CollectionReference users = FirebaseFirestore.instance.collection('Rooms');

    /*return FutureBuilder<DocumentSnapshot>(
      future: users.doc(documentId).get(),
      builder: ((context, snapshot){
        if(snapshot.connectionState == ConnectionState.done){
          Map<String, dynamic> data = 
            snapshot.data!.data() as Map<String, dynamic>;

          addListe();

          for(int i=0;i<liste.length;i++){
            if(liste[i].uid == data['uid']){
              liste[i].roomCleaned = data['roomCleaned'];
              liste[i].initialCleaning = data['initialCleaning'];
              liste[i].someoneCleaning = data['someoneCleaning'];
            }

          }
        }
        return const Text('');
      }),      
    );*/
    
    return Future.delayed(
      const Duration(seconds: 1),
    );
  }

  Widget ListViewBuilder(List liste){

    return 
      Expanded(
        child: ListView.builder(
          itemCount: 10,
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
    return Scaffold(
      appBar: AppBar(
        title: const Text("Rooms"),
        backgroundColor: const Color.fromARGB(255, 122, 83, 238), 
      ),
      backgroundColor: Colors.grey[300],
      body: 
        RefreshIndicator(
          backgroundColor: Colors.grey[400],
          onRefresh: _refresh,
          child: ListViewBuilder(liste),
        ),  
    );
  }
}