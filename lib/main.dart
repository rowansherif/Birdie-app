import 'package:birdie_app/screens/Notifications.dart';
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
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
// import 'package:birdie_flutter_project/firebase_options.dart';
import 'package:birdie_app/firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:google_sign_in/google_sign_in.dart';

// Future<void> main() async {
//   WidgetsFlutterBinding.ensureInitialized();
//   await Firebase.initializeApp(
//     options: DefaultFirebaseOptions.currentPlatform,
//   );
//   runApp(Birdie());
// }
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);
  FirebaseApi().initNotifications();
  runApp(Birdie());
}

Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  await Firebase.initializeApp();
  print('Handling a background message: ${message.messageId}');
}

class Birdie extends StatefulWidget {
  const Birdie({super.key});

  @override
  State<Birdie> createState() => _BirdieState();
}

class _BirdieState extends State<Birdie> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(initialRoute: '/', routes: {
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
    });
  }
}
