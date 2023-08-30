import 'package:flutter/material.dart';
import 'package:just_audio/just_audio.dart';
import 'package:provider/provider.dart';
import 'package:wellbe/models/CustomModels/custom_model.dart';
import 'package:wellbe/provider/keyboard_visibility_provider.dart';
import 'package:wellbe/provider/mindful_provider.dart';
import 'package:wellbe/screens/homepage/MoodSpace/qm_screen.dart';

import 'package:wellbe/utilites/colors.dart';
import 'package:wellbe/utilites/helper.dart';
import 'package:wellbe/widgets/custom_inkwell_btn.dart';
import 'package:wellbe/widgets/custom_parent_widget.dart';
import 'package:wellbe/widgets/custom_text.dart';
import 'package:wellbe/widgets/custom_textfield.dart';

import '../../../provider/JournalProvider/journal_provider.dart';
import '../../../provider/MoodProvider/mood_provider.dart';
import '../../../provider/PodcastsProvider/podcasts_provider.dart';
import '../../../provider/homepage_provider.dart';
import '../../../widgets/custom_cached_network_image.dart';
import '../../../widgets/custom_loader.dart';
import '../../../widgets/error_text_widget.dart';
import 'WeeksPodcast/angry_tab.dart';
import 'WeeksPodcast/bad_tab.dart';
import 'WeeksPodcast/disgusted_tab.dart';
import 'WeeksPodcast/fear_tab.dart';
import 'WeeksPodcast/happy_tab.dart';
import 'WeeksPodcast/sad_tab.dart';
import 'WeeksPodcast/surprised_tab.dart';

class PodcastTab extends StatefulWidget {
  PodcastTab({Key? key}) : super(key: key);

  @override
  State<PodcastTab> createState() => _PodcastTabState();
}

class _PodcastTabState extends State<PodcastTab> {
  int selectedIndex = 1;
  FocusNode _focusNode = FocusNode();

  String getButtonTitle(int index) {
    switch (index) {
      case 0:
        return 'Angry';
      case 1:
        return 'Grateful';
      case 2:
        return 'Anxiety';
      case 3:
        return 'Happy';
      case 4:
        return 'Sad';
      default:
        return '';
    }
  }

