import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:first_app/views/housekeeper/housekeeper_view.dart';
import 'package:first_app/views/login_view.dart';
import 'package:first_app/views/manager/manager_view.dart';
import 'package:first_app/views/manager/register_view.dart';
import 'package:first_app/widget/appbar.dart';
import 'package:flutter/material.dart';
import 'Classes/rooms.dart';
import 'firebase_options.dart';

int cleaned = 0;
int notCleaned = 0;

Future refresh() async {

    await FirebaseFirestore.instance.collection('Rooms').get().then(
    (snapshot) => snapshot.docs.forEach((element) {
      docIDs.add(element.reference.id);  
      
      for(int i=0;i<10;i++){
        if(liste[i].uid == element.data()['uid']){
          liste[i].roomCleaned = element.data()['roomCleaned'];
          liste[i].initialCleaning = element.data()['initialCleaning'];
          liste[i].someoneCleaning = element.data()['someoneCleaning'];
          
          if(liste[i].roomCleaned == true && liste.length != cleaned+notCleaned){  cleaned++; }
          else if(liste.length != cleaned+notCleaned) { notCleaned++; }
        }
      }
    }));
  }
void main () async{

  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  addListe();
  getDocId();
  await refresh();
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