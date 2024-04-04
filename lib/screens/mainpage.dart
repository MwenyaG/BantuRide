import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:geolocator/geolocator.dart';

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  final Completer<GoogleMapController> _googleMapController = Completer<GoogleMapController>();

  GoogleMapController? _mapController;
  Position? _currentPosition;
  bool _isOnline = false;

  @override
  void initState() {
    super.initState();
    _requestLocationPermission();
  }

  void _requestLocationPermission() async {
    final PermissionStatus status = await Permission.location.request();
    if (status.isGranted) {
      getCurrentLocation();
    } else {
      showDialog(
        context: context,
        builder: (BuildContext context) => AlertDialog(
          title: Text('Location Permission Required'),
          content: Text('Please grant location permission to use this application.'),
          actions: <Widget>[
            TextButton(
              onPressed: () => Navigator.of(context).pop(),
              child: Text('OK'),
            ),
          ],
        ),
      );
    }
  }

  void getCurrentLocation() async {
    try {
      Position position = await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.bestForNavigation);
      setState(() {
        _currentPosition = position;
      });

      LatLng positionLatLng = LatLng(_currentPosition!.latitude, _currentPosition!.longitude);
      CameraPosition cameraPosition = CameraPosition(target: positionLatLng, zoom: 13);
      _mapController?.animateCamera(CameraUpdate.newCameraPosition(cameraPosition));
    } catch (e) {
      print('Error getting current location: $e');
    }
  }

  void _toggleOnlineStatus() {
    setState(() {
      _isOnline = !_isOnline;
    });

    //this part will be for the server
  }

  @override
  Widget build(BuildContext context) {
    final Size screenSize = MediaQuery.of(context).size;
    final double fabSize = screenSize.width * 0.12;
    final double fabSpacing = screenSize.width * 0.05;

    return Scaffold(
      body: Stack(
        children: [
          GoogleMap(
            mapType: MapType.normal,
            myLocationEnabled: true,
            myLocationButtonEnabled: false, // Hide default location button
            zoomControlsEnabled: false, // Hide default zoom in/out buttons
            initialCameraPosition: CameraPosition(
              target: LatLng(0, 0), // Default initial position
              zoom: 12,
            ),
            onMapCreated: (GoogleMapController controller) {
              _mapController = controller;
              _googleMapController.complete(controller);
              if (_currentPosition != null) {
                getCurrentLocation();
              }
            },
          ),
          Positioned(
            top: screenSize.height * 0.05,
            left: screenSize.width * 0.8,
            child: SizedBox(
              width: fabSize,
              height: fabSize,
              child: FloatingActionButton(
                onPressed: () {
                  getCurrentLocation();
                },
                child: Icon(Icons.location_searching),
                backgroundColor: Colors.teal[300],
              ),
            ),
          ),
          Positioned(
            top: screenSize.height * 0.8 - fabSize, // Center vertically
            right: screenSize.width * 0.05,
            child: Column(
              children: [
                SizedBox(
                  width: fabSize,
                  height: fabSize,
                  child: FloatingActionButton(
                    onPressed: () {
                      _mapController?.animateCamera(CameraUpdate.zoomIn());
                    },
                    child: Icon(Icons.add),
                    backgroundColor: Colors.teal[400],
                  ),
                ),
                SizedBox(height: fabSpacing),
                SizedBox(
                  width: fabSize,
                  height: fabSize,
                  child: FloatingActionButton(
                    onPressed: () {
                      _mapController?.animateCamera(CameraUpdate.zoomOut());
                    },
                    child: Icon(Icons.remove),
                    backgroundColor: Colors.teal[300],
                  ),
                ),
              ],
            ),
          ),
          Positioned(
            bottom: screenSize.height * 0.15,
            left: (screenSize.width - fabSize * 2) / 2,
            child: SizedBox(
              width: fabSize * 2,
              height: fabSize,
              child: FloatingActionButton.extended(
                onPressed: _toggleOnlineStatus,
                backgroundColor: _isOnline ? Colors.green : Colors.red,
                icon: Icon(_isOnline ? Icons.online_prediction : Icons.offline_bolt),
                label: Text(_isOnline ? 'Online' : 'Offline'),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
