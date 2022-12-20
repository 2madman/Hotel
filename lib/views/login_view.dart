import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:first_app/firebase_options.dart';
import '../main.dart';
import 'housekeeper/housekeeper_view.dart';
import 'manager/manager_view.dart';

class LoginView extends StatefulWidget {
  const LoginView({Key? key}) : super(key: key);

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  late final TextEditingController _email;
  late final TextEditingController _password;

  @override
  void initState() {
    _email = TextEditingController();
    _password = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    _email.dispose();
    _password.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      
      body:FutureBuilder(
        future: Firebase.initializeApp(
                  options: DefaultFirebaseOptions.currentPlatform,
                ),
        builder: (context, snapshot) {
          switch (snapshot.connectionState){
            case ConnectionState.done:
              return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  const Text(
                    "Hello Again!",
                    style: TextStyle(
                      fontWeight: FontWeight.bold, 
                      fontSize: 40),
                    ),
                  const SizedBox(height: 40,),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 25.0),
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.grey[200],
                        border:Border.all(color: Colors.white),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.only(left: 20.0),
                        child: TextField(
                          decoration: const InputDecoration(
                            border: InputBorder.none,
                            hintText: "Email" 
                          ),
                        autocorrect: false,
                        keyboardType: TextInputType.emailAddress,
                        controller: _email,
                        ),
                      )
                    ),
                  ),
                  const SizedBox(height: 5,),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 25.0),
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.grey[200],
                        border:Border.all(color: Colors.white),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.only(left: 20.0),
                        child: TextField(
                          decoration: const InputDecoration(
                            border: InputBorder.none,
                            hintText: "Password" 
                          ),
                          controller: _password,
                          obscureText: true,
                          enableSuggestions: false,
                          autocorrect: false,
                        ),
                      )
                    ),
                  ),
                  const SizedBox(height: 10,),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 25.0),
                    child: Container(
                      padding: const EdgeInsets.all(4),
                      decoration: BoxDecoration(
                      color: Colors.deepPurple,
                      borderRadius: BorderRadius.circular(12),
                      ),
                      child: Center(
                        child: TextButton(
                        onPressed: () async {
                          final email = _email.text;
                          final password = _password.text;  
                          try{
                              await FirebaseAuth.instance
                                .signInWithEmailAndPassword(
                                  email: email,
                                  password: password,);
                              final user = FirebaseAuth.instance.currentUser;

                              for(int i=0;i<allWorkers.length;i++){
                                if(user?.email.toString() == allWorkers[i].email){
                                  if(allWorkers[i].job == "Housekeeper"){
                                    Navigator.of(context).push
                                    (MaterialPageRoute(builder: (BuildContext context){
                                      return const HouseKeeperView();
                                    }));
                                  }
                                  /*else if(allWorkers[i].job == "Housemen"){
                                    return const HouseMenView();
                                  }
                                  else if(allWorkers[i].job == "Supervisor"){
                                    return const SupervisorView();
                                  }*/
                                }
                              }
                          }
                          on FirebaseAuthException catch(e){
                            if(e.code == "user-not-found"){
                              const AlertDialog(title: Text("Error"),);
                            }
                            else{
                              log(e.code);
                            }
                          }
                        },
                        child: const Text(
                          'Login',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                            color: Colors.white
                          ),
                          ),
                        ),
                      )
                    )
                  ),
              
              TextButton(
                onPressed: () {
                },
                child: const Text(
                  'Forgot your password'),
              ),
              /*TextButton(
                onPressed: () {
                  Navigator.of(context).push
                  (MaterialPageRoute(builder: (BuildContext context){
                    return const RegisterView();
                  }));
                },
                child: const Text(
                  'Go to register page.'),
              )*/
            ],
      ); 

      default:
        return Scaffold(
          appBar: AppBar(
            title: const Text("Loading.."),
          ),
          backgroundColor: Colors.grey[300],
        );   
          }
          
        },
      )
    );
  }
}