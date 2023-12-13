import 'package:flutter/material.dart';
import 'package:g_p/format/LotLayout.dart';
import 'dart:async';
import 'package:g_p/lots/cbalot1.dart';
import 'package:g_p/lots/chwlot1.dart';
import 'package:g_p/lots/chwlot2.dart';
import 'package:g_p/lots/porta.dart';
import 'package:flutter/foundation.dart';
import 'dart:io';
import "package:g_p/pages/dataTesting.dart";



class Home_Screen extends StatelessWidget {
    Home_Screen({super.key});
    

  final controller = TextEditingController();
 late Future<ParkingLot> futureParklot;

  @override
    void initState() {
    //futureParklot = ParkingLot().setupDetailed();
  }

  @override
  Widget build(BuildContext context) => Scaffold(
    
     appBar: AppBar(
        backgroundColor: Colors.black,
        title:  Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
                Text('Home',
                 style: TextStyle(
                  fontSize: 26,
                  fontWeight: FontWeight.bold,
                  color: Colors.white),
              ),


              SizedBox(width: 8),
               Image.network(
                  'https://storage.googleapis.com/getparked/logo2.png',
                  width: 125,
                  height: 1000,
                  fit: BoxFit.contain,
                ),
          ],
        ),        
      ),



    body: ListView(
  padding: EdgeInsets.symmetric(vertical: 5),
  shrinkWrap: true,
  scrollDirection: Axis.vertical,
  children: [
   
   
   
   
    Padding(          // CBA LOT 1
      padding: EdgeInsetsDirectional.fromSTEB(15, 10, 15, 10),
      child: Container(
        width: 100,
        height: 199,
        decoration: BoxDecoration(
          color: Colors.black12,
          borderRadius: BorderRadius.circular(30),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            InkWell(
              splashColor: Colors.transparent,
              focusColor: Colors.transparent,
              hoverColor: Colors.transparent,
              highlightColor: Colors.transparent,
              onTap: () async {
                Navigator.push(context, MaterialPageRoute(builder: (context) => cbalot1())); ///wtf is tech lot?
              },
              child: ClipRRect(
                borderRadius: BorderRadius.circular(33),
                child: Image.network(
                  'https://storage.googleapis.com/getparked/CBA%20lot1.jpg',
                  width: 425,
                  height: 141,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            
            const Row(
              mainAxisSize: MainAxisSize.max,
              children: [
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(10, 10, 10, 5),
                  child: Text(
                    'CBA lot1',
                    style: TextStyle(
                          fontFamily: 'Urbanist',
                          fontWeight: FontWeight.bold,
                        ),
                  ),
                ),
              ],
            ),
            const Row(
              mainAxisSize: MainAxisSize.max,
              children: [
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(10, 0, 0, 0),
                  child: Text(
                    '47 AVAILABLE SPOTS',
                    style: TextStyle(
                          fontFamily: 'Urbanist',
                        ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    ),
   
  
   
    Padding(          // CHW LOT 1
      padding: EdgeInsetsDirectional.fromSTEB(15, 10, 15, 10),
      child: Container(
        width: 100,
        height: 199,
        decoration: BoxDecoration(
          color: Colors.black12,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            InkWell(
              splashColor: Colors.transparent,
              focusColor: Colors.transparent,
              hoverColor: Colors.transparent,
              highlightColor: Colors.transparent,
              onTap: () async {
              //  Navigator.push(context, MaterialPageRoute(builder: (context) => chwlot1())); ///wtf is tech lot?
                
              },
              child: ClipRRect(
                borderRadius: BorderRadius.circular(33),
                child: FittedBox(
                  child: Image.network(
                  'https://storage.googleapis.com/getparked/CHW%20lot1.jpg',
                  width: 425,
                  height: 141,
                  fit: BoxFit.fill,
                ),
                ),
              ),
            ),
            const Row(
              mainAxisSize: MainAxisSize.max,
              children: [
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(10, 10, 10, 5),
                  child: Text(
                    'CHW lot1',
                    style: TextStyle(
                          fontFamily: 'Urbanist',
                          fontWeight: FontWeight.bold,
                        ),
                  ),
                ),
              ],
            ),
            const Row(
              mainAxisSize: MainAxisSize.max,
              children: [
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(10, 0, 0, 0),
                  child: Text(
                    '47 AVAILABLE SPOTS',
                    style: TextStyle(
                          fontFamily: 'Urbanist',
                        ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    ),
   
  
   
    Padding(          // CHW LOT 2
      padding: EdgeInsetsDirectional.fromSTEB(15, 10, 15, 10),
      child: Container(
        width: 100,
        height: 199,
        decoration: BoxDecoration(
          color: Colors.black12,
          borderRadius: BorderRadius.circular(30),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            InkWell(
              splashColor: Colors.transparent,
              focusColor: Colors.transparent,
              hoverColor: Colors.transparent,
              highlightColor: Colors.transparent,
              onTap: () async {
                Navigator.push(context, MaterialPageRoute(builder: (context) => chwlot2()));
              },
              child: ClipRRect(
                borderRadius: BorderRadius.circular(33),
                child: Image.network(
                  'https://storage.googleapis.com/getparked/CHW%20lot2.jpg',
                  width: 425,
                  height: 141,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            const Row(
              mainAxisSize: MainAxisSize.max,
              children: [
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(10, 10, 10, 5),
                  child: Text(
                    'CHW lot2',
                    style: TextStyle(
                          fontFamily: 'Urbanist',
                          fontWeight: FontWeight.bold,
                        ),
                  ),
                ),
              ],
            ),
            const Row(
              mainAxisSize: MainAxisSize.max,
              children: [
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(10, 0, 0, 0),
                  child: Text(
                    '47 AVAILABLE SPOTS',
                    style: TextStyle(
                          fontFamily: 'Urbanist',
                        ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    ),


     Padding(          // PORT A LOT 
      padding: EdgeInsetsDirectional.fromSTEB(15, 10, 15, 10),
      child: Container(
        width: 100,
        height: 199,
        decoration: BoxDecoration(
          color: Colors.black12,
          borderRadius: BorderRadius.circular(30),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            InkWell(
              splashColor: Colors.transparent,
              focusColor: Colors.transparent,
              hoverColor: Colors.transparent,
              highlightColor: Colors.transparent,
              onTap: () async {
                Navigator.push(context, MaterialPageRoute(builder: (context) => frontlot()));
              },
              child: ClipRRect(
                borderRadius: BorderRadius.circular(33),
                child: Image.network(
                  'https://storage.googleapis.com/getparked/PORTA.png',
                  width: 425,
                  height: 141,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            
            const Row(
              mainAxisSize: MainAxisSize.max,
              children: [
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(10, 10, 10, 5),
                  child: Text(
                    'Port A Lot',
                    style: TextStyle(
                          fontFamily: 'Urbanist',
                          fontWeight: FontWeight.bold,
                        ),
                  ),
                ),
              ],
            ),
            const Row(
              mainAxisSize: MainAxisSize.max,
              children: [
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(10, 0, 0, 0),
                  child: Text(
                    '90 AVAILABLE SPOTS',
                    style: TextStyle(
                          fontFamily: 'Urbanist',
                        ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    ),
   
  
  ],
)
  );

}
