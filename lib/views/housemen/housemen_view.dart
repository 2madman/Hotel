import 'package:flutter/material.dart';
import 'package:first_app/Classes/rooms.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '../../main.dart';
import '../../widget/housemen/men_appbar.dart';
import '../../widget/housemen/checkbox.dart';


class HousemenView extends StatefulWidget {
  const HousemenView({super.key});

  @override
  State<HousemenView> createState() => _HousemenViewState();
}

class _HousemenViewState extends State<HousemenView> {
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
    CollectionReference rooms = FirebaseFirestore.instance.collection('Rooms');

    return Scaffold(      
      appBar: AppBar(
        title: const Text("Rooms"),
        backgroundColor: const Color.fromARGB(255, 122, 83, 238), 
      ),
      drawer: HousemenAppBar(),
      backgroundColor: Colors.grey[300],
      body: Column(
        children: [
          const SizedBox(height: 30,),
          listViewBuilder(liste),
        ],
      ),

    );
  }
}