import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:first_app/views/login_view.dart';
import 'package:first_app/views/register_rooms.dart';
import 'package:first_app/views/register_view.dart';
import 'package:flutter/material.dart';
import 'firebase_options.dart';
import 'views/housekeeper_view.dart';


void main() {
  WidgetsFlutterBinding.ensureInitialized;
  runApp(const MyApp());
}


class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}


class _MyAppState extends State<MyApp> {
  
  List<String> docIDs = [];

  Future getDocId() async {

    await FirebaseFirestore.instance.collection('Users').get().then(
          (snapshot) => snapshot.docs.forEach((document) {
            docIDs.add(document.reference.id);
          }),
        );
  }

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
                return HouseKeeperView();
              }
              else{
                return RegisterRoomsView();
              }
            default:
              return const CircularProgressIndicator();
          }
        }
      );
  }
}