# GET PARKED 2023

Welcome to the GET PARKED 2023 project, a parking spot detection system developed using Flutter and Dart in Visual Studio Code.

## Requirements
Before getting started, make sure you have the following tools installed:

* [Visual Studio Code](https://code.visualstudio.com/)
* [Flutter SDK](https://flutter.dev/docs/get-started/install)
* [Android Studio](https://developer.android.com/studio)
* Android Device (or Android Studio Emulator)


## Installation

1. Download or clone this repository using the following link:

```
git clone https://github.com/jawshoa/get_parked_2023.git
```

2. Navigate to the project root directory:

```
cd get_parked_2023
```

3. Install the required dependencies by executing the following command in the terminal:
```
flutter pub get
```


## Running the App

Once the dependencies are installed, follow these steps to run the GET PARKED app:

1. Open Visual Studio Code and navigate to the project directory.

2. Run the following command to build the project:
   
```
flutter pub run build_runner build
```

3. Make sure you have an Android device connected or an Android Studio emulator running.

4. Run the app using the following command:

```
flutter run
```



## Pages


### Homepage
* The Home_Screen class is a stateless widget.
  
* The controller variable is created to handle text editing.
  
* The futureParklot variable is declared to hold the future value of a ParkingLot object.
  
* The build method returns a Scaffold widget with an AppBar and a ListView as the body.
  
* Inside the ListView, there are multiple Padding widgets, each representing a parking lot.
  
* Each parking lot is displayed as a Container with an image, name, and the number of available spots.
  
* The onTap property of the InkWell widget will bring you to that selected parking lot page.




### Map
* The Map class is a stateful widget that represents the main screen of the application. It takes a list of boolean values as a parameter, which is used to determine the availability of parking lots.

* The _MapState class is the state class for the Map widget. It contains the necessary methods and variables to interact with the Google Maps plugin.

* The build method of the _MapState class returns a Scaffold widget that contains an AppBar and a GoogleMap widget. The AppBar displays the title of the screen and a logo. The GoogleMap widget displays the map and markers for the parking lots.

* The _onMapCreated method is called when the map is created and assigns the GoogleMapController to the mapController variable.

* The _determinePosition method uses the Geolocator plugin to determine the user's current position. It checks if location services are enabled and if the app has permission to access the device's location. If not, it requests the necessary permissions. Finally, it returns the user's position.

* The _showFront, _showTech, and _showPISE2 methods are called when a marker is tapped on the map. They display a bottom sheet with information about the parking lot and a button to navigate to the corresponding lot page.

* The _navigateToFront, _navigateToTech, and _navigateToPISE2 methods are called when the user taps on the "Go to Lot" button in the bottom sheet. They navigate to the respective lot pages.

* The FutureBuilder widget is used to handle the asynchronous operation of getting the user's position. It displays a loading indicator while waiting for the position, an error message if there is an error, and the map with markers if the position is obtained successfully.


### Settings



### Parking Lot Page

* The code imports the necessary packages and files for the application.

* The chwlot1 class is a stateful widget that represents the main screen of the application. It takes a list of boolean values booleanParkingDataList as a parameter.

* The parkingLot and futureParkingLot variables are used to store the parking lot data and the future result of fetching the data from the provided JSON URL.

* The imageHeight, imageWidth, and rotation variables are used to control the size and rotation of the parking lot image.

* The initState method is called when the widget is first created. It calls the fetchData method to fetch the parking lot data.

* The fetchData method is an asynchronous function that fetches the parking lot data from the JSON URL and updates the state of the widget.

* The booleanParkingDataList variable is a list that stores the availability status of each parking space.

* The build method is responsible for building the UI of the application. It uses various Flutter widgets to display the parking lot image, availability information, and a refresh button.

* The RectanglePainter class is a custom painter that is used to draw rectangles representing the parking spaces on the parking lot image. The color of the rectangles is determined by the availability status stored in the booleanParkingDataList variable.






