import 'dart:developer';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:first_app/firebase_options.dart';
import './login_view.dart';


class RegisterView extends StatefulWidget {
  const RegisterView({Key? key}) : super(key: key);

  @override
  State<RegisterView> createState() => _RegisterViewState();
}

class _RegisterViewState extends State<RegisterView> {
  
  late final TextEditingController _email;
  late final TextEditingController _password;
  late final TextEditingController _name;
  late final TextEditingController _id;

  List<String> jobs =["Housekeeper","Housemen","Supervisor"];

  @override
  void initState() {
    _email = TextEditingController();
    _password = TextEditingController();
    _name = TextEditingController();
    _id = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    _name.dispose();
    _email.dispose();
    _password.dispose();
    _id.dispose();
    super.dispose();
  }
  
  Future addUserDetails(String name,String email,int id) async{

    await FirebaseFirestore.instance.collection('Users').add({
      'name': name,
      'id': id,
      'email': email,
    });
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
                    "Registering Employee",
                    style: TextStyle(
                      fontWeight: FontWeight.bold, 
                      fontSize: 35),
                    ),
                  const SizedBox(height: 30,),
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
                            hintText: "Name" 
                          ),
                        autocorrect: false,
                        controller: _name,
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
                            hintText: "Id" 
                          ),
                        autocorrect: false,
                        controller: _id,
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
                      ),
                    ),
                  ),
                  /*const SizedBox(height: 5,),
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
                        child: TextButton(
                          child: const Text("Job"),
                          onPressed: () {},
                        ),
                      )
                    ),
                  ),*/
                  //useri backende kaydet,sonra emailini karşılaştırıp ordan işini bul.
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
                          final name = _name.text;
                          final id = _id.text;
                          
                          try{
                                await FirebaseAuth.instance
                                  .createUserWithEmailAndPassword(
                                    email: email, 
                                    password: password
                                );

                                addUserDetails(
                                  name,email,int.parse(id)
                                );

                                Navigator.of(context).push
                                (MaterialPageRoute(builder: (BuildContext context){
                                  return const LoginView();
                                }));
                              }
                          
                          on FirebaseAuthException catch(e){
                            log(e.code);
                          }
                        },
                        child: const Text(
                          'Register',
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
                /*TextButton(
                onPressed: () {
                  Navigator.of(context).push
                  (MaterialPageRoute(builder: (BuildContext context){
                    return const LoginView();
                  }));
                },
                  child: const Text(
                      'Already registered'),
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