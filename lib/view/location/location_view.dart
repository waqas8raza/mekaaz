import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class LocationView extends StatefulWidget {
  const LocationView({super.key});

  @override
  _LocationViewState createState() => _LocationViewState();
}

class _LocationViewState extends State<LocationView> {
  late GoogleMapController _mapController;

  // Set the initial position to some coordinates (you can update this with user's location)
  final LatLng _initialPosition =
      const LatLng(37.7749, -122.4194); // Example: San Francisco

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Google Map widget
          GoogleMap(
            initialCameraPosition: CameraPosition(
              target: _initialPosition,
              zoom: 14,
            ),
            onMapCreated: (GoogleMapController controller) {
              _mapController = controller;
            },
            myLocationEnabled: true,
            myLocationButtonEnabled: false,
            zoomControlsEnabled: false,
          ),
          // Custom AppBar
          const Positioned(
            top: 50,
            left: 20,
            right: 20,
            child: Row(
              children: [
                // Location icon
                Icon(
                  Icons.location_on,
                  size: 30,
                  color: Colors.black,
                ),
                SizedBox(width: 10),
                // Location title
                Text(
                  'Location',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
              ],
            ),
          ),
          // Marker in the center
          Center(
            child: Icon(
              Icons.circle,
              size: 50,
              color: Colors.brown.withOpacity(0.5),
            ),
          ),
        ],
      ),
    );
  }
}
