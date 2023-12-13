import 'package:flutter/material.dart';
import 'package:g_p/pages/dataTesting.dart';
import 'package:g_p/pages/nav.dart';
import 'package:flutter/services.dart';
import 'package:g_p/pages/Home_Screen.dart';
import 'package:g_p/pages/nav.dart';
import '../pages/IntroScreen.dart';



void main() {
  runApp(MyApp());
  SystemChrome.setSystemUIOverlayStyle(
    SystemUiOverlayStyle(
      statusBarColor: Colors.black,
      systemNavigationBarColor: Colors.black,



    ),
  );
}

class MyApp extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Get Parked App',
      debugShowCheckedModeBanner: false,
      home: Nav(),   
    );
  }
}