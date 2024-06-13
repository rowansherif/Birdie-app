import 'package:birdie_app/maps.dart';
import 'package:flutter/material.dart';

class DvrScreen extends StatefulWidget {
  const DvrScreen({super.key});

  @override
  State<DvrScreen> createState() => _DvrScreenState();
}

class _DvrScreenState extends State<DvrScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          SingleChildScrollView(
            child: Column(
              children:[
                SizedBox(height: 30,),
            
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
                SizedBox(height: 10),
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
                  child: Text('Tracks'),
                  decoration: BoxDecoration(
                    color: Colors.black12,
                ),
                ),
                SizedBox(height: 5,),
                //Maps(),
              ]
            ),
          ),
        ],
      ),
    );
  }
}