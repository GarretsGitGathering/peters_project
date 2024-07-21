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
  bool _obscureText = true;

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
      body: Center(
        child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          TextField(
            decoration: InputDecoration(
              labelText: "Email"
            ),
            onChanged: (input) {
              email = input;
            },
          ),
          TextField(
            decoration: InputDecoration(
                labelText: "Password",
                suffixIcon: GestureDetector(
                  onTap: () {
                    setState(() {
                      _obscureText = !_obscureText;
                    });
                    child: Icon(
                      _obscureText ? Icons.visibility_off : Icons.visibility,
                    );
                  }
                )
            ),
            obscureText: _obscureText,
            onChanged: (input) {
              password = input;
            },
          ),
          ElevatedButton(
              onPressed: () async {
                final status = await signIn(email, password);
                if (status){
                  Navigator.push(context, MaterialPageRoute(builder: (context) => RoutePage()));
                }else{
                  showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return AlertDialog(
                          title: Text("Sorry. Something went wrong: " + status),
                          actions: <Widget>[
                            TextButton(
                                onPressed: () {
                                  Navigator.of(context).pop();
                                },
                                child: Text("close")
                            )
                          ],
                        );
                      }
                  );
                }
              },
              child: Text("Sign In"))
        ],
      )
    )
    );
  }
}
