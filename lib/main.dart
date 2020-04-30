import 'dart:async';
import 'package:flutter/material.dart';
import 'package:trippy_tales/onboarding.dart';
import 'package:flutter/cupertino.dart';
import 'register.dart';
import 'login.dart';
import 'homepage.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
void main()=>runApp(MyApp());
class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'TRIPPY TALES',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: SplashScreen(),
      routes: <String ,WidgetBuilder>{
        '/signup':(BuildContext context)=>new Register(),
        '/login':(BuildContext context)=> new LoginScreen(),
        '/homepage':(BuildContext context)=> new HomeScreen(),
      },
    );
  }
}
class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {


  @override
  void initState() {
//    FirebaseAuth.instance
//        .currentUser()
//        .then((currentUser) => {
//      if (currentUser == null)
//        {Navigator.pushReplacementNamed(context, "/login")}
//      else
//        {
//          Firestore.instance
//              .collection("users")
//              .document(currentUser.uid)
//              .get()
//              .then((DocumentSnapshot result) =>
//              Navigator.pushReplacement(
//                  context,
//                  MaterialPageRoute(
//                      builder: (context) => HomeScreen())))
//              .catchError((err) => print(err))
//        }
//    })
//        .catchError((err) => print(err));
//    super.initState();
    Timer(Duration(seconds: 5), ()=> Navigator.of(context).pushReplacement(MaterialPageRoute(
        builder: (BuildContext context) => OnboardingScreen())));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: <Widget>[
          Container(
            decoration: BoxDecoration(color: Colors.white),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Expanded(
                flex: 2,
                child: Container(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      CircleAvatar(
                        backgroundColor: Colors.teal[400],
                        radius: 50.0,
                        child: Icon(
                          Icons.card_travel,
                          color: Colors.white,
                          size: 50.0,
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: 10.0),
                      ),
                      Text(
                        "TRIPPY TALES",
                        style: TextStyle(
                            color: Colors.teal[400],
                            fontWeight: FontWeight.bold,
                            fontSize: 24.0),
                      )
                    ],
                  ),
                ),
              ),
              Expanded(
                flex: 1,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    CircularProgressIndicator(valueColor: new AlwaysStoppedAnimation<Color>(Colors.teal[100]),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 20.0),
                    ),
                    Text(
                      "Life is short and the world is wide.\n You better get started.",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 18.0,
                          color: Colors.teal[400]),
                    )
                  ],
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}