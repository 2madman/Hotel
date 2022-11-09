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
                    "Registering Employee",
                    style: TextStyle(
                      fontWeight: FontWeight.bold, 
                      fontSize: 35),
                    ),
                  const SizedBox(height: 80,),
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
                        keyboardType: TextInputType.emailAddress,
                        controller: _email,
                        ),
                      )
                    ),
                  ),
                  const SizedBox(height: 10,),
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
                              final userCredential = await FirebaseAuth.instance
                                .createUserWithEmailAndPassword(
                                  email: email, 
                                  password: password);
                              print(userCredential);
                              Navigator.of(context).push
                              (MaterialPageRoute(builder: (BuildContext context){
                                return const LoginView();
                              }));
                          }
                          on FirebaseAuthException catch(e){
                            print(e.code);
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