import 'package:flutter/material.dart';
import 'package:first_app/Classes/rooms.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '../widget/manager_rooms_check.dart';
import '../widget/managerappbar.dart';

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
          itemCount: 10,
          itemBuilder: (context,index){
            return ManagerCheckbox(
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
    return Scaffold(
      appBar: AppBar(
        title: const Text("Rooms"),
        backgroundColor: const Color.fromARGB(255, 122, 83, 238), 
      ),
      drawer: ManagerAppBar(),
      backgroundColor: Colors.grey[300],
      body: 
        RefreshIndicator(
          backgroundColor: Colors.grey[400],
          onRefresh: _refresh,
          child: listViewBuilder(liste),
        ),  
    );
  }
}