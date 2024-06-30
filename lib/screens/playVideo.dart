import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:video_player/video_player.dart';

class playVideo extends StatefulWidget {
  const playVideo({Key? key, required this.videoURL, required this.videoName})
      : super(key: key);
  final String videoURL;
  final String videoName;
  @override
  State<playVideo> createState() => _playVideoState();
}

class _playVideoState extends State<playVideo> {
  late VideoPlayerController _controller;
  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  void initState() {
    _controller = VideoPlayerController.networkUrl(
      Uri.parse(widget.videoURL),
    );
    _controller.setLooping(true);
    _controller.initialize().then((_) => setState(() {}));
    _controller.play();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('play video'),
      ),
      body: Center(
        child: Column(
          children: [
            AspectRatio(
              aspectRatio: _controller.value.aspectRatio,
              child:VideoPlayer(_controller),
            ),
            SizedBox(height: 20,),
            Text(widget.videoName),
          ],
        ),
      ),
    );
  }
}
