import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:geocoding/geocoding.dart';

class RadarMapPage extends StatefulWidget {
  @override
  _RadarMapPageState createState() => _RadarMapPageState();
}

class _RadarMapPageState extends State<RadarMapPage> {
  GoogleMapController? mapController;
  final LatLng _center =
      const LatLng(-8.3405, 114.8427); // Koordinat Kabupaten Banyuwangi
  String _currentAddress = 'Tap on the map to get address';

  @override
  void initState() {
    super.initState();
  }

  void _onMapCreated(GoogleMapController controller) {
    mapController = controller;
  }

  Future<void> _searchLocation(String query) async {
    final List<Location> locations = await locationFromAddress(query);
    if (locations.isNotEmpty) {
      mapController?.animateCamera(
        CameraUpdate.newLatLng(
          LatLng(locations.first.latitude, locations.first.longitude),
        ),
      );
      Navigator.of(context).pop();
    }
  }

  Future<void> _showCurrentLocation() async {
    final LatLng? position =
        await mapController?.getLatLng(const ScreenCoordinate(x: 0, y: 0));
    if (position != null) {
      final List<Placemark> placemarks =
          await placemarkFromCoordinates(position.latitude, position.longitude);
      if (placemarks.isNotEmpty) {
        setState(() {
          _currentAddress =
              '${placemarks.first.street}, ${placemarks.first.locality}';
        });
      }
    }
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('Current location: $_currentAddress')),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Weather Radar Map',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.blueAccent,
        iconTheme: const IconThemeData(color: Colors.white),
        actions: [
          IconButton(
            icon: const Icon(Icons.search, color: Colors.white),
            onPressed: () {
              showModalBottomSheet(
                context: context,
                shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
                ),
                builder: (context) {
                  final TextEditingController locationController =
                      TextEditingController();
                  return Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          'Search Location',
                          style:
                              Theme.of(context).textTheme.titleLarge?.copyWith(
                                    fontWeight: FontWeight.bold,
                                  ),
                        ),
                        const SizedBox(height: 16),
                        // Modern TextField with rounded corners and shadow
                        Container(
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(30),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black.withOpacity(0.2),
                                spreadRadius: 1,
                                blurRadius: 8,
                                offset: const Offset(0, 4),
                              ),
                            ],
                          ),
                          child: TextField(
                            controller: locationController,
                            decoration: const InputDecoration(
                              border: InputBorder.none,
                              hintText: 'Enter location name',
                              prefixIcon:
                                  Icon(Icons.search, color: Colors.blueAccent),
                              contentPadding: EdgeInsets.symmetric(
                                  horizontal: 20, vertical: 15),
                            ),
                            onSubmitted: (value) {
                              _searchLocation(value);
                            },
                          ),
                        ),
                        const SizedBox(height: 16),
                      ],
                    ),
                  );
                },
              );
            },
          ),
          IconButton(
            icon: const Icon(Icons.info_outline, color: Colors.white),
            onPressed: _showCurrentLocation,
          ),
        ],
      ),
      body: Stack(
        children: [
          GoogleMap(
            onMapCreated: _onMapCreated,
            initialCameraPosition: CameraPosition(
              target: _center,
              zoom: 12.0,
            ),
            mapType: MapType.normal,
          ),
        ],
      ),
    );
  }
}
