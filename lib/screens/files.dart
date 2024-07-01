import 'package:birdie_app/screens/playVideo.dart';
import 'package:birdie_app/screens/video_list.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class Files extends StatefulWidget {
  const Files({super.key});

  @override
  State<Files> createState() => _FilesState();
}

class _FilesState extends State<Files> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Videos List'),
      ),
      body: Center(
          child: Padding(
        padding: const EdgeInsets.all(15.8),
        child: Column(
          children: [
            StreamBuilder(
                stream:
                    FirebaseFirestore.instance.collection('videos').snapshots(),
                builder: (context, snapshot) {
                  List<Row> videoWidgets = [];
                  if (!snapshot.hasData) {
                    const CircularProgressIndicator();
                  } else {
                    final videos = snapshot.data?.docs.reversed.toList();
                    for (var video in videos!) {
                      final videoWidget = Row(
                        children: [
                          Text(video['name']),
                          IconButton(
                            onPressed: () {
                              Navigator.of(context).push(
                                MaterialPageRoute(builder: (_){
                                   return playVideo(videoURL: 'https://firebasestorage.googleapis.com/v0/b/birdie-app-ab3c6.appspot.com/o/Videos%2F2024-06-30T20%3A50%3A13.528882.mp4?alt=media&token=9b7fc168-18e5-46dd-9160-ee351783bf09', videoName: 'User Video',);

                                },),
                              );
                            },
                            icon: Icon(Icons.play_arrow_rounded),
                          ),
                        ],
                      );
                      videoWidgets.add(videoWidget);
                    }
                  }
                  return Expanded(
                    child: ListView(
                      children: videoWidgets,
                    ),
                  );
                }),
          ],
        ),
      )),
    );
  }
}
