import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:g_p/lots/cbalot1.dart';
import 'package:g_p/lots/chwlot1.dart';
import 'package:g_p/lots/chwlot2.dart';
import 'package:g_p/lots/porta.dart';
import 'dart:io';
import 'package:g_p/lots/hotWheels.dart';
import 'package:g_p/format/dataRetrieval.dart';
import 'dart:convert';
import 'dart:typed_data';
import 'package:http/http.dart' as http;

class TTNDataPage extends StatefulWidget {
  @override
  _TTNDataPageState createState() => _TTNDataPageState();
}

class _TTNDataPageState extends State<TTNDataPage> {
  String HotWheelsHeader = "252571ba-369d-465e-abad-690a5670b2ad";
  String CHWHeader = "3a2a6522-9335-491e-addd-63521d380e5d";

  final controller = TextEditingController();

  //List<int> binaryList = [];
  //List<bool> booleanParkingDataList = [true,];
  List<bool> hotWheelsData = List.filled(24, false);

  List<bool> CHWLot1Data = List.filled(180, false);


  List<bool> getHotWheelsData() {
    //  print(hotWheelsData);
    return hotWheelsData;
  }

  List<bool> getCHWLot1Data() {
    // print(CHWLot1Data);
    return CHWLot1Data;
  }
  bool isLoading = true;

  @override
  void initState() {
    fetchData();
    super.initState();

  }
  Future<void> fetchData() async {
    try {
      // Set isLoading to true when starting to fetch data
      setState(() {
        isLoading = true;
      });

      await GetParkingData1(HotWheelsHeader);
      await GetParkingData2(CHWHeader);

      // Set isLoading to false when data fetching is complete
      setState(() {
        isLoading = false;
      });
    } catch (e) {
      print('Error fetching data: $e');
      // Handle the error.
      setState(() {
        isLoading = false;
      });
    }
  }
  GetParkingData1(String authorization) async {
    //Function for getting parking data from tago.io and converting to booleon string

    try {
      String url =
          "https://api.tago.io/data?variable=payload&query=last_value"; //this url also encodes which specific data we would like with the ?variable&query
      final response = await http.get(Uri.parse(url),
          //uses http.get to recieve parking data and uses uri to create objects from a string
          headers: {
            HttpHeaders.authorizationHeader:
                authorization, //password required by tago.io
          });
      //for testing
      if (response.statusCode == 200) {
        //if we recieve a valid response

        // Parse JSON and extract payload
        Map<String, dynamic> jsonResponse =
            json.decode(response.body); //map the contents of the string

        if (jsonResponse.containsKey("result") && //is this what we expected?
            jsonResponse["result"] is List &&
            jsonResponse["result"].isNotEmpty) {
          String hexPayload = jsonResponse["result"][0][
              "value"]; //we recieve a 'result' that has a 'value' we want the first one of that
          print(hexPayload);
          String binaryPayload = hexToBinary(
              hexPayload); //converts to a string of 1's and 0's from hex
          setBooleanParkingDataList1(
              binaryPayload); //converts the string to booleon equivilant

          // Set the payload to the state variable

          // Return the payload
          return hexPayload;
        } else {
          print("else");
          throw Exception('No valid result in the response');
        }
      } else {
        throw Exception('Failed to load data');
      }
    } catch (e) {
      print(e);
      throw e; // Rethrow the exception to handle it in the UI
    }
  }

  GetParkingData2(String authorization) async {
    //Function for getting parking data from tago.io and converting to booleon string

    try {
      String url =
          "https://api.tago.io/data?variable=payload&query=last_value"; //this url also encodes which specific data we would like with the ?variable&query
      final response2 = await http.get(Uri.parse(url),
          //uses http.get to recieve parking data and uses uri to create objects from a string
          headers: {
            HttpHeaders.authorizationHeader:
                authorization, //password required by tago.io
          });
      // print(response2.body); //for testing
      if (response2.statusCode == 200) {
        //if we recieve a valid response

        // Parse JSON and extract payload
        Map<String, dynamic> jsonResponse =
            json.decode(response2.body); //map the contents of the string

        if (jsonResponse.containsKey("result") && //is this what we expected?
            jsonResponse["result"] is List &&
            jsonResponse["result"].isNotEmpty) {
          String hexPayload = jsonResponse["result"][0][
              "value"]; //we recieve a 'result' that has a 'value' we want the first one of that
          print(hexPayload);
          String binaryPayload = hexToBinary(
              hexPayload); //converts to a string of 1's and 0's from hex
          setBooleanParkingDataList2(
              binaryPayload); //converts the string to booleon equivilant

          // Set the payload to the state variable

          // Return the payload
          return hexPayload;
        } else {
          print("else");
          throw Exception('No valid result in the response');
        }
      } else {
        throw Exception('Failed to load data');
      }
    } catch (e) {
      print(e);
      throw e; // Rethrow the exception to handle it in the UI
    }
  }

  void setBooleanParkingDataList1(String binaryPayload) {
    List<bool> updatedList = binaryPayload //create list of type bool
        .split('') //split the string in to individual characters
        .map((char) => char == '1') //asks if char = 1 and
        .toList(); //if yes map that value to the list

    setState(() {
      hotWheelsData = updatedList;

      //   print(hotWheelsData);
      //print(frmPayload);
    });
  }

  void setBooleanParkingDataList2(String binaryPayload) {
    List<bool> updatedList = binaryPayload //create list of type bool
        .split('') //split the string in to individual characters
        .map((char) => char == '1') //asks if char = 1 and
        .toList(); //if yes map that value to the list

    setState(() {
      CHWLot1Data = updatedList;
      // print(CHWLot1Data);
    });
  }

