import 'package:audio_video_progress_bar/audio_video_progress_bar.dart';
import 'package:flutter/material.dart';
import 'package:just_audio/just_audio.dart';
import 'package:provider/provider.dart';
import 'package:rxdart/rxdart.dart';
import 'package:video_player/video_player.dart';
import 'package:wellbe/provider/meditation_provider.dart';
import 'package:wellbe/provider/video_player_provider.dart';
import 'package:wellbe/screens/homepage/HomeScreens/homepage_screen.dart';
import 'package:wellbe/screens/homepage/MIndFul/mindful_screen.dart';

import 'package:wellbe/widgets/custom_parent_widget.dart';

import '../../../models/CustomModels/custom_model.dart';
import '../../../provider/ThoughtProvider/thought_provider.dart';
import '../../../utilites/colors.dart';
import '../../../utilites/helper.dart';
import '../../../widgets/custom_inkwell_btn.dart';
import '../../../widgets/custom_text.dart';
import '../MoodSpace/academic_audio.dart';
import '../QuickMeditation/quick_meditation_screen.dart';
import '../QuickMeditation/video_widget.dart';

class ActivityDetails extends StatefulWidget {
  @override
  State<ActivityDetails> createState() => _ActivityDetailsState();

  const ActivityDetails(
      {Key? key,
      required this.fileType,
      required this.url,
      required this.title,
      required this.description})
      : super(key: key);
  final String fileType;
  final String url;
  final String title;
  final String description;
}

class _ActivityDetailsState extends State<ActivityDetails> {
  final videoUrl =
      'https://flutter.github.io/assets-for-api-docs/assets/videos/bee.mp4';
  double _sliderValue = 0.0;
  late AudioPlayer audioPlayer = AudioPlayer();
  @override
  void initState() {
    // TODO: implement initState

    if (widget.fileType.contains('Audio')) {
      audioPlayer = AudioPlayer()..setUrl('${widget.url}');
      audioPlayer.positionStream;
      audioPlayer.bufferedPositionStream;
      audioPlayer.durationStream;
    } else {
      // final videoPlayerProvider =
      //     Provider.of<VideoPlayerProvider>(context, listen: false);
      // videoPlayerProvider.initializeController(widget.url);
      // videoPlayerProvider.playVideo();
      // videoPlayerProvider.controller.addListener(() {
      //   setState(() {
      //     _sliderValue = videoPlayerProvider.controller.value.position.inSeconds
      //         .toDouble();
      //   });
      // });
    }
  }

  Stream<PositionData> get _positionDataStream =>
      Rx.combineLatest3<Duration, Duration, Duration?, PositionData>(
          audioPlayer.positionStream,
          audioPlayer.bufferedPositionStream,
          audioPlayer.durationStream,
          (progress, buffered, total) =>
              PositionData(progress, buffered, total ?? Duration.zero));
  // void removeController(BuildContext context) {
  //   final _controller =
  //       Provider.of<VideoPlayerProvider>(context, listen: false);
  //
  //   _controller.controller.pause();
  //   _controller.controller.dispose();
  //   debugPrint('Dispose was called');
  // }

