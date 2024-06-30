import 'package:birdie_app/widgets/home.dart';
import 'package:flutter/material.dart';
import 'package:birdie_app/screens/aboutuspage.dart';
import 'package:birdie_app/screens/createaccount.dart';
import 'package:birdie_app/screens/dvrscreen.dart';
import 'package:birdie_app/screens/forgetpassword.dart';
import 'package:birdie_app/screens/login.dart';
import 'package:birdie_app/screens/profilepage.dart';
import 'package:birdie_app/screens/splash.dart';
import 'package:birdie_app/screens/monitor.dart';
import 'package:birdie_app/screens/userpolices.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:birdie_app/firebase_options.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(Birdie());
}

class Birdie extends StatelessWidget {
  const Birdie({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Birdie App',
      initialRoute: '/',

      routes: {
        '/': (context) => const Splash(),
        '/login' : (context) => const Login(),
        '/createaccount': (context) => const CreateAccount(),
        '/forgetpassword': (context) => const ForgetPasswordpage(),
        '/home': (context) => const Home(),
        '/profilepage': (context) => const ProfilePage(),
        '/monitorpage': (context) => MonitorPage(),
        '/dvrpage': (context) => const DvrScreen(),
        '/aboutuspage': (context) => const AboutUsPage(),
        '/userpolicespage': (context) => const UserPolicesPage(),
      },
    );
  }
}
