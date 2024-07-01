import 'dart:isolate';
import 'package:birdie_app/screens/devicemanagement.dart';
import 'package:birdie_app/screens/settings.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:firebase_auth/firebase_auth.dart';

class ProfilePage extends StatelessWidget {
  // final _auth = FirebaseAuth.instance;
  const ProfilePage({super.key});
  // @override
  // void initState() {
  //   // super.initState();
  //   getCurrentUser();
  // }

  // void getCurrentUser() {
  //   try {
  //     final user = _auth.currentUser;
  //     late User signedInUser;
  //     if (user != null) {
  //       signedInUser = user;
  //     }
  //   } catch (e) {
  //     print(e);
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Stack(children: [
          Column(
            children: [
              Container(
                height: 220,
                decoration: BoxDecoration(
                  color: Colors.blue[400],
                ),
              ),
              Container(
                decoration: BoxDecoration(
                  color: Colors.blue[400],
                ),
                child: Container(
                  height: 650,
                  width: 500,
                  decoration: BoxDecoration(
                    color: Colors.white70,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(30),
                      topRight: Radius.circular(30),
                    ),
                  ),
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SizedBox(
                          height: 30,
                        ),
                        Container(
                          padding: EdgeInsets.only(left: 15, top: 15),
                          height: 60,
                          width: 380,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Text(
                            'User name',
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.bold),
                          ),
                        ),
                        SizedBox(
                          height: 30,
                        ),
                        Container(
                          padding: EdgeInsets.only(left: 15, top: 15),
                          height: 60,
                          width: 380,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Text('E-mail',
                              style: TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.bold)),
                        ),
                        SizedBox(
                          height: 30,
                        ),
                        Container(
                            height: 60,
                            width: 380,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: DeviceManagement()),
                        SizedBox(
                          height: 30,
                        ),
                        Container(
                            height: 60,
                            width: 380,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Settings()),
                        SizedBox(
                          height: 30,
                        ),
                        ElevatedButton(
                          onPressed: () {},
                          child: Text(
                            "GPS Tracking History",
                            style: TextStyle(fontSize: 15, color: Colors.black),
                          ),
                          style: ButtonStyle(
                            backgroundColor:
                                MaterialStateProperty.all(Colors.white),
                            padding: MaterialStateProperty.all(EdgeInsets.only(
                                left: 20, right: 205, top: 20, bottom: 15)),
                            shape: MaterialStateProperty.all(
                              RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 30,
                        ),
                        ElevatedButton(
                          onPressed: () {
                            Navigator.popAndPushNamed(context, '/login');
                          },
                          child: Text(
                            "Log Out",
                            style: TextStyle(fontSize: 15, color: Colors.black),
                          ),
                          style: ButtonStyle(
                            backgroundColor:
                                MaterialStateProperty.all(Colors.white),
                            padding: MaterialStateProperty.all(
                                EdgeInsets.symmetric(
                                    horizontal: 70, vertical: 16)),
                            shape: MaterialStateProperty.all(
                              RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                            ),
                          ),
                        ),
                      ]),
                ),
              ),
            ],
          ),
          Positioned(
            left: 120,
            top: 130,
            child: Container(
              height: 170,
              width: 170,
              child: Image(
                image: AssetImage('assets/User-Profile.png'),
              ),
            ),
          ),
        ]),
      ),
    );
  }
}