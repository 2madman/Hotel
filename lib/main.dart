import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:first_app/views/login_view.dart';
import 'package:first_app/views/register_view.dart';
import 'package:flutter/material.dart';
import 'firebase_options.dart';
import 'views/housekeeper_view.dart';

void main () {

  WidgetsFlutterBinding.ensureInitialized;
  //Firebase.initializeApp();
  runApp(const MyApp());
}


class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  
  /*Future getRoomList() async{

    FirebaseDatabase.instance.ref("Rooms").onValue.listen((event) {

      final data =
      Map<String, dynamic>.from(event.snapshot.value as Map,);

      data.forEach((key, value) {
        print("$value");
      });
    });
  }*/


  @override
  Widget build(BuildContext context) {
    
    //getRoomList();
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: FirstPage(),
    );
  }
}

class FirstPage extends StatelessWidget {
  const FirstPage({Key? key}) : super(key: key);

  /*Future getDocId() async {

    try{
      await FirebaseFirestore.instance.collection('Rooms').get().then(
        (snapshot) => snapshot.docs.forEach((document) {
          //docIDs.add(document.reference.id);
        }),
      );
    }catch(e){
      print(e.toString());
      print("aslkdmasdlkasmdklasmda");
    }
  
  }*/

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
              return LoginView();
            }
          default:
            return const CircularProgressIndicator();
        }
      }
    );
  }
}