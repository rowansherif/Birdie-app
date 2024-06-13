import 'package:flutter/material.dart';

class AboutUsPage extends StatefulWidget {
  const AboutUsPage({super.key});

  @override
  State<AboutUsPage> createState() => _AboutUsPageState();
}

class _AboutUsPageState extends State<AboutUsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 70,
        backgroundColor: Colors.blue,
        title: Text('About Us', style: TextStyle(fontSize: 25, color: Colors.white),),
        iconTheme: IconThemeData(color: Colors.white),
      ),
      body:
       Column(
         children: [
          SizedBox(height: 10,),
         
             Text("Berdie is an advanced car monitoring device aiding parents in overseeing their children's safety during drives. Featuring high-quality cameras that monitor the front and rear, it enables users to easily observe the driver and passengers. The device provides live streaming, allowing parents to monitor the journey continuously, maintaining a high level of security and privacy.",
             style: TextStyle(
              fontWeight: FontWeight.w400,
              fontSize: 18,
             ),
             ),
         ],
       ),
    );
  }
}