import 'package:flutter/material.dart';
import 'package:g_p/format/LotLayout.dart';
import 'package:g_p/format/dataRetrieval.dart';

String jsonURL = "https://storage.googleapis.com/getparked/chwlot1a.json";
String httpHeader = "3a2a6522-9335-491e-addd-63521d380e5d";

class chwlot1 extends StatefulWidget {
   List<bool> CHWLot1Data;
  chwlot1(
      {required this.CHWLot1Data});

  @override
  _chwlot1State createState() => _chwlot1State();
}

class _chwlot1State extends State<chwlot1> {
  ParkingLot? parkingLot;
  Future<ParkingLot>? futureParkingLot;
  Future<List<bool>>? futureParkingData;

  double imageHeight = 1080;
  double imageWidth = 1920;
  int rotation = 0;

   @override
  void initState() {
    super.initState();
    fetchData();
    futureParkingData = GetParkingData(httpHeader);
  }

  Future<void> fetchData() async {
    // Fetch data and update the state
    futureParkingLot = ParkingLot().setupDetailed(jsonURL);
    parkingLot = await futureParkingLot;



  }



  @override
  Widget build(BuildContext context) { //build the UI
     print(widget.CHWLot1Data);
    if (MediaQuery.of(context).orientation == Orientation.portrait) { //asks the screen orientation
      rotation = 1;
    } else {
      rotation = 0;
    }
     int countAvailable = 0;
     int countOccupied = 0;

     for (int i = 0; i < 180; i++) {
       bool value = widget.CHWLot1Data[i];

       if (!value) {
         countAvailable++;
       } else {
         countOccupied++;
       }
     }


    return Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
            leading: IconButton(
              icon: Icon(Icons.arrow_back),
              onPressed: () {
                // Pass back the updated data to the previous screen
                Navigator.pop(context, widget.CHWLot1Data);
              },
            ),
            backgroundColor: Colors.black12,
            title: Text('CHW Lot 1')),
        //

        body: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                child: FutureBuilder<ParkingLot>(
                  future: futureParkingLot,
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return CircularProgressIndicator();
                    } else if (snapshot.hasData) {
                      parkingLot = snapshot.data;
                      return Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(40, 0, 40, 0),
                        child: Container(
                          decoration: BoxDecoration(
                            border: Border.all(
                              width: 4,
                            ),
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: FittedBox(
                            fit: BoxFit.fitHeight,
                            child: RotatedBox(
                              quarterTurns: rotation,
                              child: CustomPaint(
                                size: Size(imageWidth, imageHeight),
                                child: Image.network(parkingLot!.lotURL),
                                // Set the size as per your image dimensions
                                foregroundPainter: RectanglePainter(
                                  parkingLot!.parkingStalls,
                                  imageWidth,
                                  imageHeight,
                                  widget.CHWLot1Data,
                                ),
                              ),
                            ),
                          ),
                        ),
                      );
                    } else {
                      return Text('Error: ${snapshot.error}');
                    }
                  },
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

              ElevatedButton(
                onPressed: () async {
                  List<bool> parkingData = await GetParkingData(httpHeader);
                  setState(() {
                    widget.CHWLot1Data = parkingData;
                  });
                },
                child: Text('Refresh'),
              )
            ],
          ),
        )
    );
  }
}

class RectanglePainter extends CustomPainter {
  final List<ParkingStalls> parkingStalls;
  final double imageWidth;
  final double imageHeight;
  final List<bool> booleanParkingDataList; // List of availability statuses

  RectanglePainter(this.parkingStalls, this.imageWidth, this.imageHeight,
      this.booleanParkingDataList);

  @override
  void paint(Canvas canvas, Size size) {
    for (int i = 0; i < parkingStalls.length; i++) {
      final paint = Paint()..style = PaintingStyle.fill;

      final paint2 = Paint()
        ..color = Colors.black87
        ..style = PaintingStyle.stroke
        ..strokeWidth = 4.0;

      final x = ((parkingStalls[i].x + 2) / imageWidth) * size.width;
      final y = ((parkingStalls[i].y + 2) / imageHeight) * size.height;
      final x2 = (parkingStalls[i].x / imageWidth) * size.width;
      final y2 = (parkingStalls[i].y / imageHeight) * size.height;

      final rect = Rect.fromPoints(Offset(x, y), Offset(x + 27, y + 76));
      final rect2 = Rect.fromPoints(Offset(x2, y2), Offset(x2 + 30, y2 + 80));

      paint.color = booleanParkingDataList[i] ? Colors.red : Colors.green;
      canvas.drawRect(rect, paint);
      canvas.drawRect(rect2, paint2);
    }
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}
