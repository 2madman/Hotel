import 'dart:developer';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:first_app/Classes/housekeeper.dart';
import 'package:first_app/views/housekeeper/housekeeper_view.dart';
import 'package:first_app/views/login_view.dart';
import 'package:first_app/views/manager/manager_view.dart';
import 'package:first_app/views/manager/register_view.dart';
import 'package:first_app/widget/appbar.dart';
import 'package:first_app/firebase_options.dart';
import 'package:flutter/material.dart';
import 'Classes/rooms.dart';
import 'Classes/worker.dart';

int cleaned = 0;
int notCleaned = 0;
var allWorkersNames = [];
var allWorkersIDs = [];
var allWorkersEmails = [];
var allWorkersJobs = [];
var allWorkers = [];
var notCleanedRooms = [];
int sizeUsers = 0;
int sizeRooms = 0;

Future refresh() async {

  
  await FirebaseFirestore.instance.collection('Rooms').get().then(
    (snapshot) => snapshot.docs.forEach((element) {
    
    sizeRooms = snapshot.docs.length;
    docIDs.add(element.reference.id);  
    
    for(int i=0;i<sizeRooms;i++){
      if(liste[i].uid == element.data()['uid']){
        liste[i].roomCleaned = element.data()['roomCleaned'];
        liste[i].initialCleaning = element.data()['initialCleaning'];
        liste[i].someoneCleaning = element.data()['someoneCleaning'];
        liste[i].someoneAlreadyCleaning = element.data()['someoneAlreadyCleaning'];
        
        if(liste[i].roomCleaned == true && liste.length != cleaned+notCleaned){  cleaned++; }
        else if(liste.length != cleaned+notCleaned) { notCleaned++; }
      }
    }
    })
  );
}

Future allWorker() async {

  await FirebaseFirestore.instance.collection('Users').get().then(
  (snapshot) => snapshot.docs.forEach((element) {
    
    sizeUsers = snapshot.docs.length;
    allWorkersNames.add(element.data()['name'].toString());
    allWorkersIDs.add(element.data()['id'].toString());
    allWorkersEmails.add(element.data()['email'].toString());
    allWorkersJobs.add(element.data()['job'].toString());
      

  }));
}

void createWorkers(){

  for(int i=0;i<sizeUsers;i++){
    allWorkers.add(HouseKeeper(allWorkersNames[i],allWorkersIDs[i],allWorkersJobs[i],allWorkersEmails[i]));
  }

}

void notCleanedRoom(){

  for(int i=0;i<liste.length;i++){
    if(liste[i].someoneCleaning == false){
      notCleanedRooms.add(liste[i]);
    }
  }

}

Future<void> addEvery() async {
  

  for(int i=0;i<allWorkers.length;i++){

    await FirebaseFirestore.instance.collection('Users').add({
      'name': allWorkers[i].name,
      'id': allWorkers[i].id,
      'email': allWorkers[i].email,
      'whichRooms': allWorkers[i].whichRooms,
      'job' : allWorkers[i].job,
    });

  }

}


void main () async{

  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  
  name = nameApply();
  await allWorker();
  createWorkers();
  await addEvery();  
  addListe();
  getDocId();
  await refresh();
  notCleanedRoom();
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: FirstPage(),
    );
  }
}

class FirstPage extends StatelessWidget {
  const FirstPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(        
      future:Firebase.initializeApp(
                options: DefaultFirebaseOptions.android,
              ),
      builder: (context, snapshot) {
        switch (snapshot.connectionState){
          case ConnectionState.done:
            final user = FirebaseAuth.instance.currentUser;
            
            if(user != null){
              for(int i=0;i<allWorkers.length;i++){

                if(user.email.toString() == allWorkers[i].email){

                  if(allWorkers[i].job == "Housekeeper"){
                    return const HouseKeeperView();
                  }
                  /*else if(allWorkers[i].job == "Housemen"){
                    return const HouseMenView();
                  }
                  else if(allWorkers[i].job == "Supervisor"){
                    return const SupervisorView();
                  }*/
                }
              }
              
              return const  ManagerView();
            }
            else{
              return const LoginView();
            }
          default:
            return const CircularProgressIndicator();
        }
      }
    );
  }
}