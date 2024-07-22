import 'dart:async';

import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:portify/app_theme.dart';
import 'package:portify/screens/helper_methods.dart';
import 'package:portify/screens/request_helper.dart';
import 'package:portify/widgets/RoundedInputField.dart';

class MapScreen extends StatefulWidget {
  const MapScreen({super.key});

  @override
  State<MapScreen> createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  late GoogleMapController mapController;
  final String apiKey = 'AIzaSyCknD14Z85iTrBrOnBEnjZ4HUimMsvbbeA';
  var pickupController = TextEditingController();
  var destinationController = TextEditingController();
  String location = 'Unknown';
  List<dynamic> pickupSuggestions = [];
  List<dynamic> destinationSuggestions = [];
  Future<void> _checkPermission() async {
    bool serviceEnabled;
    LocationPermission permission;
    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      setState(() {
        location = 'Location services are disabled.';
      });
      return;
    }
    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        setState(() {
          location = 'Location permissions are denied';
        });
        return;
      }
    }

    if (permission == LocationPermission.deniedForever) {
      setState(() {
        location =
            'Location permissions are permanently denied, we cannot request permissions.';
      });
      return;
    }
    setupPositionLocation();
  }

  //Permition Ends Here
  Position? currentPosition;
  setupPositionLocation() async {
    Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.bestForNavigation);

    currentPosition = position;
    LatLng pos = LatLng(position.latitude, position.longitude);
    CameraUpdate cp = CameraUpdate.newLatLngZoom(pos, 14.0);
    mapController.animateCamera(cp);
    //This gets address from HelperMethods helper_method.dart
    String address =
        await HelperMethods.findCordinatesAddress(position, context);
    setState(() {
      pickupController.text = address;
    });
    print(address);
  }

  //
  // void searchPlace(String placeName) async {
  //   if (placeName.length > 1) {
  //     var url = Uri.https('maps.googleapis.com',
  //         '/maps/api/place/autocomplete/json?input=$placeName&key=$apiKey&component=country:in');

  //     var response = await RequestHelper.getRequest(url);
  //     if (response == 'failed') {
  //       return;
  //     }
  //     if (response == 'OK') {
  //       var predictions = response['predictions'];
  //     }
  //     print(response);
  //   }
  //

  void searchPlace(String placeName, bool isPickup) async {
    List<dynamic> suggestions =
        await RequestHelper.searchPlace(placeName, apiKey);
    setState(() {
      if (isPickup) {
        pickupSuggestions = suggestions;
      } else {
        destinationSuggestions = suggestions;
      }
    });
  }

  final Completer<GoogleMapController> _controller =
      Completer<GoogleMapController>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          GoogleMap(
            mapType: MapType.normal,
            myLocationEnabled: true,
            myLocationButtonEnabled: true,
            zoomControlsEnabled: true,
            zoomGesturesEnabled: true,
            initialCameraPosition: const CameraPosition(
              target: LatLng(0, 0), // Default position
              zoom: 16.0,
            ),
            onMapCreated: (GoogleMapController controller) {
              //check line no 17
              //final Completer<GoogleMapController> _controller =
              ///Completer<GoogleMapController>();
              _controller.complete(controller);
              mapController = controller;
              setupPositionLocation();
            },
          ),
          Positioned(
            left: 0,
            right: 0,
            bottom: 0,
            child: Container(
              height: 340,
              decoration: const BoxDecoration(
                color: Colors.white,
              ),
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Container(
                      decoration: const BoxDecoration(
                          color: Colors.white,
                          borderRadius:
                              BorderRadius.all(Radius.circular(10.0))),
                      child: Column(
                        children: <Widget>[
                          RoundedInputField(
                              key: const Key('Key'),
                              hintText: 'Where Are You Going',
                              onChanged: (text) {
                                searchPlace(text, true);
                              },
                              textEditingController: pickupController,
                              cursorColor: AppTheme.lightGrey,
                              icon: Icons.location_on_outlined,
                              iconColor: Colors.black,
                              editTextBackgroundColor: Colors.black12),
                          RoundedInputField(
                              key: const Key('New Key'),
                              hintText: 'Where You Want to Send',
                              onChanged: (text) {
                                searchPlace(text, false);
                              },
                              textEditingController: destinationController,
                              cursorColor: AppTheme.lightGrey,
                              icon: Icons.location_on_outlined,
                              iconColor: Colors.black,
                              editTextBackgroundColor: Colors.black12),
                          if (pickupSuggestions.isNotEmpty)
                            ListView.builder(
                              scrollDirection: Axis.vertical,
                              shrinkWrap: true,
                              itemCount: pickupSuggestions.length,
                              itemBuilder: (context, index) {
                                return ListTile(
                                  leading: const Icon(Icons.location_on),
                                  title: Text(
                                      pickupSuggestions[index]['description']),
                                  onTap: () {
                                    setState(() {
                                      pickupController.text =
                                          pickupSuggestions[index]
                                              ['description'];
                                      pickupSuggestions = [];
                                    });
                                  },
                                );
                              },
                            ),
                          if (destinationSuggestions.isNotEmpty)
                            ListView.builder(
                              scrollDirection: Axis.vertical,
                              shrinkWrap: true,
                              itemCount: destinationSuggestions.length,
                              itemBuilder: (context, index) {
                                return ListTile(
                                  leading: const Icon(Icons.location_on),
                                  title: Text(destinationSuggestions[index]
                                      ['description']),
                                  onTap: () {
                                    setState(() {
                                      destinationController.text =
                                          destinationSuggestions[index]
                                              ['description'];
                                      destinationSuggestions = [];
                                    });
                                  },
                                );
                              },
                            ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Positioned(
            top: 50,
            left: 35,
            child: GestureDetector(
              onTap: () {},
              child: Container(
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20.0),
                    boxShadow: const [
                      BoxShadow(
                        color: Colors.black26,
                        spreadRadius: 2,
                        blurRadius: 5,
                        offset: Offset(0, 3), // changes position of shadow
                      ),
                    ]),
                child: const CircleAvatar(
                  backgroundColor: Colors.white,
                  child: Icon(Icons.menu, color: Colors.black45),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
