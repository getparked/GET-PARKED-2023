import 'package:flutter/material.dart';
import 'package:g_p/pages/Features.dart';
import 'package:g_p/pages/bugreport.dart';

class Settings1NotificationsWidget extends StatefulWidget {
  const Settings1NotificationsWidget({Key? key}) : super(key: key);

  @override
  _Settings1NotificationsWidgetState createState() =>
      _Settings1NotificationsWidgetState();
}

class _Settings1NotificationsWidgetState
    extends State<Settings1NotificationsWidget> {
  bool _switchListTileValue1 = true;
  bool _switchListTileValue2 = false;
  bool _switchListTileValue3 = true;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      backgroundColor: Colors.grey[200],
     appBar: AppBar(
        backgroundColor: Colors.black,
        title:  Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
                Text('Settings',
                 style: TextStyle(
                  fontSize: 26,
                  fontWeight: FontWeight.bold,
                  color: Colors.white),
              ),
              SizedBox(width: 8),
               Image.network(
                  'https://storage.googleapis.com/getparked/logo2.png',
                  width: 125,
                  height: 50,
                  fit: BoxFit.contain,
                ),
          ],
        ),        
      ),
      body: Column(
        mainAxisSize: MainAxisSize.max,
        children: [
          Padding(
            padding: EdgeInsets.fromLTRB(20, 20, 20, 0),
            child: Row(
              mainAxisSize: MainAxisSize.max,
              children: [
                Expanded(
                  child: Text(
                    'Choose your settings.',
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.black,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.fromLTRB(0, 12, 0, 0),
            child: SwitchListTile(
              value: _switchListTileValue1,
              onChanged: (newValue) {
                setState(() {
                  _switchListTileValue1 = newValue;
                });
              },
              title: Text(
                'Location Services',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
              subtitle: Text(
                'Allow us to track your location, this helps keep track of spending and keeps you safe.',
                style: TextStyle(
                  fontSize: 14,
                  color: Color(0xFF8B97A2),
                ),
              ),
              tileColor: Colors.grey[200],
              activeColor: Colors.blue,
              activeTrackColor: Colors.lightBlueAccent,
              dense: false,
              controlAffinity: ListTileControlAffinity.trailing,
              contentPadding: EdgeInsets.fromLTRB(24, 12, 24, 12),
            ),
          ),
          SwitchListTile(
            value: _switchListTileValue2,
            onChanged: (newValue) {
              setState(() {
                _switchListTileValue2 = newValue;
              });
            },
            title: Text(
              'Enable Dark Mode',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
            subtitle: Text(
              'Change the layout for dark mode',
              style: TextStyle(
                fontSize: 14,
                color: Color(0xFF8B97A2),
              ),
            ),
            tileColor: Colors.grey[200],
            activeColor: Colors.blue,
            activeTrackColor: Colors.lightBlueAccent,
            dense: false,
            controlAffinity: ListTileControlAffinity.trailing,
            contentPadding: EdgeInsets.fromLTRB(24, 12, 24, 12),
          ),
          SwitchListTile(
            value: _switchListTileValue3,
            onChanged: (newValue) {
              setState(() {
                _switchListTileValue3 = newValue;
              });
            },
            title: Text(
              'Random SwitchTile',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
            subtitle: Text(
              'Third Setting things',
              style: TextStyle(
                fontSize: 14,
                color: Color(0xFF8B97A2),
              ),
            ),
            tileColor: Colors.grey[200],
            activeColor: Colors.blue,
            activeTrackColor: Colors.lightBlueAccent,
            dense: false,
            controlAffinity: ListTileControlAffinity.trailing,
            contentPadding: EdgeInsets.fromLTRB(24, 12, 24, 12),
          ),


           Padding(
            padding: EdgeInsets.fromLTRB(0, 24, 0, 48),
            child: ElevatedButton(
              onPressed: () {
              
              },
              child: Text('Save Changes'),
              style: ElevatedButton.styleFrom(
                primary: Colors.blue,
                padding: EdgeInsets.symmetric(vertical: 16, horizontal: 32),
                textStyle: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
              ),
            ),
          ),



         
         


          ListTile(
            onTap: () => {
               Navigator.push(context, MaterialPageRoute(builder: (context) => features())),
            },
            title: Text(
              'Submit a Feature',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
            subtitle: Text(
              'Allow us to track your location, this helps keep track of spending and keeps you safe.',
              style: TextStyle(
                fontSize: 14,
                color: Color(0xFF8B97A2),
              ),
            ),
            tileColor: Colors.grey[200],
      
            dense: false,
       
            contentPadding: EdgeInsets.fromLTRB(24, 12, 24, 12),
          ),



         
          ListTile(
            onTap: () => {
               Navigator.push(context, MaterialPageRoute(builder: (context) => Bugreport())),
            },
            title: Text(
              'Report a Bug',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
            subtitle: Text(
              'Allow us to track your location, this helps keep track of spending and keeps you safe.',
              style: TextStyle(
                fontSize: 14,
                color: Color(0xFF8B97A2),
              ),
            ),
            tileColor: Colors.grey[200],
      
            dense: false,
       
            contentPadding: EdgeInsets.fromLTRB(24, 12, 24, 12),
          ),

        
        ],
      ),
    );
  }
}