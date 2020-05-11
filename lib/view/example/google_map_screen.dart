import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutterbeginner/global/constant/string_const.dart';
import 'package:flutterbeginner/global/utils/widget_helper.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class GoogleMapScreen extends StatefulWidget {
  @override
  _GoogleMapScreenState createState() => _GoogleMapScreenState();
}

class _GoogleMapScreenState extends State<GoogleMapScreen> {
  BuildContext _ctx;
  Completer<GoogleMapController> _controller = Completer();
  final Set<Marker> _markers = {};
  LatLng _center = LatLng(45.521563, -122.677433);
  Position currentLocation;

  void _onMapCreated(GoogleMapController controller) {
    if (currentLocation != null) {}
    _controller.complete(controller);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: getAppBarWithBackBtn(context, StringConst.GOOGLE_MAP_TITLE),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          getUserLocation();
        },
        child: Icon(
          Icons.location_disabled,
          color: Colors.white,
        ),
      ),
      body: Builder(builder: (_context) {
        return _createUi(_context);
      }),
    );
  }

  Widget _createUi(BuildContext context) {
    _ctx = context;
    return Container(
      child: Stack(
        children: <Widget>[
          GoogleMap(
            onMapCreated: _onMapCreated,
            initialCameraPosition: CameraPosition(
              target: _center,
              zoom: 11.0,
            ),
            mapType: MapType.normal,
            markers: _markers,
            onCameraMove: _onCamMove,
            compassEnabled: true,
//            onCameraMove: _onCameraMove,
          ),
        ],
      ),
    );
  }

  LatLng _lastMapPosition = LatLng(45.521563, -122.677433);

  void _onCamMove(CameraPosition position) {
    _lastMapPosition = position.target;
  }

  Future<Position> locateUser() async {
    return Geolocator()
        .getCurrentPosition(desiredAccuracy: LocationAccuracy.high);
  }

  getUserLocation() async {
    currentLocation = await locateUser();
    print(currentLocation.latitude.toString());
    _center = LatLng(currentLocation.latitude, currentLocation.longitude);
    _lastMapPosition =
        LatLng(currentLocation.latitude, currentLocation.longitude);
    _markers.add(Marker(
      markerId: MarkerId(_lastMapPosition.toString()),
      position: _center,
      infoWindow: InfoWindow(
        title: 'Hello here',
        snippet: 'Super!',
      ),
      icon: BitmapDescriptor.defaultMarker,
    ));
    setState(() {
    });
    print('center $_center');
  }
}
