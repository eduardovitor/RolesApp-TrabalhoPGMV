import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'dart:async';

class MapsPage extends StatefulWidget {
  final LatLng local;
  const MapsPage({Key? key, required this.local}) : super(key: key);

  @override
  State<MapsPage> createState() => _MapsPageState();
}

class _MapsPageState extends State<MapsPage> {
  LatLng get local => widget.local;
  Completer<GoogleMapController> _controller = Completer();
  Set<Marker> _markers = <Marker>{};
  @override
  Widget build(BuildContext context) {
    final CameraPosition _localrole = CameraPosition(target: local, zoom: 15);
    Marker pontorole = Marker(markerId: MarkerId("1"), position: local);
    _markers.add(pontorole);
    return Scaffold(
        body: GoogleMap(
      mapType: MapType.normal,
      markers: _markers,
      initialCameraPosition: _localrole,
      onMapCreated: (GoogleMapController controller) {
        _controller.complete(controller);
      },
    ));
  }
}
