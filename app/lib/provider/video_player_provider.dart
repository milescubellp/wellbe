import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

enum VideoPlayerStatus {
  idle,
  playing,
  paused,
}

class VideoPlayerProvider with ChangeNotifier {
  VideoPlayerController? _controller;

  VideoPlayerStatus _playerStatus = VideoPlayerStatus.idle;

  VideoPlayerController get controller => _controller!;
  VideoPlayerStatus get playerStatus => _playerStatus;

  Future<void> initializeController(String videoUrl) async {
    if (_controller != null) {
      _controller!.dispose();
    }
    _controller = VideoPlayerController.network(videoUrl);
    await _controller!.initialize();
    _controller!.addListener(videoPlayerListener);
    _controller!.setLooping(true);
    notifyListeners();
  }

  void videoPlayerListener() {
    if (_controller!.value.position >= _controller!.value.duration) {
      // Video has ended
      _playerStatus = VideoPlayerStatus.idle;
    } else if (_controller!.value.isPlaying) {
      _playerStatus = VideoPlayerStatus.playing;
    } else {
      _playerStatus = VideoPlayerStatus.paused;
    }
    notifyListeners();
  }

  void playVideo() {
    if (_controller?.value.duration != null) {
      if (_controller!.value.position == _controller!.value.duration) {
        // Restart the video if it has ended
        _controller!.seekTo(Duration.zero);
      }
      _controller!.play();
    }
  }

  void pauseVideo() {
    _controller!.pause();
  }

  void forward(Duration duration) {
    final newPosition = _controller!.value.position + duration;
    if (newPosition <= _controller!.value.duration) {
      _controller!.seekTo(newPosition);
    }
  }

  void backward(Duration duration) {
    final newPosition = _controller!.value.position - duration;
    if (newPosition >= Duration.zero) {
      _controller!.seekTo(newPosition);
    }
  }

  void shuffle() {
    // Implement shuffle logic here
    // Example: Randomly select a new video and call `initializeController` with the new video URL
  }

  @override
  void disposeController() {
    // _controller!.removeListener(videoPlayerListener);
    _controller!.dispose();
    super.dispose();
  }
}
