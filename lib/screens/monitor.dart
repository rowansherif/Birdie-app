import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:easy_geofencing/easy_geofencing.dart';
import 'package:screenshot/screenshot.dart';

class MonitorPage extends StatefulWidget {
  @override
  _MonitorPageState createState() => _MonitorPageState();
}

class _MonitorPageState extends State<MonitorPage> {
  ScreenshotController screenshotController = ScreenshotController();
  GoogleMapController? _mapController;
  LatLng? _circleCenter;
  double _circleRadius = 0.0;
  Set<Circle> _circles = {};
  String? _selectedArea;

  @override
  void initState() {
    super.initState();
    _initializeGeofencing();
  }

  void _initializeGeofencing() {
    // No initial geofence area is set
  }

  void _updateGeofenceArea(String selectedArea) {
    setState(() {
      _selectedArea = selectedArea;
      _circles.clear();
    });

    if (selectedArea == 'Smouha') {
      _circleCenter = LatLng(31.2155235, 29.9420061);
      _circleRadius = 500.0;
    } else if (selectedArea == 'Sporting') {
      _circleCenter = LatLng(31.2216374, 29.9344318);
      _circleRadius = 500.0;
    } else if (selectedArea == 'Sidi Bishr') {
      _circleCenter = LatLng(31.2555336, 29.9832000);
      _circleRadius = 500.0;
    } else if (selectedArea == 'Sidi Gabir') {
      _circleCenter = LatLng(31.2217104, 29.9376874);
      _circleRadius = 500.0;
    } else if (selectedArea == 'Al Ibrahimeyah') {
      _circleCenter = LatLng(31.2118531, 29.9265556);
      _circleRadius = 500.0;
    } else if (selectedArea == 'Roushdy') {
      _circleCenter = LatLng(31.2241337, 29.9367945);
      _circleRadius = 500.0;
    } else if (selectedArea == 'Mahta Al Raml') {
      _circleCenter = LatLng(31.2029259, 29.9030832);
      _circleRadius = 500.0;
    } else if (selectedArea == 'Mansheya') {
      _circleCenter = LatLng(31.1974311, 29.8910359);
      _circleRadius = 500.0;
    } else if (selectedArea == 'Abu Qir') {
      _circleCenter = LatLng(31.3114241, 30.0603342);
      _circleRadius = 500.0;
    } else if (selectedArea == 'El-Mandara') {
      _circleCenter = LatLng(31.2748287, 30.0061570);
      _circleRadius = 500.0;
    } else if (selectedArea == 'Al-Mamoera') {
      _circleCenter = LatLng(31.2884003, 30.0314948);
      _circleRadius = 500.0;
    } else if (selectedArea == 'Al-Asafra') {
      _circleCenter = LatLng(31.2049544, 29.9064184);
      _circleRadius = 500.0;
    } else if (selectedArea == 'Al-Hadra') {
      _circleCenter = LatLng(31.1975064, 29.9285970);
      _circleRadius = 500.0;
    } else if (selectedArea == 'Al-Akbal') {
      _circleCenter = LatLng(31.2493529, 29.9758657);
      _circleRadius = 500.0;
    } else if (selectedArea == 'Al-soyof') {
      _circleCenter = LatLng(31.2386820, 29.9929406);
      _circleRadius = 500.0;
    } else if (selectedArea == 'Gianaclis') {
      _circleCenter = LatLng(31.2428449, 29.9694294);
      _circleRadius = 500.0;
    } else if (selectedArea == 'Fleming') {
      _circleCenter = LatLng(31.2287973, 29.9609902);
      _circleRadius = 500.0;
    } else if (selectedArea == 'Bacos') {
      _circleCenter = LatLng(31.2383982, 29.9670016);
      _circleRadius = 500.0;
    } else if (selectedArea == 'Louran') {
      _circleCenter = LatLng(31.2416838, 29.9726958);
      _circleRadius = 500.0;
    } else if (selectedArea == 'Victoria') {
      _circleCenter = LatLng(31.2485948, 29.9695927);
      _circleRadius = 500.0;
    } else if (selectedArea == 'Glim') {
      _circleCenter = LatLng(31.2396273, 29.9602764);
      _circleRadius = 500.0;
    } else if (selectedArea == 'El-Raml') {
      _circleCenter = LatLng(31.2482232, 29.9748043);
      _circleRadius = 500.0;
    }

    _drawCircle();
    _moveCamera();
  }

  void _drawCircle() {
    if (_circleCenter != null) {
      Circle newCircle = Circle(
        circleId: CircleId(_selectedArea!),
        center: _circleCenter!,
        radius: _circleRadius,
        strokeColor: Color.fromARGB(255, 233, 92, 139),
        strokeWidth: 2,
        fillColor: const Color.fromARGB(255, 233, 178, 196),
      );

      setState(() {
        _circles.add(newCircle);
      });
    }
  }

  void _moveCamera() {
    if (_mapController != null && _circleCenter != null) {
      _mapController!.animateCamera(
        CameraUpdate.newLatLngZoom(_circleCenter!, 14), // Adjust zoom level as needed
      );
    }
  }

