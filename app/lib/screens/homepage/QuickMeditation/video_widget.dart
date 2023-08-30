import 'dart:async';
import 'dart:io';

import 'package:audio_video_progress_bar/audio_video_progress_bar.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rxdart/rxdart.dart';
import 'package:video_player/video_player.dart';
import 'package:wellbe/utilites/colors.dart';
import 'package:wellbe/widgets/execute_after_frame_render.dart';

import '../../../provider/MoodProvider/mood_provider.dart';
import '../../../provider/ThoughtProvider/thought_provider.dart';
import '../../../provider/video_player_provider.dart';
import '../../../utilites/helper.dart';
import '../../../widgets/custom_inkwell_btn.dart';
import '../../../widgets/custom_loader.dart';
import '../../../widgets/custom_text.dart';
import '../MoodSpace/academic_audio.dart';
import '../Recomendation/recomendation_screen.dart';

class VideoWidget extends StatefulWidget {
  double sliderValue;
  final String videoUrl;
  Key? key;
  bool isNavigate;
  String screenName;
  String thoughtId;

  VideoWidget({
    this.sliderValue = 0.0,
    required this.videoUrl,
    this.isNavigate = false,
    this.screenName = '',
    this.thoughtId = '',
    this.key,
  }) : super(key: key);

  @override
  State<VideoWidget> createState() => _VideoWidgetState();
}

class _VideoWidgetState extends State<VideoWidget> {
  Duration videoDuration = Duration.zero;
  bool showErrorImage = false; // Track whether to show the error image.
  late VideoPlayerController videoController;
  late Stream<PositionData> videoPositionStream;
  bool isVideoCompleted = false;
  bool isVideoLoading = true;

  @override
  void initState() {
    super.initState();
    videoController = widget.videoUrl.startsWith('https:')
        ? VideoPlayerController.network(widget.videoUrl)
        : VideoPlayerController.file(File(widget.videoUrl));
    videoPositionStream = _createPositionDataStream();
    videoController.initialize().then((_) {
      setState(() {
        isVideoLoading = false;
        videoController.play();
      });
    }).catchError((error) {
      setState(() {
        isVideoLoading = false;
        showErrorImage = true;
      });
    });
    ;
    if (widget.thoughtId.isNotEmpty)
      Provider.of<ThoughtProvider>(context, listen: false)
          .addUserThoughts(widget.thoughtId, (status) {}, context);

    if (widget.isNavigate)
      videoController.addListener(() {
        if (videoController.value.position >= videoController.value.duration) {
          debugPrint('moving to next screen...');
          Helper.toScreen(
              context,
              RecommendationScreen(
                screenName: 'alltab',
              ));
        }
      });
  }

  @override
  void dispose() {
    videoController.pause();

    videoController.dispose();

    super.dispose();
  }

  Stream<PositionData> _createPositionDataStream() {
    final positionStreamController = StreamController<Duration>();
    final bufferedPositionStreamController = StreamController<Duration>();
    final durationStreamController = StreamController<Duration>();

    // Listen to the video controller's position changes and add them to the stream
    videoController.addListener(() {
      if (videoController.value.position != null) {
        positionStreamController.add(videoController.value.position);
        if (videoController.value.position >= videoController.value.duration) {
          setState(() {
            isVideoCompleted = true;
          });
        }
      }
    });

    // Listen to the video controller's buffered position changes and add them to the stream
    videoController.addListener(() {
      if (videoController.value.buffered.isNotEmpty) {
        bufferedPositionStreamController
            .add(videoController.value.buffered.last.end);
      }
    });

    // Listen to the video controller's duration changes and add them to the stream
    videoController.addListener(() {
      if (videoController.value.duration != null) {
        durationStreamController.add(videoController.value.duration);
      }
    });

    final positionStream = positionStreamController.stream;
    final bufferedPositionStream = bufferedPositionStreamController.stream;
    final durationStream = durationStreamController.stream;

    // Combine the position, buffered position, and duration streams
    return Rx.combineLatest3<Duration, Duration, Duration, PositionData>(
      positionStream,
      bufferedPositionStream,
      durationStream,
      (progress, buffered, total) => PositionData(progress, buffered, total),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Consumer2<VideoPlayerProvider, MoodProvider>(
      builder: (context, videoPlayerProvider, moodProvider, child) {
        return Stack(
          alignment: Alignment.bottomCenter,
          children: [
            // Step 3: Container to hold the video player or the preview image.
            Container(
                height: 230,
                decoration: BoxDecoration(),
                child: showErrorImage
                    ? Image.asset(
                        'assets/images/videonotavailable.png', // Replace this with the path to your fallback image.
                        fit: BoxFit.cover,
                      )
                    : ClipRRect(
                        borderRadius: BorderRadius.circular(20),
                        child: VideoPlayer(
                          videoController,
                        ))),
            // Step 4: Show a
            // black container if the video is not playing
            if (!videoController.value.isPlaying && !showErrorImage)
              Container(
                height: 230,
                decoration: BoxDecoration(
                  color: Colors.black45,
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
            // Step 5: Controls row (Play/Pause buttons and Slider)
            if (isVideoLoading)
              Positioned(
                top: 50,
                bottom: 50,
                right: 50,
                left: 50,
                child: CustomLoader(),
              ),
            if (!isVideoLoading)
              Positioned(
                left: 12.0,
                bottom: 7,
                right: 12.0,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    videoController.value.isPlaying || !isVideoCompleted
                        // Step 6: Play/Pause button based on the video's current state
                        ? CustomInkWell(
                            onTap: () {
                              videoController.pause();
                              setState(() {});
                            },
                            child: Image.asset(
                              'assets/icons/pause_01.png',
                              width: 30,
                            ),
                          )
                        : CustomInkWell(
                            onTap: () {
                              videoController.play();
                              setState(() {});
                            },
                            child: Image.asset(
                              'assets/icons/play_02.png',
                              width: 30,
                            ),
                          ),
                    const SizedBox(
                      width: 10,
                    ),
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.only(top: 12.0),
                        child: StreamBuilder(
                            stream: _createPositionDataStream(),
                            builder: (context, snapshot) {
                              final positionalData = snapshot.data;
                              return ProgressBar(
                                progress:
                                    positionalData?.progress ?? Duration.zero,
                                buffered:
                                    positionalData?.buffered ?? Duration.zero,
                                total: positionalData?.total ?? Duration.zero,
                                thumbColor: Colors.white,
                                bufferedBarColor: Colors.grey,
                                thumbRadius: 6,
                                onSeek: (position) {
                                  videoController.seekTo(position);
                                },
                                progressBarColor: Colors.white,
                              );
                            }),
                      ),
                    ),
                  ],
                ),
              ),
          ],
        );
      },
    );
  }
}