  init() {
    Provider.of<PodcastsProvider>(context, listen: false)
        .getPodcasts((status) {}, context);

    final keyboardVisibilityProvider =
        Provider.of<KeyboardVisibilityProvider>(context, listen: false);
    _focusNode.addListener(() {
      keyboardVisibilityProvider.setKeyboardVisibility(_focusNode.hasFocus);
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    init();
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
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return CustomParentWidget(
      child: Consumer4<MoodSpaceProvider, KeyboardVisibilityProvider,
              PodcastsProvider, MoodProvider>(
          builder: (context, mindfulProvider, keyboardVisibilityProvider,
              podcastsProvider, moodProvider, child) {
        return podcastsProvider.isLoading
            ? Center(
                child: CustomLoader(),
              )
            : podcastsProvider.getPodcastsModel.length != 0 &&
                    !podcastsProvider.isLoading
                ? SingleChildScrollView(
                    child: Column(
                      children: [
                        //Space
                        SizedBox(
                          height: 20,
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 18.0),
                          child: Column(
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  CustomText(
                                    title: "On Trending",
                                    fontSize: 16,
                                    color: blackColor,
                                    fontWeight: FontWeight.w600,
                                  ),
                                  // GestureDetector(
                                  //   onTap: () {
                                  //     // Add your action here
                                  //   },
                                  //   child: Row(
                                  //     children: [
                                  //       CustomText(
                                  //         title: 'View All',
                                  //         fontSize: 15,
                                  //         color: blueColor,
                                  //         fontWeight: FontWeight.w600,
                                  //       ),
                                  //       const SizedBox(
                                  //         width: 2,
                                  //       ),
                                  //       Icon(
                                  //         Icons.arrow_forward_ios,
                                  //         color: blueColor,
                                  //         size: 14,
                                  //       ),
                                  //     ],
                                  //   ),
                                  // ),
                                ],
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Container(
                                height: 140,
                                child: ListView.builder(
                                  padding: EdgeInsets.zero,
                                  scrollDirection: Axis.horizontal,
                                  itemCount: podcastsProvider.getPodcastsModel
                                      .length, // Replace with the actual number of items in your list
                                  itemBuilder: (context, index) {
                                    final getPodcasts = podcastsProvider
                                        .getPodcastsModel[index];
                                    fetchDuration(getPodcasts
                                        .podcastaudio![0].audio
                                        .toString());

                                    return CustomInkWell(
                                      onTap: () {
                                        Helper.toScreen(
                                            context,
                                            QMScreen(
                                              image: getPodcasts.image,
                                              duration: durationInMinutes,
                                              title: getPodcasts.title,
                                              podcastaudio:
                                                  getPodcasts.podcastaudio,
                                            ));
                                      },
                                      child: Container(
                                        width: 290,
                                        margin: EdgeInsets.only(right: 10),
                                        padding:
                                            EdgeInsets.fromLTRB(16, 12, 8, 10),
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(15),
                                          color: kPrimaryColor,
                                        ),
                                        child: Row(
                                          children: [
                                            Expanded(
                                              child: Container(
                                                padding: EdgeInsets.all(10),
                                                child: Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                  children: [
                                                    CustomText(
                                                      title:
                                                          '${getPodcasts.title}',
                                                      fontSize: 13,
                                                      color: blackColor,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                    ),
                                                    SizedBox(height: 15),
                                                    Text(
                                                      'By Benjamin\nEpisode 03',
                                                      style: TextStyle(
                                                          fontSize: 12,
                                                          color: textGreyColor2,
                                                          fontWeight:
                                                              FontWeight.bold),
                                                    ),
                                                    SizedBox(height: 8),
                                                    Text(
                                                      '${durationInMinutes} min',
                                                      style: TextStyle(
                                                        fontSize: 12,
                                                        fontWeight:
                                                            FontWeight.w500,
                                                        color: darkGreyColor,
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ),
                                            Stack(
                                              alignment: Alignment.center,
                                              children: [
                                                Container(
                                                  width: 105,
                                                  height: 130,
                                                  decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            8),
                                                  ),
                                                  clipBehavior: Clip.hardEdge,
                                                  child: CustomCachedNetworkImage(
                                                      url:
                                                          '${getPodcasts.image}'),
                                                ),
                                                Icon(
                                                  Icons.play_arrow_rounded,
                                                  color: Colors.white,
                                                  size: 55,
                                                )
                                              ],
                                            ),
                                          ],
                                        ),
                                      ),
                                    );
                                  },
                                ),
                              ),
                              SizedBox(
                                height: 20,
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      CustomText(
                                        title: "Weeks's Podcasts",
                                        fontSize: 16,
                                        color: blackColor,
                                        fontWeight: FontWeight.w600,
                                      ),
                                      const SizedBox(
                                        height: 1.5,
                                      ),
                                      CustomText(
                                        title:
                                            "Listen to the favourite Podcast",
                                        fontSize: 12,
                                        color: textGreyColor2,
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ],
                                  ),
                                  // GestureDetector(
                                  //   onTap: () {
                                  //     // Add your action here
                                  //   },
                                  //   child: Row(
                                  //     children: [
                                  //       CustomText(
                                  //         title: 'View All',
                                  //         fontSize: 15,
                                  //         color: blueColor,
                                  //         fontWeight: FontWeight.w600,
                                  //       ),
                                  //       const SizedBox(
                                  //         width: 2,
                                  //       ),
                                  //       Icon(
                                  //         Icons.arrow_forward_ios,
                                  //         color: blueColor,
                                  //         size: 14,
                                  //       ),
                                  //     ],
                                  //   ),
                                  // ),
                                ],
                              ),
                              const SizedBox(
                                height: 15,
                              ),
                              Container(
                                height: 30,
                                child: ListView.builder(
                                  scrollDirection: Axis.horizontal,
                                  itemCount:
                                      moodProvider.getAllMoodsModels.length,
                                  itemBuilder: (context, index) {
                                    final getAllMoods =
                                        moodProvider.getAllMoodsModels[index];
                                    return Container(
                                      margin: EdgeInsets.only(right: 8),
                                      child: CustomInkWell(
                                        onTap: () {
                                          mindfulProvider
                                              .onChangeWeekPodcast(index);
                                        },
                                        child: Container(
                                          width: 75,
                                          alignment: Alignment.center,
                                          decoration: BoxDecoration(
                                            border: Border.all(
                                              color: Colors.grey,
                                              width: 1,
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(4),
                                            color: mindfulProvider
                                                        .selectedWeekPodcast ==
                                                    index
                                                ? kPrimaryColor
                                                : Colors.transparent,
                                          ),
                                          child: Text(
                                            getAllMoods.name.toString(),
                                            style: TextStyle(
                                              fontSize: 12,
                                              color: textGreyColor2,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                        ),
                                      ),
                                    );
                                  },
                                ),
                              ),
                              const SizedBox(
                                height: 25,
                              ),
                              mindfulProvider.selectedWeekPodcast == 0
                                  ? FearTab(
                                      index:
                                          moodProvider.getAllMoodsModels[0].id,
                                    )
                                  : mindfulProvider.selectedWeekPodcast == 1
                                      ? AngryTab(
                                          index: moodProvider
                                              .getAllMoodsModels[1].id,
                                        )
                                      : mindfulProvider.selectedWeekPodcast == 2
                                          ? BadTab(
                                              index: moodProvider
                                                  .getAllMoodsModels[2].id,
                                            )
                                          : mindfulProvider
                                                      .selectedWeekPodcast ==
                                                  3
                                              ? DisgustedTab(
                                                  index: moodProvider
                                                      .getAllMoodsModels[3].id,
                                                )
                                              : mindfulProvider
                                                          .selectedWeekPodcast ==
                                                      4
                                                  ? SadTab(
                                                      index: moodProvider
                                                          .getAllMoodsModels[4]
                                                          .id,
                                                    )
                                                  : mindfulProvider
                                                              .selectedWeekPodcast ==
                                                          5
                                                      ? SurprisedTab(
                                                          index: moodProvider
                                                              .getAllMoodsModels[
                                                                  5]
                                                              .id,
                                                        )
                                                      : HappyTab(
                                                          index: moodProvider
                                                              .getAllMoodsModels[
                                                                  6]
                                                              .id,
                                                        )
                            ],
                          ),
                        ),
                      ],
                    ),
                  )
                : Center(
                    child: ErrorTextWidget(),
                  );
      }),
    );
  }
}