  void _onMapCreated(GoogleMapController controller) {
    setState(() {
      _mapController = controller;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          SizedBox(height: 27,),
          Container(
            height: 60,
            width: 500,
            padding: EdgeInsets.symmetric(horizontal: 20),
            decoration: BoxDecoration(
              color: Colors.white70,
            ),
            child: DropdownButton<String>(
              isExpanded: true,
              value: _selectedArea,
              hint: Text("Select an area"),
              style: TextStyle(color: Colors.black, fontSize: 18, fontWeight: FontWeight.bold),
              onChanged: (newValue) {
                _updateGeofenceArea(newValue!);
              },
              items: <String>['Smouha', 'Sporting','Sidi Bishr', 'Sidi Gabir', 'Al Ibrahimeyah', 'Roushdy',
                'Mahta Al Raml','Mansheya','Abu Qir', 'El-Mandara', 'Al-Mamoera','Al-Asafra', 'Al-Hadra',
                'Al-Akbal','Al-soyof', 'Gianaclis', 'Fleming', 'Bacos', 'Louran', 'Victoria', 'Glim', 'El-Raml' ]
                  .map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
            ),
          ),
          Container(
            height:675,
            width:500,
            child: GoogleMap(
              onMapCreated: _onMapCreated,
              initialCameraPosition: CameraPosition(
                target: LatLng(31.205753, 29.924526), // Default map position
                zoom: 13,
              ),
              circles: _circles,
            ),
          ),
          SizedBox(height: 5,),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                onPressed: () {
                  screenshotController.capture().then((image) { print("captured");}).catchError((onError) {
                    print(onError);
                  });
                },
                child: Text(
                  "Take picture",
                  style: TextStyle(fontSize: 15, color: Colors.white),
                ),
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(Colors.blue[400]),
                  padding: MaterialStateProperty.all(EdgeInsets.symmetric(horizontal: 35, vertical: 10)),
                  shape: MaterialStateProperty.all(RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  )),
                ),
              ),
              SizedBox(width: 55,),
              ElevatedButton(
                onPressed: () {
                  // Your code for video capturing
                },
                child: Text(
                  "Take video",
                  style: TextStyle(fontSize: 15, color: Colors.white),
                ),
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(Colors.blue[400]),
                  padding: MaterialStateProperty.all(EdgeInsets.symmetric(horizontal: 41, vertical: 10)),
                  shape: MaterialStateProperty.all(RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  )),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}




//--------------------------------------------------------------------------------------------
// import 'package:birdie_app/geofencing.dart';
// import 'package:birdie_app/widgets/maps.dart';
// import 'package:flutter/material.dart';
// import 'package:screenshot/screenshot.dart';

// class MonitorPage extends StatefulWidget {
//   const MonitorPage({super.key});

//   @override
//   State<MonitorPage> createState() => _MonitorPageState();
// }

// class _MonitorPageState extends State<MonitorPage> {
//   ScreenshotController screenshotController = ScreenshotController();
  
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Column(
//         children: [
//           Container(
//             height: 550,
//             //755,
//             width: 500,
//             child: Maps()),
//             SizedBox(height: 10,),
//               // Row(
//               //   mainAxisAlignment: MainAxisAlignment.center,
//               //   children: [
//               //     ElevatedButton(
//               //               onPressed: () {
//               //                 screenshotController.capture().then((image) { print("captured");}).catchError((onError) {
//               //                 print(onError);
//               //                 });
//               //               },
//               //               child: Text(
//               //                 "Take picture",
//               //                 style: TextStyle(fontSize: 15, color: Colors.white),
//               //               ),
//               //               style: ButtonStyle(
//               //                 backgroundColor:
//               //                     MaterialStateProperty.all(Colors.blue[400]),
//               //                 padding: MaterialStateProperty.all(
//               //                     EdgeInsets.symmetric(
//               //                         horizontal: 35, vertical: 10)),
//               //                 shape: MaterialStateProperty.all(
//               //                   RoundedRectangleBorder(
//               //                     borderRadius: BorderRadius.circular(10),
//               //                   ),
//               //                 ),
//               //               ),
//               //             ),
//               //             SizedBox(width: 70,),
//               //             ElevatedButton(
//               //               onPressed: () {
                              
                              
//               //               },
//               //               child: Text(
//               //                 "Take video",
//               //                 style: TextStyle(fontSize: 15, color: Colors.white),
//               //               ),
//               //               style: ButtonStyle(
//               //                 backgroundColor:
//               //                     MaterialStateProperty.all(Colors.blue[400]),
//               //                 padding: MaterialStateProperty.all(
//               //                     EdgeInsets.symmetric(
//               //                         horizontal: 41, vertical: 10)),
//               //                 shape: MaterialStateProperty.all(
//               //                   RoundedRectangleBorder(
//               //                     borderRadius: BorderRadius.circular(10),
//               //                   ),
//               //                 ),
//               //               ),
//               //             ),
//               //   ],
//               // ),
//         //       ElevatedButton(
//         //   onPressed: () {
//         //     Navigator.push(
//         //       context,
//         //       MaterialPageRoute(builder: (context) => GeofencingPage()),
//         //     );
//         //   },
//         //   child: Text('Start Geofencing'),
//         // ),
//         ],
//       ),
        
//     );
//   }
// }