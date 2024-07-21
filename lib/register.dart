import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:peters_project/route_page.dart';

class Register extends StatefulWidget {
  const Register({super.key});

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  String email = '';
  String password = '';
  String password2 = '';
  bool _obscureText = true;

  Future signUp(String email, String password) async {
    final FirebaseAuth _auth = FirebaseAuth.instance;
    try {
      await _auth.createUserWithEmailAndPassword(email: email, password: password);
      return true;
    } on FirebaseAuthException catch (error) {
      return error.message;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text('Register page'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(25),
        child: Column(
          //mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            SizedBox(
              height: 20,
            ),
            Image.asset(
              'assets/logo.png',
              height: 100,
            ),
            SizedBox(
              height: 20,
            ),
            SizedBox(
              height: 20,
            ),
            TextField(
              obscureText: false,
              decoration: InputDecoration(
                  border: OutlineInputBorder(), labelText: 'Email'),
              onChanged: (String newEntry) {
                print("Email is changed $newEntry");
                email = newEntry;
              },
            ),
            SizedBox(height: 20),
            TextField(
              obscureText: true,
              decoration: InputDecoration(
                  border: OutlineInputBorder(), labelText: 'Password'),
              onChanged: (String newEntry) {
                print("Password is changed $newEntry");
                password = newEntry;
              },
            ),
            TextField(
              obscureText: true,
              decoration: InputDecoration(
                  border: OutlineInputBorder(), labelText: 'Re-input Password'),
              onChanged: (String newEntry) {
                print("Password2 is changed $newEntry");
                password2 = newEntry;
              },
            ),
            TextButton(
              child: const Text("Already have an account?"),
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => LoginPage()));
              },
            ),
            ElevatedButton(
                onPressed: () {
                  // if(password.length < 6 || password2.length < 6){
                  //   showDialog(
                  //       context: context,
                  //       builder: (BuildContext context) {
                  //         return AlertDialog(
                  //             title: const Text("Password has to be more than 6 characters"),
                  //             actions: <Widget>[
                  //               TextButton(
                  //                 child: const Text("Close"),
                  //                 onPressed: () {
                  //                   Navigator.of(context).pop();
                  //                 },
                  //               )
                  //             ]);
                  //       });
                  // }
                  if (password == password2) {
                    signUp(email, password);
                    /////////////////////////////////////////////hw
                  } else {
                    showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return AlertDialog(
                              title: const Text("Your password don't match!"),
                              actions: <Widget>[
                                TextButton(
                                  child: const Text("Close"),
                                  onPressed: () {
                                    Navigator.of(context).pop();
                                  },
                                )
                              ]);
                        });
                  }
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const routePage()));
                },
                //call the signIn function and pass the username and password, also redirect the user to the homescreen

                child: const Text("Register")),
          ],
        ),
      ),
    );
  }
}
