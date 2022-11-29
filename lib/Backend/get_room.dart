import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:first_app/views/housekeeper_view.dart';
import 'package:flutter/material.dart';

import '../Classes/rooms.dart';


class GetRoomCleaned extends StatelessWidget {
  
  
  final String documentId;
  GetRoomCleaned({required this.documentId});

  @override
  Widget build(BuildContext context) {

    CollectionReference users = FirebaseFirestore.instance.collection('Rooms');

    return FutureBuilder<DocumentSnapshot>(
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
    );
  }
}