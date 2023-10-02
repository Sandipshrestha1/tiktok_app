// import 'package:flutter/material.dart';

// class VideoWidgets extends StatefulWidget {

//   final String url;
//   const VideoWidgets({super.key, required this.url});

//   @override
//   State<VideoWidgets> createState() => _VideoWidgetsState();
// }

// class _VideoWidgetsState extends State<VideoWidgets> {
// late VideoPlayerController videoPlayerController;
// late Future<void> _initializeVideoPlayerFuture;

// @override 
// void initState() {

//   super.initState();
//   videoPlayerController = videoPlayerController.network(widget.url);

//   _initializeVideoPlayerFuture = videoPlayerController.initialize().then(_) {
//     setState(() { });
//   };
//     videoPlayerController.setLooping(true);
//     videoPlayerController.play();
  
// }

// @override 
// void dispose() {
//   super.dispose();
//   videoPlayerController.dispose();
// }





//   @override
//   Widget build(BuildContext context) {
//     return Container(





//     );
//   }
// }  



import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class VideoWidgets extends StatefulWidget {
  final String url;

  const VideoWidgets({Key? key, required this.url}) : super(key: key);

  @override
  State<VideoWidgets> createState() => _VideoWidgetsState();
}

class _VideoWidgetsState extends State<VideoWidgets> {
  late VideoPlayerController _videoPlayerController;
  late Future<void> _initializeVideoPlayerFuture;

  @override
  void initState() {
    super.initState();
    _videoPlayerController = VideoPlayerController.network(widget.url);

    _initializeVideoPlayerFuture =
        _videoPlayerController.initialize().then((_) {
      setState(() {});
    });

    _videoPlayerController.setLooping(true);
    _videoPlayerController.play();
  }

  @override
  void dispose() {
    super.dispose();
    _videoPlayerController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: FutureBuilder(
        future: _initializeVideoPlayerFuture,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            return AspectRatio(
              aspectRatio: _videoPlayerController.value.aspectRatio,
              child: VideoPlayer(_videoPlayerController),
            );
          } else {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
    );
  }
}
