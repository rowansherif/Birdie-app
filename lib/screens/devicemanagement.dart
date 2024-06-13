import 'package:flutter/material.dart';

class DeviceManagement extends StatefulWidget {
  const DeviceManagement({super.key});

  @override
  State<DeviceManagement> createState() => _DeviceManagementState();
}

class _DeviceManagementState extends State<DeviceManagement> {
  String title = 'Device Management';
  String item1 = 'Scan QR to connect device';
  String item2 = 'Upload Driver face';
  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(title),
      trailing: PopupMenuButton(
        itemBuilder: (context) => [
           PopupMenuItem(
            child: Text(item1),
            value: item1 ,
            ),
            PopupMenuItem(
            child: Text(item2),
            value: item2 ,
            ),
        ],
        ),
    );
  }
}