import 'package:birdie_app/widgets/emojiratingbar.dart';
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
      body: SingleChildScrollView(
        child: Center(
          child: Column(
                  children: [
                    SizedBox(height: 30),
                    Container(
                      padding: EdgeInsets.only(left: 10),
                      width: 370,
                      child: TextField(
                          decoration: InputDecoration(
                            prefix: Icon(Icons.person, color: Colors.black,),
                            labelText: 'Enter your username', // Placeholder text
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(50)
                            ), // Border for the input field
                          ),
                        ),
                    ),
                      SizedBox(height: 30),
                      Container(
                        padding: EdgeInsets.only(left: 10),
                        width: 370,
                        child: TextField(
                          decoration: InputDecoration(
                            prefix: Icon(Icons.email),
                            labelText: 'Enter your E-mail', // Placeholder text
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(50)), // Border for the input field
                          ),
                        ),
                      ),
                      SizedBox(height: 25),
                      Text('How was your experience?', 
                      textAlign: TextAlign.start,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 27,
                       ),),
                      SizedBox(height: 20),
                      
                      Container(
                        height: 80,
                        width: 400,
                        child: EmojiRatingBar()),

                        SizedBox(height: 20),
                      Container(
                        height: 100,
                        width: 370,
                        child: TextField(
                          decoration: InputDecoration(
                            hintText: 'Suggest anything we can improve ', 
                            contentPadding: EdgeInsets.only(bottom: 150, left:15),// Placeholder text
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10)), // Border for the input field
                          ),
                        ),
                      ),
                      SizedBox(height: 30,),
                    Container(
                      width: 350,
                      child: ElevatedButton(onPressed:() {}, 
                      child: Text("Send feedback",
                      style: TextStyle(fontSize: 15, color: Colors.white),
                      ),
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all(Colors.blue[400]),
                        shape: MaterialStateProperty.all(RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(50),
                        ),
                        ),
                      ),
                      ),
                    ),
                  ],
                ),
        ),
      ),
      
    );
  }
}