import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  // define a function to call when you press the button


  // initState is always going to be called first when creating a new page
  @override
  void initState(){ // initialize the state
    super.initState();
    // stick anything else we want set up before building in here
  }

  // build is where we actually shape the page
  @override
  Widget build(BuildContext context){
    return Scaffold(
      backgroundColor: Colors.lightBlue,
      body: Column(
        children: [
          Image.network("https://example.com"),
          Text("hello"),
          //TextButton(onPressed: onPressed, child: Text("click me!"))
        ]
      )
    );
  }

}