

import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:g_p/lots/cbalot1.dart';
import 'package:g_p/lots/chwlot2.dart';
import 'package:g_p/lots/chwlot1.dart';
import 'package:g_p/lots/porta.dart';
import 'package:geolocator/geolocator.dart';



class Map extends StatefulWidget {
  final List<bool> booleanParkingDataList;

  const Map({required this.booleanParkingDataList});
  @override

  State<Map> createState() => _MapState();
}


class _MapState extends State<Map> {
  late GoogleMapController mapController;
  Completer<GoogleMapController> _controller = Completer();
  TextEditingController _searchController = TextEditingController();

  static const LatLng PISElot = LatLng(48.488845, -123.416393);
  static const LatLng PISElot2 = LatLng(48.488359, -123.415606);
  static const LatLng Teclot = LatLng(48.49100021607449, -123.41433389677556);
  static const LatLng Frontlot = LatLng(48.489749134000775, -123.41793289900832);









  void _onMapCreated(GoogleMapController controller) {
    mapController = controller;
  }



  @override


  Widget build(BuildContext context) {
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
                  Row(children: [
                    Expanded(
                      child: TextFormField(
                          controller: _searchController,
                          textCapitalization: TextCapitalization.words,
                          decoration: InputDecoration(
                              hintText: 'Search by Lot'),
                          onChanged: (value) {
                            print(value);
                          }


                      ),),
                    IconButton(onPressed: () {


                    },
                      icon: Icon(Icons.search),

                    ),
                  ],
                  ),
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
                                snippet: '567 Available'),

                            icon: BitmapDescriptor.defaultMarkerWithHue(30.0),

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
                    booleanParkingDataList: widget.booleanParkingDataList,
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
                                snippet: '567 Available'
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
                                snippet: '12 Available'),
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
                                snippet: '78 Available'
                            ),

                            icon: BitmapDescriptor.defaultMarkerWithHue(45.0),
                            onTap: () {
                              _showFront(context, "Portable A Lot");
                            },
                            position: Frontlot),

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
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.green,

                  textStyle: const TextStyle(
                    color: Colors.white,
                    fontSize: 12,
                    fontStyle: FontStyle.italic),

                    shape: BeveledRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(600))),
                      shadowColor: Colors.lightBlue,
          ),


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