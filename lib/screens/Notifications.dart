// import 'package:firebase_messaging/firebase_messaging.dart';
// import 'package:flutter/material.dart';

// class FirebaseNotifications extends StatefulWidget {
//   @override
//   _FirebaseNotificationsState createState() => _FirebaseNotificationsState();
// }

// class _FirebaseNotificationsState extends State<FirebaseNotifications> {
//   @override
//   void initState() {
//     super.initState();
//     FirebaseMessaging.instance.getToken().then((String? token) {
//       assert(token != null);
//       print("FCM Token: $token");
//       // Save this token to your server or database to send notifications to this device
//     });

//     FirebaseMessaging.onMessage.listen((RemoteMessage message) {
//       print('Received a message while in foreground!');
//       if (message.notification != null) {
//         print('Message title: ${message.notification!.title}');
//         print('Message body: ${message.notification!.body}');
//       }
//     });

//     FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) {
//       print('A new onMessageOpenedApp event was published!');
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Home'),
//       ),
//       body: Center(
//         child: Text('Waiting for notifications...'),
//       ),
//     );
//   }
// }

import 'package:firebase_messaging/firebase_messaging.dart';

Future<void> HandleBackGrounMessage(RemoteMessage message) async {
  print('titile:${message.notification?.title}');
  print('Body:${message.notification?.body}');
  print('Payload:${message.data}');

}

class FirebaseApi {
  final _firebaseMessaging = FirebaseMessaging.instance;
  Future<void> initNotifications() async {
    await _firebaseMessaging.requestPermission();
    final fCMToken = await _firebaseMessaging.getToken();
    print('Token:$fCMToken');
    FirebaseMessaging.onBackgroundMessage(HandleBackGrounMessage);
  }
}
