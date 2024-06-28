import 'dart:async';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:geocoding/geocoding.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class DvrScreen extends StatefulWidget {
  const DvrScreen({super.key});

  @override
  State<DvrScreen> createState() => _DvrScreenState();
}

class _DvrScreenState extends State<DvrScreen> {
  GoogleMapController? _mapController;
  Position? _currentPosition;
  String? _currentAddress;
  final Set<Marker> _markers = {};
  final LatLng _initialPosition = LatLng(31.205753, 29.924526);
  StreamSubscription<Position>? _positionStreamSubscription;

  @override
  void initState() {
    super.initState();
    _trackLocation();
  }

  @override
  void dispose() {
    _positionStreamSubscription?.cancel();
    super.dispose();
  }

  void _trackLocation() {
    _positionStreamSubscription = Geolocator.getPositionStream(
      desiredAccuracy: LocationAccuracy.high,
      distanceFilter: 10, // Update location every 10 meters
    ).listen((Position position) {
      setState(() {
        _currentPosition = position;
        _markers.add(
          Marker(
            markerId: MarkerId('currentLocation'),
            position: LatLng(position.latitude, position.longitude),
          ),
        );
      });

      _mapController?.animateCamera(
        CameraUpdate.newCameraPosition(
          CameraPosition(
            target: LatLng(position.latitude, position.longitude),
            zoom: 15,
          ),
        ),
      );
    });
  }

  void _onMapCreated(GoogleMapController controller) {
    _mapController = controller;
  }

 

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Column(
            children:[
              SizedBox(height: 35,),
          
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(onPressed: (){}, 
                      child: Text("DVR",
                      style: TextStyle(fontSize: 15, color: Colors.white),
                      ),
                      style: ButtonStyle(
                        
                        backgroundColor: MaterialStateProperty.all(Colors.blue[400]),
                        padding: MaterialStateProperty.all(EdgeInsets.symmetric(horizontal: 60, vertical: 10)),
                        shape: MaterialStateProperty.all(RoundedRectangleBorder(
                        borderRadius: BorderRadius.only(bottomRight: Radius.circular(50),
                        topRight: Radius.circular(50)),
                        ),
                        ),
                      ),
                      ),
          
                      SizedBox(width: 100,),
          
                      ElevatedButton(onPressed: (){}, 
                      child: Text("Devices",
                      style: TextStyle(fontSize: 15, color: Colors.white),
                      ),
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all(Colors.blue[400]),
                        padding: MaterialStateProperty.all(EdgeInsets.symmetric(horizontal: 50, vertical: 10)),
                        shape: MaterialStateProperty.all(RoundedRectangleBorder(
                        borderRadius: BorderRadius.only(bottomLeft: Radius.circular(50),
                        topLeft: Radius.circular(50)),
                        ),
                        ),
                      ),
                      ),
                ],
              ),
              SizedBox(height: 5),
              Container(
                height: 250,
                width: 500,
                child: Text('Video live', style: TextStyle(color: Colors.white)),
                decoration: BoxDecoration(color: Colors.black),
              ),
              SizedBox(height: 5,),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 180, vertical: 5),
                //height: 250,
                width: 500,
                child: Text('Tracks',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 14,
                )),
                decoration: BoxDecoration(
                  color: Colors.black12,
              ),
              ),
              SizedBox(height: 5,),
              Container(
                height: 443.3,
                width: 500,
               child: GoogleMap(
                  onMapCreated: _onMapCreated,
                  initialCameraPosition: CameraPosition(
                  target: _initialPosition,
                  zoom: 10,
                    ),
                  markers: _markers,
                  myLocationEnabled: true,
                  myLocationButtonEnabled: true,
                  ),),
            ]
          ),
        ],
      ),
    );
  }
}

//-------------------------------------------------------------------------------------------------------
  // _getCurrentLocation() {
  //   Geolocator.getCurrentPosition(
  //     desiredAccuracy: LocationAccuracy.high,
  //   ).then((Position position) {
  //     setState(() {
  //       _currentPosition = position;
  //     });
  //     _getAddressFromLatLng();
  //   }).catchError((e) {
  //     print(e);
  //   });
  // }

  // _getAddressFromLatLng() async {
  //   try {
  //     List<Placemark> placemarks = await placemarkFromCoordinates(
  //       _currentPosition!.latitude,
  //       _currentPosition!.longitude,
  //     );

  //     Placemark place = placemarks[0];

  //     setState(() {
  //       _currentAddress =
  //           "${place.locality}, ${place.postalCode}, ${place.country}";
  //     });
  //   } catch (e) {
  //     print(e);
  //   }
  // }



   // @override
  // void initState() {
  //   super.initState();
  //   _getCurrentLocation();
  // }

  // Future<void> _getCurrentLocation() async {
  //   Position position = await Geolocator.getCurrentPosition(
  //     desiredAccuracy: LocationAccuracy.high,
  //   );
  //   setState(() {
  //     _currentPosition = position;
  //     _markers.add(
  //       Marker(
  //         markerId: MarkerId('currentLocation'),
  //         position: LatLng(position.latitude, position.longitude),
  //       ),
  //     );
  //   });

  //   _mapController?.animateCamera(
  //     CameraUpdate.newCameraPosition(
  //       CameraPosition(
  //         target: LatLng(position.latitude, position.longitude),
  //         zoom: 15,
  //       ),
  //     ),
  //   );
  // }

  // void _onMapCreated(GoogleMapController controller) {
  //   _mapController = controller;
  // }