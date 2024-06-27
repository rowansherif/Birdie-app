import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:easy_geofencing/easy_geofencing.dart';


class MonitorPage extends StatefulWidget {
  @override
  _MonitorPageState createState() => _MonitorPageState();
}

class _MonitorPageState extends State<MonitorPage> {
  GoogleMapController? _mapController;
  List<LatLng> _polygonPoints = [];
  Set<Polygon> _polygons = {};
  String _selectedArea = 'Alexandria'; 

  @override
  void initState() {
    super.initState();
    _initializeGeofencing();
  }

  void _initializeGeofencing() {
    _updateGeofenceArea(_selectedArea);
  }

  void _updateGeofenceArea(String selectedArea) {
    setState(() {
      _selectedArea = selectedArea;
      _polygonPoints.clear();
    });


    if (selectedArea == 'Alexandria') {
      _polygonPoints = [
        LatLng(37.7749, -122.4194),
        LatLng(37.7749, -122.4300),
        LatLng(37.7816, -122.4300),
        LatLng(37.7816, -122.4194),
      ];
    } else if (selectedArea == 'Area 2') {
      _polygonPoints = [
        LatLng(40.7128, -74.0060),
        LatLng(40.7128, -74.0000),
        LatLng(40.7185, -74.0000),
        LatLng(40.7185, -74.0060),
      ];
    }

    _drawPolygon();
  }

void _drawPolygon() {
  _polygons.clear();
  Polygon newPolygon = Polygon(
    polygonId: PolygonId(_selectedArea), 
    points: _polygonPoints,
    strokeColor: Colors.blue,
    strokeWidth: 2,
    fillColor: Colors.blue.withOpacity(0.3),
  );

  _polygons.add(newPolygon);

 
  setState(() {
    _polygons = _polygons.toSet();
  });
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
          Container(
            height:755,
            width:500,
            child: GoogleMap(
              onMapCreated: _onMapCreated,
              initialCameraPosition: CameraPosition(
                target: LatLng(31.205753, 29.924526), // Default map position
                zoom: 12,
              ),
              polygons: _polygons,
            ),
          ),
          SizedBox(height: 10,),
          DropdownButton<String>(
            value: _selectedArea,
            onChanged: (newValue) {
              _updateGeofenceArea(newValue!);
            },
            items: <String>['Alexandria', 'Area 2']
                .map<DropdownMenuItem<String>>((String value) {
              return DropdownMenuItem<String>(
                value: value,
                child: Text(value),
              );
            }).toList(),
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