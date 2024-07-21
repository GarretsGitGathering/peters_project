import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:peters_project/home_screen.dart';
import 'package:peters_project/route_page.dart';

class Signin extends StatefulWidget {
  const Signin({super.key});

  @override
  State<Signin> createState() => _SigninState();
}

class _SigninState extends State<Signin> {
  String email = '';
  String password = '';

  Future signIn(String email, String password) async {
    final FirebaseAuth _auth = FirebaseAuth.instance;
    try {
      await _auth.signInWithEmailAndPassword(email: email, password: password);
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
        title: Text('Login page'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(25),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'assets/logo.png',
              height: 100,
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
            TextButton(
              child: const Text("Forget password?"),
              onPressed: () {},
            ),
            ElevatedButton(
              onPressed: () async {
                bool authenticated = await signIn(email, password);
                if (authenticated != true) {
                  showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return AlertDialog(
                            title: Text("Your email or password is invalid!"),
                            actions: <Widget>[
                              TextButton(
                                  child: Text("Close"),
                                  onPressed: () {
                                    Navigator.of(context).pop();
                                  }),
                            ]);
                      });
                } else {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => RoutePage(),
                    ),
                  );
                };
              },
              child: const Text('Login'),
            ),
          ],
        ),
      ),
    );
  }
}