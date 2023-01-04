import 'dart:developer';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:first_app/main.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:first_app/firebase_options.dart';
import '../../Classes/housekeeper.dart';
import 'manager_view.dart';

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
  String dropValue = "Job";

  @override
  void initState() {
    dropValue = jobs[0];
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
  
  Future addUserDetails(String name,String email,String id,String job) async{

    CollectionReference users = FirebaseFirestore.instance.collection('Users');
  
    users
    .doc(name)
    .set
      ({
        'name': name,
        'id': id,
        'email': email,
        'job' :job,
        'whichRooms' : [],
      });

  }


  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      resizeToAvoidBottomInset: false,
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
                        padding: const EdgeInsets.only(right: 120.0),
                        child: DropdownButton<String>(
                          value: dropValue,
                          elevation: 16,
                          onChanged: (String? value) {
                            setState(() {
                              dropValue = value!;
                            });
                          },
                          items: jobs.map<DropdownMenuItem<String>>((String value) {
                            return DropdownMenuItem<String>(
                              value: value,
                              child: Text(value),
                            );
                          }).toList(),
                        ),
                      ),
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
                          final name = _name.text;
                          final id = _id.text;
                          
                          try{
                                await FirebaseAuth.instance
                                  .createUserWithEmailAndPassword(
                                    email: email, 
                                    password: password
                                );
                                                                
                                addUserDetails(
                                  name,email,id,dropValue
                                );

                                if(dropValue == "Housekeeper"){
                                  housekeepers.add(HouseKeeper(name,id,dropValue,email,[]));
                                }
                                if(dropValue == "Housemen"){
                                  housemens.add(HouseKeeper(name,id,dropValue,email,[]));
                                }
                                if(dropValue == "Supervisor"){
                                  supervisors.add(HouseKeeper(name,id,dropValue,email,[]));
                                }
                                if(dropValue == "Housekeeper" || dropValue == "Housemen"){
                                  houseWorkers.add(HouseKeeper(name,id,dropValue,email,[]));
                                  workersExManager.add(HouseKeeper(name,id,dropValue,email,[]));
                                  allWorkers.add(HouseKeeper(name,id,dropValue,email,[]));
                                
                                }
                                else{
                                  allWorkers.add(HouseKeeper(name,id,dropValue,email,[]));
                                  workersExManager.add(HouseKeeper(name,id,dropValue,email,[]));
                                }
                                
                                

                                Navigator.of(context).pushAndRemoveUntil
                                  (MaterialPageRoute(
                                    builder: (context)=> const ManagerView()
                                  ),(route)=>false
                                );                                                            

                                showDialog
                                ( context: context,
                                  builder:(context) =>AlertDialog(
                                  title: const Text("Operation is succesfull"),
                                  actions: [
                                    TextButton(
                                      onPressed: () => Navigator.pop(context, 'OK'),
                                      child: const Text('OK'),
                                    ),
                                  ],                                      
                                ));
                              }
                          
                          on FirebaseAuthException catch(e){
                             showDialog
                                ( context: context,
                                  builder:(context) =>AlertDialog(
                                  title: const Text("Operation is unsuccesfull."),
                                  content: Text(e.code.toString()),
                                  actions: [
                                    TextButton(
                                      onPressed: () => Navigator.pop(context, 'OK'),
                                      child: const Text('OK'),
                                    ),
                                  ],                                      
                                ));
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