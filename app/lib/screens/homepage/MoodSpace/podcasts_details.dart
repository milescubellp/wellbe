import 'package:flutter/material.dart';
import 'package:just_audio/just_audio.dart';
import 'package:provider/provider.dart';

import 'package:wellbe/screens/homepage/MoodSpace/qm_screen.dart';
import 'package:wellbe/widgets/custom_cached_network_image.dart';

import 'package:wellbe/widgets/custom_parent_widget.dart';

import '../../../models/CustomModels/custom_model.dart';
import '../../../provider/PodcastsProvider/podcasts_provider.dart';
import '../../../utilites/colors.dart';
import '../../../utilites/helper.dart';
import '../../../widgets/custom_inkwell_btn.dart';
import '../../../widgets/custom_loader.dart';
import '../../../widgets/custom_text.dart';
import '../../../widgets/error_text_widget.dart';

class PodcastsDetails extends StatefulWidget {
  PodcastsDetails({Key? key, required this.index}) : super(key: key);
  int index;

  @override
  State<PodcastsDetails> createState() => _PodcastsDetailsState();
}

class _PodcastsDetailsState extends State<PodcastsDetails> {
  void initState() {
    // TODO: implement initState
    Provider.of<PodcastsProvider>(context, listen: false)
        .getPodcastsByMoods(widget.index.toInt(), (status) {}, context);
    super.initState();
  }

  int durationInMinutes = 0;

  fetchDuration(String url) async {
    AudioPlayer audioPlayer = AudioPlayer();
    try {
      Duration? duration = await audioPlayer.setUrl(url);
      debugPrint('duration:${duration!.inMinutes}');
      durationInMinutes = duration.inMinutes;
      debugPrint('duration ${durationInMinutes}');
      audioPlayer.dispose();
    } catch (e) {
      debugPrint('Error loading audio: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return CustomParentWidget(
      child: Consumer<PodcastsProvider>(
          builder: (context, podcastsProvider, child) {
        return Scaffold(
          appBar: AppBar(
            elevation: 0,
            centerTitle: false,
            automaticallyImplyLeading: false,
            backgroundColor: kPrimaryColor,
            title: CustomText(
              title: "Podcasts Details",
              fontSize: 17,
              color: blackColor,
              fontWeight: FontWeight.w700,
            ),
            actions: [
              CustomInkWell(
                onTap: () {
                  Navigator.pop(context);
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
              Container(
                height: 373,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                    color: kPrimaryColor,
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(25),
                      bottomRight: Radius.circular(25),
                    )),
                padding:
                    EdgeInsets.only(left: 13, right: 13, top: 10, bottom: 25),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    //IMAGE
                    Container(
                      //  width: double.infinity,
                      height: 230,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          image: DecorationImage(
                              fit: BoxFit.cover,
                              image: AssetImage("assets/images/slide_"
                                  "img2.png"))),
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    //TITLE
                    CustomText(
                      title: "Quick Meditation 2023 - Meditate with me",
                      fontSize: 14.5,
                      color: blackColor,
                      fontWeight: FontWeight.w700,
                    ),
                    SizedBox(
                      height: 3,
                    ),
                    //SUBTITLE
                    CustomText(
                      title: "By Benjamin",
                      fontSize: 12.5,
                      color: textGreyColor2,
                      fontWeight: FontWeight.w600,
                    ),
                    SizedBox(
                      height: 8,
                    ),
                    //DESCRIPTION
                    Row(
                      children: [
                        Expanded(
                          child: CustomText(
                            title:
                                "Various version has evolved over the years,sometimes majority have suffered alteratio in some form humour and using content like",
                            fontSize: 12.5,
                            color: textGreyColor2,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              //Space

              const SizedBox(
                height: 25,
              ),
              podcastsProvider.isLoading2
                  ? Column(
                      children: [
                        const SizedBox(
                          height: 55,
                        ),
                        Center(
                          child: CustomLoader(),
                        ),
                      ],
                    )
                  : !podcastsProvider.isLoading2 &&
                          podcastsProvider.getPodcastsByMoodsModel.length == 0
                      ? Column(
                          children: [
                            const SizedBox(
                              height: 55,
                            ),
                            Center(
                              child: ErrorTextWidget(),
                            ),
                          ],
                        )
                      : Column(
                          children: [
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 18.0),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  //TITLE
                                  CustomText(
                                    title: "All Episodes",
                                    fontSize: 16,
                                    color: blackColor,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(
                              height: 10,
                            ),

                            //CARD
                            ListView.builder(
                                itemCount: podcastsProvider
                                    .getPodcastsByMoodsModel.length,
                                shrinkWrap: true,
                                padding: EdgeInsetsDirectional.symmetric(
                                    horizontal: 18),
                                physics: ClampingScrollPhysics(),
                                itemBuilder: (context, index) {
                                  final moodPodcast = podcastsProvider
                                      .getPodcastsByMoodsModel[index];
                                  fetchDuration(moodPodcast
                                      .podcastaudio![0].audio
                                      .toString());
                                  return Container(
                                    padding: EdgeInsets.only(bottom: 10),
                                    child: CustomInkWell(
                                      onTap: () {
                                        Helper.toScreen(
                                            context,
                                            QMScreen(
                                              duration: durationInMinutes,
                                              image: moodPodcast.image,
                                              title: moodPodcast.title,
                                              podcastaudio:
                                                  moodPodcast.podcastaudio,
                                            ));
                                      },
                                      child: Container(
                                        padding: EdgeInsets.symmetric(
                                            horizontal: 10, vertical: 10),
                                        decoration: BoxDecoration(
                                            color: extraLightGreyColor,
                                            borderRadius:
                                                BorderRadius.circular(8)),
                                        child: Row(
                                          children: [
                                            Stack(
                                              alignment: Alignment.center,
                                              children: [
                                                Container(
                                                    width: 80,
                                                    height: 80,
                                                    decoration: BoxDecoration(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              8),
                                                    ),
                                                    clipBehavior: Clip.hardEdge,
                                                    child:
                                                        CustomCachedNetworkImage(
                                                      url:
                                                          '${moodPodcast.image}',
                                                    )),
                                                Image.asset(
                                                  'assets/icons/video_big.png',
                                                  width: 22,
                                                ),
                                              ],
                                            ),
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
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  children: [
                                                    CustomText(
                                                      title:
                                                          "Quick Meditation 2023\nMeditate with me",
                                                      fontSize: 12.5,
                                                      color: blackColor,
                                                      fontWeight:
                                                          FontWeight.w700,
                                                    ),
                                                    CustomText(
                                                      title: "6 min",
                                                      fontSize: 12.5,
                                                      color: greyColor,
                                                      fontWeight:
                                                          FontWeight.w500,
                                                    ),
                                                  ],
                                                ),
                                                //Space
                                                SizedBox(
                                                  height: 6,
                                                ),
                                                CustomText(
                                                  title:
                                                      "By Benjamin - Episode 0${index}",
                                                  fontSize: 12,
                                                  color: textGreyColor2,
                                                  //fontWeight: FontWeight.w700,
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
                          ],
                        ),
            ],
          )),
        );
      }),
    );
  }
}
