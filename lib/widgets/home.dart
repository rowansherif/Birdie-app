import 'package:birdie_app/navigation%20bloc/navigation_bloc.dart';
import 'package:birdie_app/navigation%20bloc/navigation_event.dart';
import 'package:birdie_app/navigation%20bloc/navigation_state.dart';
import 'package:birdie_app/screens/dvrscreen.dart';
import 'package:birdie_app/screens/monitor.dart';
import 'package:birdie_app/screens/profilepage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
   Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => NavigationBloc(),
      child: MaterialApp(
        home: NavigationWrapper(),
      ),
    );
  }
}

class NavigationWrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<NavigationBloc, NavigationState>(
        builder: (context, state) {
          if (state is LoadingState) {
            return Center(child: CircularProgressIndicator(
                valueColor: AlwaysStoppedAnimation<Color>(Colors.blue),
                strokeWidth: 6.0,));
          } else if (state is CarLifeState) {
            return Text('Car Life', style: TextStyle(color: Colors.black),);
          } else if (state is DVRState) {
            return DvrScreen();
          } else if (state is MonitorState) {
            return MonitorPage();
          } else if (state is FilesState) {
            return Text('Files', style: TextStyle(color: Colors.black),);
          }else if (state is ProfilePageState) {
            return ProfilePage();
          }return Container();
        },
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        backgroundColor: Colors.blue[400],
        iconSize: 40,
        selectedFontSize: 15,
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.black26,
        currentIndex: _getCurrentIndex(context),
        onTap: (index) {
          switch (index) {
            case 0:
              BlocProvider.of<NavigationBloc>(context).add(NavigateToCarLife());
              break;
            case 1:
              BlocProvider.of<NavigationBloc>(context).add(NavigateToDvr());
              break;
            case 2:
              BlocProvider.of<NavigationBloc>(context).add(NavigateToMonitor());
              break;
            case 3:
              BlocProvider.of<NavigationBloc>(context).add(NavigateToFiles());
              break;
            case 4:
              BlocProvider.of<NavigationBloc>(context).add(NavigateToProfilePage());
              break;
          }
        },
                items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: "Car Life",
             
            
            ),
            BottomNavigationBarItem(
            icon: Icon(Icons.videocam),
            label: "DVR",
            
            ),
            BottomNavigationBarItem(
            icon: Icon(Icons.camera_alt),
            label: "Moitor",

            
            ),
            BottomNavigationBarItem(
            icon: Icon(Icons.insert_drive_file),
            label: "Files",

            
            ),
            BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: "Profile",

            
            ),
        ],
      ),
    );
  }

  int _getCurrentIndex(BuildContext context) {
    final state = context.watch<NavigationBloc>().state;
    if (state is CarLifeState) {
      return 0;
    } else if (state is DVRState) {
      return 1;
    } else if (state is MonitorState) {
      return 2;
    } else if (state is FilesState) {
      return 3;
    }
    else if (state is ProfilePageState) {
      return 4;
    }
    return 0;
  }
}


//--------------------------------------------------------------------------------------------------
// class Home extends StatefulWidget {
//   const Home({super.key});

//   @override
//   State<Home> createState() => _HomeState();
// }

// class _HomeState extends State<Home> {

//   int _currentindex = 0;

//   final tabs =[
//     Center(child: Text('car life')),
//     Center(child: DvrScreen() ),
//     Center(child: MonitorPage()),
//     Center(child: Text('Files')),
//     Center(child: ProfilePage(),),

//   ];

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: tabs[_currentindex],
      
//       bottomNavigationBar: BottomNavigationBar(
//         currentIndex: _currentindex,
//         type: BottomNavigationBarType.fixed,
//         backgroundColor: Colors.blue[400],
//         iconSize: 40,
//         selectedFontSize: 15,
//         selectedItemColor: Colors.white,
//         unselectedItemColor: Colors.black26,
//         items: [
//           BottomNavigationBarItem(
//             icon: Icon(Icons.home),
//             label: "Car Life",
             
            
//             ),
//             BottomNavigationBarItem(
//             icon: Icon(Icons.videocam),
//             label: "DVR",
            
//             ),
//             BottomNavigationBarItem(
//             icon: Icon(Icons.camera_alt),
//             label: "Moitor",

            
//             ),
//             BottomNavigationBarItem(
//             icon: Icon(Icons.insert_drive_file),
//             label: "Files",

            
//             ),
//             BottomNavigationBarItem(
//             icon: Icon(Icons.person),
//             label: "Profile",

            
//             ),
//         ],
//         onTap: (int index){
//           setState(() {
//             _currentindex = index;

//           });

//         },
//       ),
      
//     );
//   }
// }