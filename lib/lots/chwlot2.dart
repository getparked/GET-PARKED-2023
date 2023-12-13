import 'package:flutter/material.dart';



class chwlot2 extends StatelessWidget {
   int countAvailable = 10; // Replace with your actual count
  int countOccupied = 5; // Replace with your actual count

 @override
 Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black12,
        title: Text('CHW lot2')
      ),
       body: SafeArea(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        color: Colors.black26,
                      ),
                      child: FittedBox(
                        child: Image.network(
                          'https://storage.googleapis.com/getparked/CHW%20lot2.jpg',
                            fit: BoxFit.none,
                          height: 600,
                        ),
                      ),
                    ),
                    
                                          Row(
                 // mainAxisSize: MainAxisSize.max,
                 mainAxisAlignment: MainAxisAlignment.center,
                 //crossAxisAlignment: CrossAxisAlignment.end,
                 children: [
                   Center(

                     child: Text(
                       'Parking Lot Availability',
                       style: TextStyle(
                         fontSize: 22,
                         fontFamily: 'Readex Pro',
                         color: Colors.black,
                         fontWeight: FontWeight.w800,
                       ),
                     ),
                   ),
                 ],
               ),
               Row(
                 mainAxisSize: MainAxisSize.max,
                 mainAxisAlignment: MainAxisAlignment.center,
                 crossAxisAlignment: CrossAxisAlignment.end,
                 children: [
                   Padding(
                     padding: EdgeInsetsDirectional.fromSTEB(0, 12, 0, 8),
                     child: Text(
                       'Available: ',
                       style: TextStyle(
                         fontFamily: 'Readex Pro',
                         color: Colors.black,
                         fontWeight: FontWeight.w600,
                       ),
                     ),
                   ),
                   Padding(
                     padding: EdgeInsetsDirectional.fromSTEB(0, 4, 0, 4),
                     child: Text(
                       '$countAvailable',
                       style: TextStyle(
                         fontFamily: 'Readex Pro',
                         color: Color(0xFF5AEF39),
                       ),
                     ),
                   ),
                 ],
               ),
               Row(
                 mainAxisSize: MainAxisSize.max,
                 mainAxisAlignment: MainAxisAlignment.center,
                 children: [
                   Padding(
                     padding: EdgeInsetsDirectional.fromSTEB(0, 4, 0, 4),
                     child: Text(
                       'Occupied: ',
                       style: TextStyle(
                         fontFamily: 'Readex Pro',
                         color: Colors.black,
                         fontWeight: FontWeight.w600,
                       ),
                     ),
                   ),
                   Padding(
                     padding: EdgeInsetsDirectional.fromSTEB(0, 4, 0, 4),
                     child: Text(
                       '$countOccupied',
                       style: TextStyle(
                         fontFamily: 'Readex Pro',
                         color: Color(0xFFEF393C),
                       ),
                     ),
                   ),
                  
                 ],
               ),
               Row(
                 mainAxisSize: MainAxisSize.max,
                 mainAxisAlignment: MainAxisAlignment.center,
                 children: [
                   Padding(
                     padding: EdgeInsetsDirectional.fromSTEB(0, 4, 0, 4),
                     child: Text(
                       'Handicapped:',
                       textAlign: TextAlign.center,
                       style: TextStyle(
                         fontFamily: 'Readex Pro',
                         color: Colors.black,
                         fontWeight: FontWeight.w600,
                       ),
                     ),
                   ),
                   Padding(
                     padding: EdgeInsetsDirectional.fromSTEB(0, 4, 0, 4),
                     child: Text(
                       ' 3',
                       textAlign: TextAlign.center,
                       style: TextStyle(
                         fontFamily: 'Readex Pro',
                         color: Colors.blueGrey,
                         fontWeight: FontWeight.normal,
                       ),
                     ),
                   ),
                 ],
               ),
                
             ],
             
           ),
           
         )
     );
   }
}