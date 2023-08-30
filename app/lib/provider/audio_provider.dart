// import 'dart:typed_data';
//
// import 'package:audioplayers/audioplayers.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
//
// enum AudioState {
//   stopped,
//   playing,
//   paused,
// }
//
// class AudioProvider extends ChangeNotifier {
//   int maxduration = 100;
//   int currentpos = 0;
//   String currentpostlabel = "00:00";
//   String audioasset = "assets/audio/Free_Test_Data_500KB_MP3.mp3";
//   bool isplaying = false;
//   bool audioplayed = false;
//   late Uint8List audiobytes;
//
//   AudioPlayer player = AudioPlayer();
//   AudioState _audioState = AudioState.stopped;
//   void init({isInit = false}) {
//     Future.delayed(Duration.zero, () async {
//       ByteData bytes =
//           await rootBundle.load(audioasset); //load audio from assets
//       audiobytes =
//           bytes.buffer.asUint8List(bytes.offsetInBytes, bytes.lengthInBytes);
//       //convert ByteData to Uint8List
//
//       player.onDurationChanged.listen((Duration d) {
//         //get the duration of audio
//         maxduration = d.inMilliseconds;
//         if (isInit != null) notifyListeners();
//       });
//
//       player.onPositionChanged.listen((Duration p) {
//         currentpos =
//             p.inMilliseconds; //get the current position of playing audio
//
//         //generating the duration label
//         int shours = Duration(milliseconds: currentpos).inHours;
//         int sminutes = Duration(milliseconds: currentpos).inMinutes;
//         int sseconds = Duration(milliseconds: currentpos).inSeconds;
//
//         int rhours = shours;
//         int rminutes = sminutes - (shours * 60);
//         int rseconds = sseconds - (sminutes * 60 + shours * 60 * 60);
//
//         currentpostlabel = "$rhours:$rminutes:$rseconds";
//
//         notifyListeners();
//       });
//     });
//   }
//
//   AudioState get audioState => _audioState;
//   // Future<void> seek(seekval) async {
//   //   await player.seek(Duration(milliseconds: seekval));
//   // // }
//   //
//   void play() {
//     // Logic to start playing audio
//     _audioState = AudioState.playing;
//     notifyListeners();
//   }
//
//   void pause() {
//     // Logic to pause audio
//     _audioState = AudioState.paused;
//     notifyListeners();
//   }
//
//   void stop() {
//     // Logic to stop audio
//     _audioState = AudioState.stopped;
//     notifyListeners();
//   }
// }
