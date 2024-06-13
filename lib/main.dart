import 'package:birdie_app/screens/aboutuspage.dart';
import 'package:birdie_app/screens/createaccount.dart';
import 'package:birdie_app/screens/dvrscreen.dart';
import 'package:birdie_app/screens/forgetpassword.dart';
import 'package:birdie_app/screens/home.dart';
import 'package:birdie_app/screens/login.dart';
import 'package:birdie_app/screens/profilepage.dart';
import 'package:birdie_app/screens/splash.dart';
import 'package:birdie_app/screens/monitor.dart';
import 'package:birdie_app/screens/userpolices.dart';
import 'package:flutter/material.dart';

void main(){
  runApp(Birdie());
}


 class Birdie extends StatefulWidget {
  const Birdie ({super.key});

  @override
  State<Birdie> createState() => _BirdieState();
}

class _BirdieState extends State<Birdie> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: '/',

      routes: {
        '/': (context) => const Splash(),
        '/login': (context) => const Login(),
        '/createaccount': (context) => const CreateAccount(),
        '/forgetpassword': (context) => const ForgetPasswordpage(),
        '/home': (context) => const Home(),
        '/profilepage': (context) => const ProfilePage(),
        '/monitorpage': (context) => const MonitorPage(),
        '/dvrpage': (context) => const DvrScreen(),
        '/aboutuspage': (context) => const AboutUsPage(),
        '/userpolicespage': (context) => const UserPolicesPage(),
      }
    );
   }
}
