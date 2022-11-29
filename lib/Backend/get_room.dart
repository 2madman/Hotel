import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:first_app/views/housekeeper_view.dart';
import 'package:flutter/material.dart';

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
          return Text('initialCleaning: ${data['initialCleaning']}\n'
                      'roomCleaned: ${data['roomCleaned']}\n'
                      'someoneCleaning: ${data['someoneCleaning']}\n'
                    );
        
        }
        return const Text('loading');
      }),      
    );
  }
}