  void _openDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return Dialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          child: Container(
            padding: EdgeInsets.all(20),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Image.asset(
                  'assets/icons/successful_popup.png',
                  width: 70, // Replace with your image asset path
                  height: 70,
                ),
                SizedBox(height: 16),
                CustomText(
                  title: 'Wait Up!',
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                  color: blackColor,
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 12),
                Text(
                  'Do you want to go back?',
                  style: TextStyle(
                      fontSize: 12,
                      color: textGreyColor2,
                      fontWeight: FontWeight.w700),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 16),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Expanded(
                      child: ElevatedButton(
                        onPressed: () {
                          // Perform action for the first button
                          Navigator.pop(context);

                          // Helper.toScreen(context, DoctorDetails());
                        },
                        child: CustomText(
                            title: 'No',
                            color: blueColor,
                            fontWeight: FontWeight.bold,
                            fontSize: 12),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.transparent,
                          foregroundColor: Colors.white,
                          elevation: 0,
                          padding:
                              EdgeInsets.symmetric(vertical: 2, horizontal: 7),
                          shape: RoundedRectangleBorder(
                            side: BorderSide(width: 2, color: blueColor),
                            borderRadius: BorderRadius.circular(60),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 4,
                    ),
                    Expanded(
                      child: ElevatedButton(
                        onPressed: () {
                          // Perform action for the second button
                          // Helper.toReplacementScreenSlideLeftToRight(
                          //     context, MoodSpace());
                          Navigator.pop(context);

                          Helper.toScreen(
                              context,
                              HomePageScreen(
                                index: 2,
                              ));
                          // removeController(context);
                        },
                        child: CustomText(
                          title: 'Yes',
                          fontSize: 12,
                          color: Colors.white,
                        ),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: darkBlueColor,
                          foregroundColor: Colors.white,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(60),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  @override
  void dispose() {
    // TODO: implement dispose
    // removeController(context);
    if (widget.fileType.contains('Audio')) audioPlayer.dispose();
    super.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return CustomParentWidget(
      child: Consumer2<MeditationProvider, VideoPlayerProvider>(
          builder: (context, mediationProvider, videoPlayerProvider, child) {
        // final currentPosition = videoPlayerProvider.controller != null
        //     ? videoPlayerProvider.controller.value.position
        //     : Duration.zero;
        // final videoDuration = videoPlayerProvider.controller != null
        //     ? videoPlayerProvider.controller.value.duration
        //     : Duration.zero;

        return WillPopScope(
          onWillPop: () async {
            _openDialog(context);
            return true;
          },
          child: Scaffold(
            appBar: AppBar(
              elevation: 0,
              centerTitle: false,
              automaticallyImplyLeading: false,
              backgroundColor: kPrimaryColor,
              title: CustomText(
                title: "Activity Details",
                fontSize: 17,
                color: blackColor,
                fontWeight: FontWeight.w700,
              ),
              actions: [
                CustomInkWell(
                  onTap: () {
                    _openDialog(context);
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Image.asset(
                      "assets/icons/close.png",
                      scale: 1.1,
                    ),
                  ),
                ),
                //Space
                SizedBox(
                  width: 10,
                )
              ],
            ),
            body: SingleChildScrollView(
                child: Column(
              children: [
                !widget.fileType.contains('Audio')
                    ? Padding(
                        padding: EdgeInsets.only(
                            left: 13, right: 13, top: 10, bottom: 25),
                        child: VideoWidget(
                          videoUrl: widget.url,
                        ),
                      )

                    // Container(
                    //         height: 360,
                    //         width: MediaQuery.of(context).size.width,
                    //         decoration: BoxDecoration(
                    //             color: kPrimaryColor,
                    //             borderRadius: BorderRadius.only(
                    //               bottomLeft: Radius.circular(25),
                    //               bottomRight: Radius.circular(25),
                    //             )),
                    //         padding: EdgeInsets.only(
                    //             left: 13, right: 13, top: 10, bottom: 25),
                    //         child: Column(
                    //           crossAxisAlignment: CrossAxisAlignment.start,
                    //           children: [
                    //             //IMAGE
                    //             videoPlayerProvider.controller != null
                    //                 ? Stack(
                    //                     alignment: Alignment.bottomCenter,
                    //                     children: [
                    //                       Container(
                    //                           height: 230,
                    //                           decoration: BoxDecoration(
                    //                               // borderRadius: BorderRadius.circular(20),
                    //
                    //                               ),
                    //                           child: ClipRRect(
                    //                             borderRadius:
                    //                                 BorderRadius.circular(20),
                    //                             child: VideoPlayer(
                    //                               videoPlayerProvider.controller,
                    //                             ),
                    //                           )),
                    //                       if (!videoPlayerProvider
                    //                           .controller.value.isPlaying)
                    //                         Container(
                    //                           height: 230,
                    //                           decoration: BoxDecoration(
                    //                             color: Colors.black45,
                    //                             borderRadius:
                    //                                 BorderRadius.circular(20),
                    //                           ),
                    //                         ),
                    //                       Padding(
                    //                         padding:
                    //                             const EdgeInsets.only(left: 12.0),
                    //                         child: Row(
                    //                           children: [
                    //                             videoPlayerProvider
                    //                                     .controller.value.isPlaying
                    //                                 ? CustomInkWell(
                    //                                     onTap: () {
                    //                                       videoPlayerProvider
                    //                                           .pauseVideo();
                    //                                     },
                    //                                     child: Image.asset(
                    //                                       'assets/icons/pause_01.png',
                    //                                       width: 30,
                    //                                     ))
                    //                                 : CustomInkWell(
                    //                                     onTap: () {
                    //                                       videoPlayerProvider
                    //                                           .playVideo();
                    //                                     },
                    //                                     child: Image.asset(
                    //                                       'assets/icons/play_02.png',
                    //                                       width: 30,
                    //                                     )),
                    //                             Expanded(
                    //                               child: Slider(
                    //                                 activeColor: Colors.white,
                    //                                 inactiveColor: Colors.white60,
                    //                                 value: _sliderValue,
                    //                                 min: 0,
                    //                                 max: videoDuration.inSeconds
                    //                                     .toDouble(),
                    //                                 onChanged: (value) {
                    //                                   final position = Duration(
                    //                                       seconds: value.toInt());
                    //                                   videoPlayerProvider.controller
                    //                                       .seekTo(position);
                    //                                 },
                    //                               ),
                    //                             ),
                    //                           ],
                    //                         ),
                    //                       ),
                    //                     ],
                    //                   )
                    //                 : Container(
                    //                     //  width: double.infinity,
                    //                     height: 230,
                    //                     decoration: BoxDecoration(
                    //                         borderRadius: BorderRadius.circular(20),
                    //                         image: DecorationImage(
                    //                             fit: BoxFit.cover,
                    //                             image: AssetImage(
                    //                                 "assets/icons/image_01.png"))),
                    //                     alignment: Alignment.center,
                    //                     child: Column(
                    //                         mainAxisAlignment:
                    //                             MainAxisAlignment.center,
                    //                         children: [
                    //                           const SizedBox(
                    //                             height: 40,
                    //                           ),
                    //                           Image.asset(
                    //                             'assets/icons/video.png',
                    //                             width: 70,
                    //                             fit: BoxFit.cover,
                    //                           ),
                    //                           const SizedBox(
                    //                             height: 40,
                    //                           ),
                    //                           Image.asset(
                    //                               'assets/icons/video_player_01.png'),
                    //                         ]),
                    //                   ),
                    //             const SizedBox(
                    //               height: 15,
                    //             ),
                    //             Row(
                    //               mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    //               children: [
                    //                 Column(
                    //                   crossAxisAlignment: CrossAxisAlignment.start,
                    //                   children: [
                    //                     CustomText(
                    //                       title: "Work Out 01",
                    //                       fontSize: 15.5,
                    //                       color: blackColor,
                    //                       fontWeight: FontWeight.w700,
                    //                     ),
                    //                     const SizedBox(
                    //                       height: 2,
                    //                     ),
                    //                     CustomText(
                    //                       title: "DAY 01 | Session 01",
                    //                       fontSize: 12,
                    //                       color: greyColor,
                    //                       fontWeight: FontWeight.w700,
                    //                     ),
                    //                   ],
                    //                 ),
                    //                 RichText(
                    //                   text: TextSpan(
                    //                     style: TextStyle(color: blackColor),
                    //                     children: <TextSpan>[
                    //                       TextSpan(
                    //                         text: '01',
                    //                         style: TextStyle(
                    //                           fontWeight: FontWeight.bold,
                    //                           fontSize: 18.0,
                    //                         ),
                    //                       ),
                    //                       TextSpan(text: '/06'),
                    //                     ],
                    //                   ),
                    //                 ),
                    //               ],
                    //             ),
                    //             const SizedBox(
                    //               height: 8,
                    //             ),
                    //
                    //             Row(
                    //               children: [
                    //                 Expanded(
                    //                   child: CustomText(
                    //                     title:
                    //                         "Various version has evolved over the years,sometimes humour and using content like",
                    //                     fontSize: 12,
                    //                     color: textGreyColor2,
                    //                     fontWeight: FontWeight.w500,
                    //                   ),
                    //                 ),
                    //               ],
                    //             ),
                    //           ],
                    //         ),
                    //       )
                    : Container(
                        height: 400,
                        width: MediaQuery.of(context).size.width,
                        decoration: BoxDecoration(
                            color: kPrimaryColor,
                            borderRadius: BorderRadius.only(
                              bottomLeft: Radius.circular(25),
                              bottomRight: Radius.circular(25),
                            )),
                        padding: EdgeInsets.only(
                            left: 13, right: 13, top: 10, bottom: 20),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            //IMAGE
                            Column(
                              children: [
                                Stack(
                                  alignment: Alignment.center,
                                  children: [
                                    Container(
                                      height: 230,
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(20),
                                          image: DecorationImage(
                                              fit: BoxFit.cover,
                                              image: AssetImage(
                                                  "assets/icons/image_01.png"))),
                                      clipBehavior: Clip.hardEdge,
                                    ),

                                    const SizedBox(
                                      height: 15,
                                    ),

                                    //DESCRIPTION
                                    // Container(
                                    //     child: Slider(
                                    //   value: double.parse(audioPlayer.currentpos.toString()),
                                    //   min: 0,
                                    //   max: double.parse(audioPlayer.maxduration.toString()),
                                    //   divisions: audioPlayer.maxduration,
                                    //   label: audioPlayer.currentpostlabel,
                                    //   onChanged: (double value) async {
                                    //     int seekval = value.round();
                                    //     await audioPlayer.player
                                    //         .seek(Duration(milliseconds: seekval));
                                    //     int result = 1;
                                    //     if (result == 1) {
                                    //       //seek successful
                                    //       audioPlayer.currentpos = seekval;
                                    //     } else {
                                    //       print("Seek unsuccessful.");
                                    //     }
                                    //   },
                                    // )),
                                  ],
                                ),
                                const SizedBox(
                                  height: 30,
                                ),
                                StreamBuilder(
                                    stream: _positionDataStream,
                                    builder: (context, snapshot) {
                                      final positionalData = snapshot.data;
                                      return ProgressBar(
                                        progress: positionalData?.progress ??
                                            Duration.zero,
                                        buffered: positionalData?.buffered ??
                                            Duration.zero,
                                        total: positionalData?.total ??
                                            Duration.zero,
                                        thumbColor: Colors.black,
                                        bufferedBarColor: Colors.grey,
                                        thumbRadius: 6,
                                        baseBarColor:
                                            Colors.grey.withOpacity(0.3),
                                        onSeek: (dur) {},
                                        progressBarColor: Colors.black,
                                      );
                                    }),
                                const SizedBox(
                                  height: 25,
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    const SizedBox(
                                      width: 90,
                                    ),
                                    StreamBuilder(
                                      stream: audioPlayer.playerStateStream,
                                      builder: (context, snapshot) {
                                        final playerState = snapshot.data;
                                        final processingState =
                                            playerState?.processingState;

                                        final playing = playerState?.playing;
                                        if (!(playing ?? false)) {
                                          return CustomInkWell(
                                            onTap: audioPlayer.play,
                                            child: Container(
                                              width: 45,
                                              height: 45,
                                              decoration: BoxDecoration(
                                                  shape: BoxShape.circle,
                                                  color: blackColor),
                                              child: Icon(
                                                Icons.play_arrow_rounded,
                                                color: Colors.white,
                                                size: 30,
                                              ),
                                            ),
                                          );
                                        } else if (processingState !=
                                            ProcessingState.completed) {
                                          return CustomInkWell(
                                            onTap: audioPlayer.pause,
                                            child: Container(
                                              width: 45,
                                              height: 45,
                                              decoration: BoxDecoration(
                                                  shape: BoxShape.circle,
                                                  color: blackColor),
                                              child: Icon(
                                                Icons.pause_rounded,
                                                color: Colors.white,
                                                size: 30,
                                              ),
                                            ),
                                          );
                                        }
                                        return Container(
                                          width: 45,
                                          height: 45,
                                          decoration: BoxDecoration(
                                              shape: BoxShape.circle,
                                              color: blackColor),
                                          child: Icon(
                                            Icons.play_arrow_rounded,
                                            color: Colors.white,
                                            size: 30,
                                          ),
                                        );
                                      },
                                    ),
                                    const SizedBox(
                                      width: 40,
                                    ),
                                    CustomInkWell(
                                      onTap: () {},
                                      child: Container(
                                        padding: EdgeInsets.symmetric(
                                            vertical: 5, horizontal: 20),

                                        color: Colors
                                            .transparent, // Change the button's background color
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            )
                          ],
                        ),
                      ),
                //Space

                const SizedBox(
                  height: 25,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 18.0),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          //TITLE
                          Row(
                            children: [
                              CustomText(
                                title: "Workout Heading",
                                fontSize: 16,
                                color: blackColor,
                                fontWeight: FontWeight.w600,
                              ),
                              const SizedBox(
                                width: 2,
                              ),
                              Container(
                                width: 30,
                                height: 20,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(50),
                                  color: blueColor,
                                ),
                                child: Center(
                                  child: Text(
                                    '02',
                                    style: TextStyle(
                                        fontSize: 14,
                                        color: Colors.white,
                                        fontWeight: FontWeight.w600),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 10,
                      ),

                      //CARD
                      ListView.builder(
                          itemCount: 2,
                          shrinkWrap: true,
                          padding: EdgeInsets.only(bottom: 1),
                          physics: ClampingScrollPhysics(),
                          itemBuilder: (context, index) {
                            return Container(
                              padding: EdgeInsets.only(bottom: 10),
                              child: CustomInkWell(
                                onTap: () {},
                                child: Container(
                                  padding: EdgeInsets.symmetric(
                                      horizontal: 10, vertical: 10),
                                  decoration: BoxDecoration(
                                      color: Color(0xFFe2f2ff),
                                      borderRadius: BorderRadius.circular(8)),
                                  child: Row(
                                    children: [
                                      Container(
                                          width: 80,
                                          height: 80,
                                          decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(8),
                                              image: DecorationImage(
                                                  fit: BoxFit.cover,
                                                  image: AssetImage(
                                                      "${meditationList[index].img}"))),
                                          clipBehavior: Clip.hardEdge,
                                          child: Center(
                                            child: Image.asset(
                                              "${meditationList[index].icon}",
                                              scale: 1.2,
                                            ),
                                          )),
                                      //Space
                                      SizedBox(
                                        width: 12,
                                      ),
                                      //
                                      Expanded(
                                          child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              CustomText(
                                                title: "Academic 01",
                                                fontSize: 12.5,
                                                color: blackColor,
                                                fontWeight: FontWeight.w700,
                                              ),
                                              CustomText(
                                                title: "6 min",
                                                fontSize: 12.5,
                                                color: greyColor,
                                                fontWeight: FontWeight.w500,
                                              ),
                                            ],
                                          ),
                                          //Space
                                          SizedBox(
                                            height: 6,
                                          ),
                                          Row(
                                            children: [
                                              CustomText(
                                                title: "Session 1",
                                                fontSize: 12,
                                                fontWeight: FontWeight.w500,
                                                color: blackColor,
                                                //fontWeight: FontWeight.w700,
                                              ),
                                              if (index == 0)
                                                Icon(Icons.timer_outlined),
                                              SizedBox(width: 8),
                                              if (index == 0)
                                                CustomText(
                                                  title: "5 min",
                                                  fontSize: 12,
                                                  color: textGreyColor2,
                                                  //fontWeight: FontWeight.w700,
                                                ),
                                            ],
                                          ),

                                          Row(
                                            children: [
                                              Expanded(
                                                child: ClipRRect(
                                                  borderRadius:
                                                      BorderRadius.circular(30),
                                                  child:
                                                      LinearProgressIndicator(
                                                    value: 0.4,
                                                    color: index == 0
                                                        ? kPrimaryColor
                                                        : greyColor,
                                                    minHeight: 5,
                                                    backgroundColor:
                                                        Colors.white,
                                                  ),
                                                ),
                                              ),
                                              SizedBox(width: 30),
                                              index == 0
                                                  ? Icon(Icons.check_circle,
                                                      size: 30,
                                                      color: kPrimaryColor)
                                                  : Icon(Icons.play_circle,
                                                      size: 30,
                                                      color: greyColor),
                                            ],
                                          ),
                                        ],
                                      )),
                                      //Space
                                      SizedBox(
                                        width: 12,
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            );
                          }),

                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          //TITLE
                          Row(
                            children: [
                              CustomText(
                                title: "Workout Heading",
                                fontSize: 16,
                                color: blackColor,
                                fontWeight: FontWeight.w600,
                              ),
                              const SizedBox(
                                width: 2,
                              ),
                              Container(
                                width: 30,
                                height: 20,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(50),
                                  color: blueColor,
                                ),
                                child: Center(
                                  child: Text(
                                    '02',
                                    style: TextStyle(
                                        fontSize: 14,
                                        color: Colors.white,
                                        fontWeight: FontWeight.w600),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 10,
                      ),

                      //CARD
                      ListView.builder(
                          itemCount: 2,
                          shrinkWrap: true,
                          padding: EdgeInsets.only(bottom: 1),
                          physics: ClampingScrollPhysics(),
                          itemBuilder: (context, index) {
                            return Container(
                              padding: EdgeInsets.only(bottom: 10),
                              child: CustomInkWell(
                                onTap: () {},
                                child: Container(
                                  padding: EdgeInsets.symmetric(
                                      horizontal: 10, vertical: 10),
                                  decoration: BoxDecoration(
                                      color: Color(0xFFe2f2ff),
                                      borderRadius: BorderRadius.circular(8)),
                                  child: Row(
                                    children: [
                                      Container(
                                          width: 80,
                                          height: 80,
                                          decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(8),
                                              image: DecorationImage(
                                                  fit: BoxFit.cover,
                                                  image: AssetImage(
                                                      "${meditationList[index].img}"))),
                                          clipBehavior: Clip.hardEdge,
                                          child: Center(
                                            child: Image.asset(
                                              "${meditationList[index].icon}",
                                              scale: 1.2,
                                            ),
                                          )),
                                      //Space
                                      SizedBox(
                                        width: 12,
                                      ),
                                      //
                                      Expanded(
                                          child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              CustomText(
                                                title: "Academic 01",
                                                fontSize: 12.5,
                                                color: blackColor,
                                                fontWeight: FontWeight.w700,
                                              ),
                                              CustomText(
                                                title: "6 min",
                                                fontSize: 12.5,
                                                color: greyColor,
                                                fontWeight: FontWeight.w500,
                                              ),
                                            ],
                                          ),
                                          //Space
                                          SizedBox(
                                            height: 6,
                                          ),
                                          Row(
                                            children: [
                                              CustomText(
                                                title: "Session 1",
                                                fontSize: 12,
                                                fontWeight: FontWeight.w500,
                                                color: blackColor,
                                                //fontWeight: FontWeight.w700,
                                              ),
                                              if (index == 0)
                                                Icon(Icons.timer_outlined),
                                              SizedBox(width: 8),
                                              if (index == 0)
                                                CustomText(
                                                  title: "5 min",
                                                  fontSize: 12,
                                                  color: textGreyColor2,
                                                  //fontWeight: FontWeight.w700,
                                                ),
                                            ],
                                          ),

                                          Row(
                                            children: [
                                              Expanded(
                                                child: ClipRRect(
                                                  borderRadius:
                                                      BorderRadius.circular(30),
                                                  child:
                                                      LinearProgressIndicator(
                                                    value: 0.4,
                                                    color: index == 0
                                                        ? kPrimaryColor
                                                        : greyColor,
                                                    minHeight: 5,
                                                    backgroundColor:
                                                        Colors.white,
                                                  ),
                                                ),
                                              ),
                                              SizedBox(width: 30),
                                              Icon(Icons.play_circle,
                                                  size: 30, color: greyColor),
                                            ],
                                          ),
                                        ],
                                      )),
                                      //Space
                                      SizedBox(
                                        width: 12,
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            );
                          }),

                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          //TITLE
                          Row(
                            children: [
                              CustomText(
                                title: "Workout Heading",
                                fontSize: 16,
                                color: blackColor,
                                fontWeight: FontWeight.w600,
                              ),
                              const SizedBox(
                                width: 2,
                              ),
                              Container(
                                width: 30,
                                height: 20,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(50),
                                  color: blueColor,
                                ),
                                child: Center(
                                  child: Text(
                                    '02',
                                    style: TextStyle(
                                        fontSize: 14,
                                        color: Colors.white,
                                        fontWeight: FontWeight.w600),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 10,
                      ),

                      //CARD
                      ListView.builder(
                          itemCount: 2,
                          shrinkWrap: true,
                          padding: EdgeInsets.only(bottom: 10),
                          physics: ClampingScrollPhysics(),
                          itemBuilder: (context, index) {
                            return Container(
                              padding: EdgeInsets.only(bottom: 10),
                              child: CustomInkWell(
                                onTap: () {},
                                child: Container(
                                  padding: EdgeInsets.symmetric(
                                      horizontal: 10, vertical: 10),
                                  decoration: BoxDecoration(
                                      color: Color(0xFFe2f2ff),
                                      borderRadius: BorderRadius.circular(8)),
                                  child: Row(
                                    children: [
                                      Container(
                                          width: 80,
                                          height: 80,
                                          decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(8),
                                              image: DecorationImage(
                                                  fit: BoxFit.cover,
                                                  image: AssetImage(
                                                      "${meditationList[index].img}"))),
                                          clipBehavior: Clip.hardEdge,
                                          child: Center(
                                            child: Image.asset(
                                              "${meditationList[index].icon}",
                                              scale: 1.2,
                                            ),
                                          )),
                                      //Space
                                      SizedBox(
                                        width: 12,
                                      ),
                                      //
                                      Expanded(
                                          child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              CustomText(
                                                title: "Academic 01",
                                                fontSize: 12.5,
                                                color: blackColor,
                                                fontWeight: FontWeight.w700,
                                              ),
                                              CustomText(
                                                title: "6 min",
                                                fontSize: 12.5,
                                                color: greyColor,
                                                fontWeight: FontWeight.w500,
                                              ),
                                            ],
                                          ),
                                          //Space
                                          SizedBox(
                                            height: 6,
                                          ),
                                          Row(
                                            children: [
                                              CustomText(
                                                title: "Session 1",
                                                fontSize: 12,
                                                fontWeight: FontWeight.w500,
                                                color: blackColor,
                                                //fontWeight: FontWeight.w700,
                                              ),
                                              // if (index == 0)
                                              //   Icon(Icons.timer_outlined),
                                              // SizedBox(width: 8),
                                              // if (index == 0)
                                              //   CustomText(
                                              //     title: "5 min",
                                              //     fontSize: 12,
                                              //     color: textGreyColor2,
                                              //     //fontWeight: FontWeight.w700,
                                              //   ),
                                            ],
                                          ),

                                          Row(
                                            children: [
                                              Expanded(
                                                child: ClipRRect(
                                                  borderRadius:
                                                      BorderRadius.circular(30),
                                                  child:
                                                      LinearProgressIndicator(
                                                    value: 0.4,
                                                    color: index == 0
                                                        ? kPrimaryColor
                                                        : greyColor,
                                                    minHeight: 5,
                                                    backgroundColor:
                                                        Colors.white,
                                                  ),
                                                ),
                                              ),
                                              SizedBox(width: 30),
                                              Icon(Icons.play_circle,
                                                  size: 30, color: greyColor),
                                            ],
                                          ),
                                        ],
                                      )),
                                      //Space
                                      SizedBox(
                                        width: 12,
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            );
                          }),
                      const SizedBox(
                        height: 13,
                      ),
                    ],
                  ),
                ),
              ],
            )),
          ),
        );
      }),
    );
  }
}
