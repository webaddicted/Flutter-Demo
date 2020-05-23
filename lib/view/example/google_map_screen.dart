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
  LatLng _center = LatLng(28.5598963, 77.34288200000003);
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
          Icons.location_searching,
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

  LatLng _lastMapPosition = LatLng(28.5598963, 77.34288200000003);

  void _onCamMove(CameraPosition _position) {
    _lastMapPosition = _position.target;
    Position newMarkerPosition = Position(
        latitude: _position.target.latitude,
        longitude: _position.target.longitude);
    setState(() {
      _markers.add(Marker(
        markerId: MarkerId(_lastMapPosition.toString()),
        position: _center,
        infoWindow: InfoWindow(
          title: 'Hello here testing',
          snippet: 'Super!',
        ),
        icon: BitmapDescriptor.defaultMarker,
      ));
//      markers["1"] = marker.copyWith(
//          positionParam: LatLng(newMarkerPosition.latitude, newMarkerPosition.longitude));
    });
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
