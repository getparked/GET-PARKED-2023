import 'package:flutter/material.dart';
import 'package:g_p/pages/map.dart';
import 'package:g_p/pages/Home_Screen.dart';
import 'package:g_p/pages/settings.dart';
import 'package:g_p/pages/dataTesting.dart';


class Nav extends StatefulWidget {
  const Nav({super.key});

  
  @override
  _NavState createState() => _NavState();
}

class _NavState extends State<Nav> {
  int _selectedIndex = 0;
  List<Widget> _widgetOptions = <Widget>[
    TTNDataPage(),
    Map(booleanParkingDataList: []),
    Settings1NotificationsWidget(),
  ];


  void _onItemTap(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }





  @override
  Widget build(BuildContext context) {
    return Scaffold(


      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),

        
      ),

      
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[                 // navigatoion bar items
          BottomNavigationBarItem(
            backgroundColor: Colors.black,
            icon: Icon(Icons.home),                             // index 1
            label: 'Home',
            ),

            BottomNavigationBarItem(
            icon: Icon(Icons.map_outlined),
            label: 'Map',                                   // index 2
            ),

            BottomNavigationBarItem(
            icon: Icon(Icons.settings),                             // index 3
            label: 'Settings',
            ),


        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.black,
        onTap: _onItemTap,


        
        ),
      );     
  }
}