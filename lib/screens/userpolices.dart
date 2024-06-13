import 'package:flutter/material.dart';

class UserPolicesPage extends StatefulWidget {
  const UserPolicesPage({super.key});

  @override
  State<UserPolicesPage> createState() => _UserPolicesPageState();
}

class _UserPolicesPageState extends State<UserPolicesPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 70,
        backgroundColor: Colors.blue,
        title: Text('User Polices', style: TextStyle(fontSize: 25, color: Colors.white),),
        iconTheme: IconThemeData(color: Colors.white),
      ),
      body:
       SingleChildScrollView(
         child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
           children: [
            SizedBox(height: 10,),
             Text("successors and permitted assigns, will have any right to enforce any of these Terms.",
             style: TextStyle(
              fontWeight: FontWeight.w400,
              fontSize: 16,
             ),
             ),
             SizedBox(height: 10,),
         
             Text("[Privacy Policy]",
             style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 20,
             ),
             ),
         
             SizedBox(height: 10,),
         
             Text("1. INFORMATION SHARING",
             style: TextStyle(
              fontWeight: FontWeight.w500,
              fontSize: 18,
             ),
             ),
         
             SizedBox(height: 10,),
         
             Text("1.1 Social Sites. In addition to using Facebook/Wechat credentials to set up an Account, certain Services may permit you to choose to share information and videos taken with our DVR products with Social Sites. When you choose to share with a Social Site, we may share that video or information as well as additional personal information about you with the Social Site. Information shared with a Social Site is subject to that Social Site’s privacy policy and practices, you should familiarize yourself with the Social Site’s privacy policy and practices before sharing. Facebook’s Data Policy is located at www.facebook.com/about/privacy.",
             style: TextStyle(
              fontWeight: FontWeight.w400,
              fontSize: 16,
             ),
             ),

             SizedBox(height: 10,),
         
             Text("1.2 Disclaimer. We cannot ensure that all of your personal information will never be disclosed in ways not otherwise described in this Policy.",
             style: TextStyle(
              fontWeight: FontWeight.w400,
              fontSize: 16,
             ),
             ),

             SizedBox(height: 10,),
         
             Text("2. THIRD-PARTY PROVIDERS",
             style: TextStyle(
              fontWeight: FontWeight.w500,
              fontSize: 18,
             ),
             ),

             SizedBox(height: 10,),
         
             Text("2.1 Google Analytics. We use Google, a third-party analytics provider, to collect information about Services usage and the users of the Services, including demographic and interest-level information. Google uses cookies and pixels in order to collect demographic and interest-level information and usage information from users that visit the Services, including information about the pages where users enter and exit the Services and the pages users view on the Services, time spent, browser, operating system, and IP address. Cookies and pixels allow Google to recognize a user when a user visits the Services and when the user visits other websites. Google uses the information it collects from the Services and other websites to share with us and other website operator’s information about users including age range, gender, geographic regions, general interests, and details about devices used to visit websites and purchase items. We do not link information we receive from Google with any of your personally identifiable information. For more information regarding Google’s use of cookies, pixels, and collection and use of information, see the Google Privacy Policy. If you would like to opt out of Google Analytics tracking, please visit the following link: Google Analytics Opt-out Browser Add-on.",
             style: TextStyle(
              fontWeight: FontWeight.w400,
              fontSize: 16,
             ),
             ),

             SizedBox(height: 10,),
         
             Text("2.2 Tencent Bugly Analytics. We use Bugly, a third-party crash analytics provider, to collect information about crash and the users of the Services.",
             style: TextStyle(
              fontWeight: FontWeight.w400,
              fontSize: 16,
             ),
             ),
           ],
         ),
       ),
    );
  }
}