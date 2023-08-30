import 'package:audio_video_progress_bar/audio_video_progress_bar.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:just_audio/just_audio.dart';
import 'package:provider/provider.dart';
import 'package:wellbe/provider/MoodProvider/mood_provider.dart';
import 'package:wellbe/provider/meditation_provider.dart';
import 'package:wellbe/provider/mindful_provider.dart';

import '../../../models/CustomModels/custom_model.dart';
import '../../../provider/PodcastsProvider/podcasts_provider.dart';
import '../../../provider/audio_provider.dart';
import '../../../utilites/colors.dart';
import '../../../utilites/helper.dart';
import '../../../widgets/custom_cached_network_image.dart';
import '../../../widgets/custom_inkwell_btn.dart';
import '../../../widgets/custom_loader.dart';
import '../../../widgets/custom_parent_widget.dart';
import '../../../widgets/custom_text.dart';
import '../../../widgets/error_text_widget.dart';
import 'academic_info_input.dart';
import 'package:rxdart/rxdart.dart';

class AcademicAudioScreen extends StatefulWidget {
  String? screenName;
  AcademicAudioScreen({Key? key, this.screenName}) : super(key: key);

  @override
  State<AcademicAudioScreen> createState() => _AcademicAudioScreenState();
}

class _AcademicAudioScreenState extends State<AcademicAudioScreen> {
  @override
  void initState() {
    // TODO: implement initState

    // Provider.of<MoodProvider>(context, listen: false)
    //     .getVideoMoodBased(2, (isVerified) {}, context);

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return CustomParentWidget(
      child: Consumer2<MeditationProvider, MoodProvider>(
          builder: (context, meditationProvider, moodProvider, child) {
        return WillPopScope(
          onWillPop: () async {
            if (Provider.of<MoodSpaceProvider>(context, listen: false)
                .isThoughtPage) {
              Provider.of<MoodSpaceProvider>(context, listen: false)
                  .onSelectedIndexChange(1);
              Navigator.pop(context);
            } else if (widget.screenName == 'recommendationScreen') {
              Navigator.pop(context);
            } else {
              Navigator.pop(context);
              Navigator.pop(context);
            }
            return true;
          },
          child: Scaffold(
            appBar: AppBar(
              elevation: 0,
              centerTitle: false,
              automaticallyImplyLeading: false,
              backgroundColor: kPrimaryColor,
              title: CustomText(
                title: "Academic 01",
                fontSize: 17,
                color: blackColor,
                fontWeight: FontWeight.w700,
              ),
              actions: [
                CustomInkWell(
                  onTap: () {
                    if (Provider.of<MoodSpaceProvider>(context, listen: false)
                        .isThoughtPage) {
                      Provider.of<MoodSpaceProvider>(context, listen: false)
                          .onSelectedIndexChange(1);
                      Navigator.pop(context);
                    } else if (widget.screenName == 'recommendationScreen') {
                      Navigator.pop(context);
                    } else {
                      Navigator.pop(context);
                      Navigator.pop(context);
                    }
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
            body: moodProvider.getVideoMoodBasedModels.length == 0 &&
                    !moodProvider.isApiErrorOccured
                ? Center(child: CustomLoader())
                : moodProvider.isApiErrorOccured
                    ? Center(child: ErrorTextWidget())
                    : SingleChildScrollView(
                        child: Column(children: [
                          Container(
                            height: 400,
                            width: MediaQuery.of(context).size.width,
                            alignment: Alignment.centerLeft,
                            child: CarouselSlider(
                              options: CarouselOptions(
                                height: double.infinity,
                                //viewportFraction: 0.99,
                                viewportFraction: 1,
                                // autoPlay: true,
                                //   enableInfiniteScroll: false,
                                //  scrollPhysics: NeverScrollableScrollPhysics(),
                                onPageChanged: (int index, val) {
                                  meditationProvider.changeCurrentPage(index);
                                },
                              ),
                              carouselController:
                                  meditationProvider.buttonCarouselController,
                              items: moodProvider
                                  .getVideoMoodBasedModels[0].audios!
                                  .asMap()
                                  .map((index, i) {
                                    return MapEntry(
                                      index,
                                      Builder(
                                        builder: (BuildContext context) {
                                          final key = Key('$index + 1}');
                                          return Container(
                                              width: MediaQuery.of(context)
                                                  .size
                                                  .width,
                                              child: Stack(
                                                children: [
                                                  // moodProvider.isCompleted
                                                  AudioWidget(
                                                      assetPath:
                                                          i.filePath != null
                                                              ? '${i.filePath}'
                                                              : '${i.link}'
                                                      //     null
                                                      // ? moodProvider
                                                      //     .getAudio[
                                                      //         index]
                                                      //     .filePath
                                                      //     .toString()
                                                      // : moodProvider
                                                      //     .getAudio[
                                                      //         index]
                                                      //     .link
                                                      //     .toString(),
                                                      )

                                                  // Positioned.directional(
                                                  //     textDirection:
                                                  //         Directionality.of(context),
                                                  //     bottom: 15,
                                                  //     start: 15,
                                                  //     child: meditationProvider
                                                  //                 .currentPage ==
                                                  //             0
                                                  //         ? Image.asset(
                                                  //             "assets/icons/video_player_01.png")
                                                  //         : SizedBox()),
                                                  // Positioned.directional(
                                                  //     textDirection:
                                                  //         Directionality.of(context),
                                                  //     bottom: 0,
                                                  //     top: 0,
                                                  //     start: 0,
                                                  //     end: 0,
                                                  //     child: meditationProvider
                                                  //                 .currentPage ==
                                                  //             1
                                                  //         ? Image.asset(
                                                  //             "assets/icons/audio_player_02.png")
                                                  //         : SizedBox())
                                                ],
                                              ));
                                        },
                                      ),
                                    );
                                  })
                                  .values
                                  .toList(),
                            ),
                          ),

                          //Space

                          const SizedBox(
                            height: 18,
                          ),
                          Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 18.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    // Row(
                                    //   children: [
                                    //     CustomText(
                                    //         title: 'By Benjamin',
                                    //         fontWeight: FontWeight.w600,
                                    //         fontSize: 12.0,
                                    //         color: textGreyColor2),
                                    //     SizedBox(width: 10.0),
                                    //     CustomText(
                                    //         title: '6 min',
                                    //         color: greyColor,
                                    //         fontWeight: FontWeight.w500,
                                    //         fontSize: 12),
                                    //   ],
                                    // ),
                                    const SizedBox(),
                                    RichText(
                                      text: TextSpan(
                                        style: TextStyle(color: blackColor),
                                        children: <TextSpan>[
                                          TextSpan(
                                            text:
                                                '0${meditationProvider.currentPage + 1}',
                                            style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontSize: 18.0,
                                            ),
                                          ),
                                          TextSpan(
                                              text:
                                                  '/0${moodProvider.getVideoMoodBasedModels[0].audios!.length}'),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                                const SizedBox(
                                  height: 10,
                                ),

                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    const SizedBox(),
                                    // CustomText(
                                    //   title:
                                    //       "${moodProvider.getVideoMoodBasedModels[0].description}",
                                    //   fontSize: 12,
                                    //   color: blackColor,
                                    //   fontWeight: FontWeight.w500,
                                    // ),
                                    Row(
                                      children: [
                                        CustomInkWell(
                                          onTap: () {
                                            if (meditationProvider
                                                    .currentPage !=
                                                0) {
                                              meditationProvider
                                                  .changeSliderBack(context);
                                            }
                                          },
                                          child: Container(
                                              padding: EdgeInsets.all(1),
                                              decoration: BoxDecoration(
                                                  shape: BoxShape.circle,
                                                  border: Border.all(
                                                      width: 1.5,
                                                      color: meditationProvider
                                                                  .currentPage ==
                                                              0
                                                          ? greyColor
                                                          : blackColor)),
                                              child: Icon(
                                                  Icons
                                                      .keyboard_arrow_left_sharp,
                                                  color: meditationProvider
                                                              .currentPage ==
                                                          0
                                                      ? greyColor
                                                      : blackColor)),
                                        ),
                                        //Space
                                        SizedBox(
                                          width: 10,
                                        ),
                                        CustomInkWell(
                                          onTap: () {
                                            if (meditationProvider.currentPage <
                                                meditationViewList.length - 1) {
                                              meditationProvider
                                                  .changeSliderForward(context);
                                            }
                                          },
                                          child: Container(
                                              padding: EdgeInsets.all(1),
                                              decoration: BoxDecoration(
                                                  shape: BoxShape.circle,
                                                  border: Border.all(
                                                      width: 1.5,
                                                      color: meditationProvider
                                                                  .currentPage ==
                                                              meditationViewList
                                                                      .length -
                                                                  1
                                                          ? greyColor
                                                          : blackColor)),
                                              child: Icon(
                                                  Icons
                                                      .keyboard_arrow_right_sharp,
                                                  color: meditationProvider
                                                              .currentPage ==
                                                          meditationViewList
                                                                  .length -
                                                              1
                                                      ? greyColor
                                                      : blackColor)),
                                        ),
                                      ],
                                    )
                                  ],
                                ),
                                // const SizedBox(
                                //   height: 2,
                                // ),
                                // CustomText(
                                //   title:
                                //       "I don't feel as brilliant as the others\nkids in my class",
                                //   fontSize: 14,
                                //   color: blackColor,
                                //   fontWeight: FontWeight.w700,
                                // ),
                                // const SizedBox(
                                //   height: 10,
                                // ),
                                Row(
                                  children: [
                                    Expanded(
                                      child: CustomText(
                                        title:
                                            "${moodProvider.getVideoMoodBasedModels[0].description}",
                                        fontSize: 12,
                                        color: blackColor,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                  ],
                                ),
                                const SizedBox(
                                  height: 30,
                                ),

                                //BUTTON
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    GestureDetector(
                                        onTap: () {
                                          if (Provider.of<MoodSpaceProvider>(
                                                  context,
                                                  listen: false)
                                              .isThoughtPage) {
                                            Provider.of<MoodSpaceProvider>(
                                                    context,
                                                    listen: false)
                                                .onSelectedIndexChange(1);
                                            Navigator.pop(context);
                                          } else {
                                            Helper.toScreen(
                                                context, AcademicInfoInput());
                                          }
                                        },
                                        child: Container(
                                          padding: EdgeInsets.symmetric(
                                              horizontal: 37, vertical: 12),
                                          child: Text(
                                            Provider.of<MoodSpaceProvider>(
                                                        context)
                                                    .isThoughtPage
                                                ? 'Done'
                                                : 'Next',
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontWeight: FontWeight.w500,
                                                fontSize: 14),
                                          ),
                                          decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(30),
                                              color: darkBlueColor),
                                        )),
                                  ],
                                ),
                                const SizedBox(
                                  height: 50,
                                ),
                              ],
                            ),
                          )
                        ]),
                      ),
          ),
        );
      }),
    );
  }
}

