

import 'dart:async';
import 'package:flutter/material.dart';
import 'package:g_p/lots/cbalot1.dart';
import 'package:g_p/lots/chwlot1.dart';
import 'package:g_p/lots/chwlot2.dart';
import 'package:g_p/lots/hotWheels.dart';
import 'package:g_p/lots/porta.dart';
import 'dart:io';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:geolocator/geolocator.dart';



class gMap extends StatefulWidget {
  @override
  State<gMap> createState() => _gMapState();
}


class _gMapState extends State<gMap> {

  String HotWheelsHeader = "252571ba-369d-465e-abad-690a5670b2ad";
  String CHWHeader = "3a2a6522-9335-491e-addd-63521d380e5d";
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






  late GoogleMapController mapController;
  Completer<GoogleMapController> _controller = Completer();
  TextEditingController _searchController = TextEditingController();

  static const LatLng PISElot = LatLng(48.488845, -123.416393);
  static const LatLng PISElot2 = LatLng(48.488359, -123.415606);
  static const LatLng Teclot = LatLng(48.49100021607449, -123.41433389677556);
  static const LatLng Frontlot = LatLng(48.489749134000775, -123.41793289900832);
  static const LatLng HHLatLong = LatLng(48.49276912961702, -123.41746796037559);




  @override
  void initState() {
    super.initState();
    GetParkingData1(HotWheelsHeader);
    GetParkingData2(CHWHeader);
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
      //hotWheelsData = updatedList;
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



  void _onMapCreated(GoogleMapController controller) {
    mapController = controller;
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

      double hotWheelsHue = (HWA - 0) * ((180 - 0) / (24 - 0)) + 0;







    int CHA = 0;

    for (int i = 0; i < 180; i++) {
      bool value = CHWLot1Data[i];

      if (!value) {
        CHA++;
      }

    }
    return Scaffold(
       appBar: AppBar(
        backgroundColor: Colors.black,
        title:  Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
                Text('Map',
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


      body: FutureBuilder<Position>(
        future: _determinePosition(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            // Display a loading indicator while waiting for the position
            return Center(
              child: CircularProgressIndicator(),
            );
          } else if (snapshot.hasError) {
            // Handle errors if any
            return Center(
              child: Text('Error: ${snapshot.error}'),
            );
          } else {
            // Use the obtained position to set the initial camera position
            final initialCameraPosition = CameraPosition(
              target: LatLng(snapshot.data!.latitude, snapshot.data!.longitude),
              zoom: 15.5,
            );


            return Column(
                children: [

                  Expanded(


                    child: GoogleMap(
                      onMapCreated: _onMapCreated,
                      myLocationButtonEnabled: true,
                      zoomControlsEnabled: true,
                      initialCameraPosition: initialCameraPosition,
                      markers: {
                        Marker(
                            markerId: MarkerId("CHW lot1"),

                            infoWindow: InfoWindow(
                                title: 'CHW lot1',
                                snippet: '$CHA Available'),

                            icon: BitmapDescriptor.defaultMarkerWithHue(CHA.toDouble()),

                            onTap: () {
                                showModalBottomSheet(
      context: context,
      builder: (builder) {
        return Container(
          height: 200,
          child: Column(
            children: [
              ListTile(
                title: Text('CHW Lot 1'),
                subtitle: Text("Number of parking stalls and other information"),
              ),
              const SizedBox(height: 60),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => chwlot1(
                    CHWLot1Data: CHWLot1Data,
                  )));
                },
                child: Text('Go to PISE Lot'),
              ),
            ],
          ),
        );
      },
    );
                            },
                            position: PISElot),


                        Marker(
                            markerId: MarkerId("CHW lot2"),
                            infoWindow: InfoWindow(
                                title: 'CHW lot2',
                                snippet: 'X Available'
                            ),

                            icon: BitmapDescriptor.defaultMarkerWithHue(60.0),
                            onTap: () {
                              _showPISE2(context, "CHW lot2");
                            },
                            position: PISElot2),


                        Marker(
                            markerId: MarkerId("CBA lot1"),
                            infoWindow: InfoWindow(
                                title: 'CBA lot1',
                                snippet: 'X Available'),
                            // number of parking stalls
                            icon: BitmapDescriptor.defaultMarkerWithHue(120.0),
                            onTap: () {
                              _showTech(context, "CBA lot1");
                            },
                            position: Teclot),




                        Marker(
                            markerId: MarkerId("Portable A Lot"),
                            infoWindow: InfoWindow(
                                title: 'Portable A lot',
                                snippet: 'X Available'
                            ),

                            icon: BitmapDescriptor.defaultMarkerWithHue(45.0),
                            onTap: () {
                              _showFront(context, "Portable A Lot");
                            },
                            position: Frontlot),


                        Marker(
                            markerId: MarkerId("Hot Wheels Lot"),
                            infoWindow: InfoWindow(
                                title: 'Hot Wheels Lot',
                                snippet: '$HWA Available'),
                            // number of parking stalls
                            icon: BitmapDescriptor.defaultMarkerWithHue(hotWheelsHue),
                            onTap: () {
                              showModalBottomSheet(
                                context: context,
                                builder: (builder) {
                                  return Container(
                                    height: 200,
                                    child: Column(
                                      children: [
                                        ListTile(
                                          title: Text('Hot Wheels Lot'),
                                          subtitle: Text("Number of parking stalls and other information"),
                                        ),
                                        const SizedBox(height: 60),
                                        ElevatedButton(
                                          onPressed: () {
                                            Navigator.push(context, MaterialPageRoute(builder: (context) => hotWheels(hotWheelsData: hotWheelsData,)));
                                          },
                                          child: Text('Go to Hot Wheels Lot'),
                                        ),
                                      ],
                                    ),
                                  );
                                },
                              );
                            },
                            position: HHLatLong),



                      },

                    ),

                  )
                ]
            );
          }
        }
      )


    );
  }
}









    void _navigateToFront(BuildContext context, String lotName) {
    // Implement logic to navigate to another page here
    // For example:
     Navigator.push(context, MaterialPageRoute(builder: (context) => frontlot()));

  }

