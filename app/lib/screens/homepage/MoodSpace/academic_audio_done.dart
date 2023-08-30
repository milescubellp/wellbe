import 'package:audio_video_progress_bar/audio_video_progress_bar.dart';
import 'package:flutter/material.dart';
import 'package:just_audio/just_audio.dart';
import 'package:provider/provider.dart';
import 'package:wellbe/provider/ThoughtProvider/thought_provider.dart';
import 'package:wellbe/provider/mindful_provider.dart';
import 'package:wellbe/screens/homepage/QuickMeditation/video_widget.dart';

import '../../../provider/audio_provider.dart';
import '../../../utilites/colors.dart';
import '../../../utilites/helper.dart';
import '../../../utilites/string_utils.dart';
import '../../../widgets/custom_inkwell_btn.dart';
import '../../../widgets/custom_parent_widget.dart';
import '../../../widgets/custom_text.dart';
import '../Recomendation/recomendation_screen.dart';
import 'academic_info_input.dart';
import 'package:rxdart/rxdart.dart';

class AcademicAudioDoneScreen extends StatefulWidget {
  const AcademicAudioDoneScreen(
      {Key? key,
      required this.fileType,
      required this.url,
      required this.title,
      required this.thoughtId,
      required this.description})
      : super(key: key);
  final String fileType;
  final String url;
  final String title;
  final String description;
  final String thoughtId;

  @override
  State<AcademicAudioDoneScreen> createState() =>
      _AcademicAudioDoneScreenState();
}

class _AcademicAudioDoneScreenState extends State<AcademicAudioDoneScreen> {
  late AudioPlayer audioPlayer = AudioPlayer();

  @override
  void initState() {
    // TODO: implement initState
    if (widget.fileType.contains('Audio')) {
      audioPlayer = AudioPlayer()..setUrl('${widget.url}');
      audioPlayer.positionStream;
      audioPlayer.bufferedPositionStream;
      audioPlayer.durationStream;
      Provider.of<ThoughtProvider>(context, listen: false)
          .addUserThoughts(widget.thoughtId, (status) {}, context);
    }
    // Provider.of<AudioProvider>(context, listen: false).init(isInit: true);
    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    if (widget.fileType.contains('Audio')) audioPlayer.dispose();
    super.dispose();
  }

  Stream<PositionData> get _positionDataStream =>
      Rx.combineLatest3<Duration, Duration, Duration?, PositionData>(
          audioPlayer.positionStream,
          audioPlayer.bufferedPositionStream,
          audioPlayer.durationStream,
          (progress, buffered, total) =>
              PositionData(progress, buffered, total ?? Duration.zero));
  @override
  Widget build(BuildContext context) {
    return CustomParentWidget(
      child: Consumer(builder: (context, audio, child) {
        return Scaffold(
          appBar: AppBar(
            elevation: 0,
            centerTitle: false,
            automaticallyImplyLeading: false,
            backgroundColor: kPrimaryColor,
            title: CustomText(
              title: "${widget.title}",
              fontSize: 17,
              color: blackColor,
              fontWeight: FontWeight.w700,
            ),
          ),
          body: SingleChildScrollView(
            child: Column(children: [
              Container(
                height: widget.fileType.contains('Audio') ? 400 : 315,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                    color: kPrimaryColor,
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(25),
                      bottomRight: Radius.circular(25),
                    )),
                padding:
                    EdgeInsets.only(left: 13, right: 13, top: 10, bottom: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    //IMAGE
                    widget.fileType.contains('Audio')
                        ? Column(
                            children: [
                              Stack(
                                alignment: Alignment.center,
                                children: [
                                  Container(
                                    height: 230,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(20),
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
                                    width: 140,
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
                                      } else if (processingState ==
                                          ProcessingState.completed) {
                                        Future.delayed(Duration.zero, () {
                                          Helper.toScreen(
                                              context, RecommendationScreen());
                                          //your code goes here
                                        });
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
                                    onTap: () {
                                      Helper.toScreen(
                                        context,
                                        RecommendationScreen(
                                          screenName: 'alltab',
                                        ),
                                      );
                                    },
                                    child: Container(
                                      padding: EdgeInsets.symmetric(
                                          vertical: 5, horizontal: 20),
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(10),
                                        border: Border.all(
                                          color: darkBlueColor,
                                          width: 2,
                                        ),
                                        color: Colors
                                            .transparent, // Change the button's background color
                                      ),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.min,
                                        children: [
                                          Icon(
                                            Icons
                                                .skip_next, // You can replace this with your preferred icon
                                            color: darkBlueColor,
                                            size: 18,
                                          ),
                                          SizedBox(width: 8),
                                          CustomText(
                                            title: 'Skip',
                                            fontSize: 11,
                                            color: darkBlueColor,
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          )
                        : VideoWidget(
                            videoUrl: widget.url,
                            isNavigate: true,
                            thoughtId: widget.thoughtId),
                    if (!widget.fileType.contains('Audio'))
                      const SizedBox(
                        height: 15,
                      ),
                    if (!widget.fileType.contains('Audio'))
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          CustomInkWell(
                            onTap: () {
                              Helper.toScreen(
                                context,
                                RecommendationScreen(
                                  screenName: 'alltab',
                                ),
                              );
                            },
                            child: Container(
                              padding: EdgeInsets.symmetric(
                                  vertical: 5, horizontal: 20),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                border: Border.all(
                                  color: darkBlueColor,
                                  width: 2,
                                ),
                                color: Colors
                                    .transparent, // Change the button's background color
                              ),
                              child: Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Icon(
                                    Icons
                                        .skip_next, // You can replace this with your preferred icon
                                    color: darkBlueColor,
                                    size: 18,
                                  ),
                                  SizedBox(width: 8),
                                  CustomText(
                                    title: 'Skip',
                                    fontSize: 11,
                                    color: darkBlueColor,
                                  ),
                                ],
                              ),
                            ),
                          ),
                          const SizedBox(
                            width: 20,
                          ),
                        ],
                      ),
                  ],
                ),
              ),

              //Space

              const SizedBox(
                height: 18,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 18.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            CustomText(
                                title: 'By Benjamin',
                                fontWeight: FontWeight.w600,
                                fontSize: 12.0,
                                color: textGreyColor2),
                            SizedBox(width: 10.0),
                            CustomText(
                                title: '6 min',
                                color: greyColor,
                                fontWeight: FontWeight.w500,
                                fontSize: 12),
                          ],
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    CustomText(
                      title: "${widget.title}",
                      fontSize: 14,
                      color: blackColor,
                      fontWeight: FontWeight.w700,
                    ),
                    const SizedBox(
                      height: 2,
                    ),
                    CustomText(
                      title:
                          "I don't feel as brilliant as the others\nkids in my class",
                      fontSize: 14,
                      color: blackColor,
                      fontWeight: FontWeight.w700,
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: CustomText(
                            title:
                                removeHtmlTags(widget.description.toString()),
                            fontSize: 12,
                            color: textGreyColor2,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    const SizedBox(
                      height: 50,
                    ),
                  ],
                ),
              )
            ]),
          ),
        );
      }),
    );
  }
}

class PositionData {
  const PositionData(this.progress, this.buffered, this.total);
  final Duration progress;
  final Duration buffered;
  final Duration total;
}