class AudioWidget extends StatefulWidget {
  AudioWidget({
    super.key,
    this.assetPath,
    this.image,
  });

  String? assetPath;
  String? image;

  @override
  State<AudioWidget> createState() => _AudioWidgetState();
}

class _AudioWidgetState extends State<AudioWidget> {
  late AudioPlayer audioPlayer = AudioPlayer();
  bool loopModeEnabled = false;
  bool isAudioLoaded = false;
  Future<void> _loadAudio() async {
    if (widget.assetPath!.startsWith('https:'))
      audioPlayer = await AudioPlayer()
        ..setUrl(widget.assetPath!);
    else {
      audioPlayer = await AudioPlayer()
        ..setFilePath(widget.assetPath!);
    }
    setState(() {
      isAudioLoaded = true;
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    _loadAudio();
    audioPlayer.positionStream;
    audioPlayer.bufferedPositionStream;
    audioPlayer.durationStream;

    // Provider.of<AudioProvider>(context, listen: false).init(isInit: true);
    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    audioPlayer.dispose();
    super.dispose();
  }

  Stream<PositionData> get _positionDataStream =>
      Rx.combineLatest3<Duration, Duration, Duration?, PositionData>(
          audioPlayer.positionStream,
          audioPlayer.bufferedPositionStream,
          audioPlayer.durationStream,
          (progress, buffered, total) =>
              PositionData(progress, buffered, total ?? Duration.zero));

  void onShufflePressed() {
    audioPlayer.setShuffleModeEnabled(!audioPlayer.shuffleModeEnabled);
    setState(() {});
  }

  void onFastForwardPressed() {
    audioPlayer.seek(audioPlayer.position + Duration(seconds: 10));
  }

  void onFastBackwardPressed() {
    audioPlayer.seek(audioPlayer.position - Duration(seconds: 10));
  }

  void onLoopPressed() {
    if (audioPlayer.loopMode == LoopMode.off) {
      audioPlayer.setLoopMode(LoopMode.one);
    } else {
      audioPlayer.setLoopMode(LoopMode.off);
    }
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Consumer2<MoodProvider, PodcastsProvider>(
        builder: (context, moodProvider, podcastsProvider, child) {
      return Container(
        height: 400,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
            color: kPrimaryColor,
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(25),
              bottomRight: Radius.circular(25),
            )),
        padding: EdgeInsets.only(left: 13, right: 13, top: 10, bottom: 25),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            //IMAGE
            widget.image != null
                ? Container(
                    height: 230,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    clipBehavior: Clip.hardEdge,
                    child: CustomCachedNetworkImage(url: '${widget.image}'),
                  )
                : Column(
                    children: [
                      const SizedBox(
                        height: 20,
                      ),
                      Container(
                        padding: EdgeInsets.all(10),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            border: Border.all(color: Colors.black, width: 2)),
                        child: Icon(
                          Icons.mic_outlined,
                          size: 60,
                        ),
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      Image.asset(
                        'assets/images/soundwave2.png',
                        scale: 1.1,
                      ),
                    ],
                  ),
            const SizedBox(height: 15),

            StreamBuilder(
                stream: _positionDataStream,
                builder: (context, snapshot) {
                  final positionalData = snapshot.data;
                  return ProgressBar(
                    progress: positionalData?.progress ?? Duration.zero,
                    buffered: positionalData?.buffered ?? Duration.zero,
                    total: positionalData?.total ?? Duration.zero,
                    thumbColor: Colors.black,
                    baseBarColor: Colors.grey.withOpacity(0.3),
                    bufferedBarColor: Colors.grey,
                    thumbRadius: 6,
                    onSeek: audioPlayer.seek,
                    progressBarColor: Colors.black,
                  );
                }),
            const SizedBox(
              height: 35,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                GestureDetector(
                  onTap: () {
                    onShufflePressed();
                  },
                  child: Icon(
                    audioPlayer.shuffleModeEnabled
                        ? Icons.shuffle_on_sharp
                        : Icons.shuffle,
                    color: blackColor,
                    size: 19,
                  ),
                ),
                const SizedBox(
                  width: 20,
                ),
                GestureDetector(
                  onTap: () async {
                    onFastBackwardPressed();
                    // final player = AudioCache();
                    // player.pla(
                    //   audioPlayer.audioasset as Source,
                    // );
                  },
                  child: Icon(
                    Icons.fast_rewind,
                    color: blackColor,
                  ),
                ),
                const SizedBox(
                  width: 20,
                ),
                StreamBuilder(
                  stream: audioPlayer.playerStateStream,
                  builder: (context, snapshot) {
                    final playerState = snapshot.data;
                    final processingState = playerState?.processingState;
                    final playing = playerState?.playing;
                    if (!(playing ?? false)) {
                      return CustomInkWell(
                        onTap: audioPlayer.play,
                        child: Container(
                          width: 45,
                          height: 45,
                          decoration: BoxDecoration(
                              shape: BoxShape.circle, color: blackColor),
                          child: Icon(
                            Icons.play_arrow_rounded,
                            color: Colors.white,
                            size: 30,
                          ),
                        ),
                      );
                    } else if (processingState != ProcessingState.completed) {
                      return CustomInkWell(
                        onTap: audioPlayer.pause,
                        child: Container(
                          width: 45,
                          height: 45,
                          decoration: BoxDecoration(
                              shape: BoxShape.circle, color: blackColor),
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
                          shape: BoxShape.circle, color: blackColor),
                      child: Icon(
                        Icons.play_arrow_rounded,
                        color: Colors.white,
                        size: 30,
                      ),
                    );
                  },
                ),
                const SizedBox(
                  width: 20,
                ),
                CustomInkWell(
                  onTap: () {
                    onFastForwardPressed();
                  },
                  child: Icon(
                    Icons.fast_forward,
                    color: blackColor,
                  ),
                ),
                const SizedBox(
                  width: 20,
                ),
                CustomInkWell(
                  onTap: () {
                    onLoopPressed();
                  },
                  child: Icon(
                    audioPlayer.loopMode == LoopMode.off
                        ? Icons.loop
                        : Icons.handyman_sharp,
                    color: blackColor,
                    size: 19,
                  ),
                ),
              ],
            ),
          ],
        ),
      );
    });
  }
}

class PositionData {
  const PositionData(this.progress, this.buffered, this.total);
  final Duration progress;
  final Duration buffered;
  final Duration total;
}
