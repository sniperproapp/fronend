import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

import 'package:sniper_pro/src/domain/models/video.dart';

import 'package:video_player/video_player.dart';

class ClientplayvideoContent extends StatelessWidget {
  Video? video;

  ClientplayvideoContent(this.video);

  late final VideoPlayerController _videoPlayerController =
      VideoPlayerController.networkUrl(Uri.parse(video!.link))
        ..initialize().then((_) {
          // Ensure the first frame is shown after the video is initialized, even before the play button has been pressed.
        });

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      onPopInvoked: (didPop) async {
        if (didPop) {
          return;
        }
        _videoPlayerController.dispose();
        final navigator = Navigator.of(context);

        navigator.pop();
      },
      child: Scaffold(
        backgroundColor: Colors.black,
        body: Center(
          child: AspectRatio(
            aspectRatio: _videoPlayerController.value.aspectRatio,
            child: VideoPlayer(_videoPlayerController),
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            _videoPlayerController.value.isPlaying
                ? _videoPlayerController.pause()
                : _videoPlayerController.play();
          },
          child: Icon(
            _videoPlayerController.value.isPlaying
                ? Icons.pause
                : Icons.play_arrow,
          ),
        ),
      ),
    );
  }
}
