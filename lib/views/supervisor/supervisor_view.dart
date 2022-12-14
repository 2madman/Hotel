import 'package:flutter/material.dart';
import 'package:first_app/Classes/rooms.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '../../main.dart';
import '../../widget/supervisor/checkbox4.dart';
import '../../widget/supervisor/supervisor_appbar.dart';

class SupervisorView extends StatefulWidget {
  const SupervisorView({super.key});

  @override
  State<SupervisorView> createState() => _SupervisorViewState();
}

class _SupervisorViewState extends State<SupervisorView> {
  
  Future refresh() async {

    await FirebaseFirestore.instance.collection('Rooms').get().then(
    (snapshot) => snapshot.docs.forEach((element) {

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
        itemCount: liste.length % 2 == 0 ? liste.length ~/ 2 : liste.length ~/ 2 + 1,
        itemBuilder: (_, index) {
          return Row(
            children: [
              LinkedLabelCheckbox3(
                room: liste[index*2],
              ),
              if (index * 2 +1+ 1 <= liste.length)
                LinkedLabelCheckbox3(
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
      drawer: SupervisorAppBar(),
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