void _navigateToHotWheels(BuildContext context, String lotName) {
  // Implement logic to navigate to another page here
  // For example:
  Navigator.push(context, MaterialPageRoute(builder: (context) => hotWheels(hotWheelsData: [],)));

}



  void _navigateToTech(BuildContext context, String lotName) {
    // Implement logic to navigate to another page here
    // For example:
     Navigator.push(context, MaterialPageRoute(builder: (context) => cbalot1()));
  }

    void _navigateToPISE2(BuildContext context, String lotName) {
    // Implement logic to navigate to another page here
    // For example:
     Navigator.push(context, MaterialPageRoute(builder: (context) => chwlot2()));
  }











void _showFront (BuildContext context, String lotName) {
  showModalBottomSheet(
      context: context,
      builder: (builder) {
        return Container(
          height: 200,
          child: Column(
            children: [
              ListTile(
                title: Text(lotName),
                subtitle: Text("Number of parking stalls and other information"),
              ),
              const SizedBox(height: 60),
              ElevatedButton(
                child: Text('Go to Lot'),



                onPressed: () {
                  _navigateToFront(context, lotName);
                }

              ),
            ],
          ),
        );
      },
    );
  }

  void _showTech (BuildContext context, String lotName) {
  showModalBottomSheet(
      context: context,
      builder: (builder) {
        return Container(
          height: 200,
          child: Column(
            children: [
              ListTile(
                title: Text(lotName),
                subtitle: Text("Number of parking stalls and other information"),
              ),
              const SizedBox(height: 60),
              ElevatedButton(
                onPressed: () {
                  _navigateToTech(context, lotName);
                },
                child: Text('Go to Tech Lot'),
              ),
            ],
          ),
        );
      },
    );
  }


  void _showPISE2(BuildContext context, String lotName) {
  showModalBottomSheet(
      context: context,
      builder: (builder) {
        return Container(
          height: 200,
          child: Column(
            children: [
              ListTile(
                title: Text(lotName),
                subtitle: Text("Number of parking stalls and other information"),
              ),
              const SizedBox(height: 60),
              ElevatedButton(
                onPressed: () {
                  _navigateToPISE2(context, lotName);
                },
                child: Text('Go to PISE Lot'),
              ),
            ],
          ),
        );
      },
    );
  }

void _showHW (BuildContext context, String lotName) {
  showModalBottomSheet(
    context: context,
    builder: (builder) {
      return Container(
        height: 200,
        child: Column(
          children: [
            ListTile(
              title: Text(lotName),
              subtitle: Text("Number of parking stalls and other information"),
            ),
            const SizedBox(height: 60),
            ElevatedButton(
              onPressed: () {
                _navigateToHotWheels(context, lotName);
              },
              child: Text('Go to Hot Wheels Lot'),
            ),
          ],
        ),
      );
    },
  );
}



Future<Position> _determinePosition() async {
  bool serviceEnabled;
  LocationPermission permission;

  // Test if location services are enabled.
  serviceEnabled = await Geolocator.isLocationServiceEnabled();
  if (!serviceEnabled) {
    // Location services are not enabled don't continue
    // accessing the position and request users of the
    // App to enable the location services.
    return Future.error('Location services are disabled.');
  }

  permission = await Geolocator.checkPermission();
  if (permission == LocationPermission.denied) {
    permission = await Geolocator.requestPermission();
    if (permission == LocationPermission.denied) {
      // Permissions are denied, next time you could try
      // requesting permissions again (this is also where
      // Android's shouldShowRequestPermissionRationale
      // returned true. According to Android guidelines
      // your App should show an explanatory UI now.
      return Future.error('Location permissions are denied');
    }
  }

  if (permission == LocationPermission.deniedForever) {
    // Permissions are denied forever, handle appropriately.
    return Future.error(
        'Location permissions are permanently denied, we cannot request permissions.');
  }

  // When we reach here, permissions are granted and we can
  // continue accessing the position of the device.

  Position user = await Geolocator.getCurrentPosition();
 // print(user);
  return user;
}