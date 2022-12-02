import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:first_app/views/rooms_view.dart';
import 'package:flutter/material.dart';
import 'manager_view.dart';

class HouseKeeperView extends StatefulWidget {
  const HouseKeeperView({super.key});

  @override
  State<HouseKeeperView> createState() => _HouseKeeperViewState();
}

class _HouseKeeperViewState extends State<HouseKeeperView> {

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

  @override
  Widget build(BuildContext context) {
    getDocId();
    return const RoomsView();

  }
}