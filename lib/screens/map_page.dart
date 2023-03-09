import 'dart:async';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:live_locator/globals/global.dart';


class MapPage extends StatefulWidget {
  const MapPage({Key? key}) : super(key: key);

  @override
  State<MapPage> createState() => _MapPageState();
}

class _MapPageState extends State<MapPage> {
  Completer<GoogleMapController> mapController = Completer();
  late CameraPosition position;

  @override
  void initState() {
    super.initState();
    position = CameraPosition(
      target: LatLng(Global.latitude, Global.longitude),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Live Location"),
        backgroundColor: Colors.greenAccent,
      ),
      body: GoogleMap(
        zoomControlsEnabled: false,
        onMapCreated: (GoogleMapController controller) {
          mapController.complete(controller);
        },
        initialCameraPosition: position,
        markers: <Marker>{
          Marker(
            markerId: const MarkerId("Current Location"),
            position: LatLng(Global.latitude, Global.longitude),
          ),
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          setState(
            () {
              position = CameraPosition(
                target: LatLng(Global.latitude, Global.longitude),
                zoom: 16,
              );
            },
          );
          final GoogleMapController controller = await mapController.future;
          controller.animateCamera(CameraUpdate.newCameraPosition(position));
        },
        backgroundColor: Colors.white,
        child: const Icon(Icons.gps_fixed, color: Colors.black),
      ),
    );
  }
}
