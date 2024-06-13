import 'package:flutter/material.dart';

class FeedbackPage extends StatefulWidget {
  const FeedbackPage({super.key});

  @override
  State<FeedbackPage> createState() => _FeedbackPageState();
}

class _FeedbackPageState extends State<FeedbackPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 70,
        backgroundColor: Colors.blue,
        title: Text('Give Feedback', style: TextStyle(fontSize: 25, color: Colors.white),),
        iconTheme: IconThemeData(color: Colors.white),
      ),
      body: Column(
        children: [
          Container(
            child: TextField(
              decoration: InputDecoration(
                labelText: 'Enter your username', // Placeholder text
                border: OutlineInputBorder(), // Border for the input field
              ),
            ),
          ),
        ],
      ),
    );
  }
}