  String hexToBinary(String hex) {
    // Convert hexadecimal string to binary
    String binaryString = BigInt.parse(hex, radix: 16).toRadixString(2);

    // Calculate the number of leading zeros to pad
    int numLeadingZeros = hex.length * 4 - binaryString.length;

    // Pad with leading zeros
    String paddedBinaryString = '0' * numLeadingZeros + binaryString;

    return paddedBinaryString;
  }

  @override
  Widget build(BuildContext context) {
    int HWA = 0;

    for (int i = 0; i < 24; i++) {
      bool value = hotWheelsData[i];

      if (!value) {
        HWA++;
      }
    }

    int CHA = 0;

    for (int i = 0; i < 180; i++) {
      bool value = CHWLot1Data[i];

      if (!value) {
        CHA++;
      }

    }

    return Scaffold(
        appBar: AppBar(
          // app bar info
          backgroundColor: Colors.black,
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Homepage',
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
        ), // end of app bar

        body: isLoading
        ? Center(
          // Display a loading indicator while data is being fetched
          child: CircularProgressIndicator(),
        )
       : ListView(
          // vertical list view widget of parking lots
          padding: EdgeInsets.symmetric(vertical: 5),
          shrinkWrap: true,
          scrollDirection: Axis.vertical,
          children: [
            //Text(frmPayload),
            SizedBox(height: 10),

            //ElevatedButton(
            //  onPressed: () {
            //print('Binary List Values for Parking Availability: $binaryList');
            //    print(
            //  'Boolean List Values for Parking Availability: $booleanParkingDataList');
            //  },
            //  child: Text('Show 4-bit Binary Data'),
            // ),

            Padding(
              // Widget for Hot Wheels Lot

              padding: EdgeInsetsDirectional.fromSTEB(15, 10, 15, 10),
              // spacing
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
                        // on tap of the image, goto to hotWheels class and bring parking data with it
                        List<bool>? updatedData = await Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => hotWheels(
                                    hotWheelsData:
                                        getHotWheelsData()))); // function to return booleanParkingDataList
                        if (updatedData != null) {
                          setState(() {
                            hotWheelsData = updatedData;
                          });
                        }
                      },
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(33),
                        child: Image.network(
                          'https://storage.googleapis.com/getparked/HotWheelsLot1.jpg',
                          // Hot Wheels image pulled from Google cloud
                          width: 410,
                          height: 141,
                          fit: BoxFit.fitWidth,
                        ),
                      ),
                    ),
                    const Row(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Padding(
                          padding:
                              EdgeInsetsDirectional.fromSTEB(10, 10, 10, 5),
                          child: Text(
                            'Hot Wheels Lot',
                            style: TextStyle(
                              fontFamily: 'Urbanist',
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(10, 0, 0, 0),
                          child: Text(
                            '$HWA AVAILABLE SPOTS',
                            // available spots based on boolean parking data recieved
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

            Padding(
              // CHW LOT 1
              padding: EdgeInsetsDirectional.fromSTEB(15, 10, 15, 10),
              child: Container(
                width: 100,
                height: 194,
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
                        // on tap of the image, goto to hotWheels class and bring parking data with it
                        List<bool>? updatedData = await Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => chwlot1(
                                    CHWLot1Data:
                                        getCHWLot1Data()))); // function to return booleanParkingDataList
                        if (updatedData != null) {
                          setState(() {
                            CHWLot1Data = updatedData;
                          });
                        }
                      },
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(33),
                        child: FittedBox(
                          child: Image.network(
                            'https://storage.googleapis.com/getparked/CHW%20lot1.jpg',
                            // CHW Lot image pulled from Google cloud
                            width: 425,
                            height: 141,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ),
                    const Row(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Padding(
                          padding:
                              EdgeInsetsDirectional.fromSTEB(10, 10, 10, 6),
                          child: Text(
                            'CHW Lot 1',
                            style: TextStyle(
                              fontFamily: 'Urbanist',
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(10, 0, 0, 0),
                          child: Text(
                            '$CHA AVAILABLE SPOTS',
                            // available parking counts based on boolean parking data recieved
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

            Padding(
              // CBA LOT 1
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
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    cbalot1())); // on tap of the image, goto to cbaLot1 class and bring parking data with it
                      },
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(33),
                        child: Image.network(
                          'https://storage.googleapis.com/getparked/CBA%20lot1.jpg',
                          // image pulled from google cloud
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
                          padding:
                              EdgeInsetsDirectional.fromSTEB(10, 10, 10, 5),
                          child: Text(
                            'CBA Lot 1',
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
                            'X AVAILABLE SPOTS',
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

            Padding(
              // CHW LOT 2
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
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    chwlot2())); // on tap of the image, goto to chwLot2 class and bring parking data with it
                      },
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(33),
                        child: Image.network(
                          'https://storage.googleapis.com/getparked/CHW%20lot2.jpg',
                          // image pulled from google cloud
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
                          padding: EdgeInsetsDirectional.fromSTEB(
                              10, 10, 10, 5), // spacing
                          child: Text(
                            'CHW Lot 2',
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
                            'X AVAILABLE SPOTS',
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

            Padding(
              // PORT A LOT
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
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => frontlot()));
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
                          padding:
                              EdgeInsetsDirectional.fromSTEB(10, 10, 10, 5),
                          child: Text(
                            'Portable A Lot',
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
                            'X AVAILABLE SPOTS',
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
        ));
  }
}
