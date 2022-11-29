import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:first_app/Backend/get_room.dart';
import 'package:flutter/material.dart';
import '../widget/appbar.dart';

List <String> docIDs = [];

Future getDocId() async {

    await FirebaseFirestore.instance.collection('Rooms').get().then(
    (snapshot) => snapshot.docs.forEach((element) {
      docIDs.add(element.reference.id);  
    }));
  
  }


class HouseKeeperView extends StatefulWidget {
  const HouseKeeperView({super.key});

  @override
  State<HouseKeeperView> createState() => _HouseKeeperViewState();
}

class _HouseKeeperViewState extends State<HouseKeeperView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("House Keeper"),
      ),
      backgroundColor: Colors.grey[300],
      drawer: NavigationDrawerWidget(),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children:[ 
            Expanded(
              child: FutureBuilder(
                future: getDocId(),
                builder:(context, snapshot) {
                  return ListView.builder(
                    itemCount: docIDs.length,
                    itemBuilder: (context,index){
                      return ListTile(
                        title: GetRoomCleaned(documentId: docIDs[index]),
                      );
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
    
    );
  }
}