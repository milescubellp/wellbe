import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wellbe/models/CustomModels/custom_model.dart';
import 'package:wellbe/provider/MoodProvider/mood_provider.dart';
import 'package:wellbe/provider/homepage_provider.dart';
import 'package:wellbe/provider/meditation_provider.dart';
import 'package:wellbe/provider/mindful_provider.dart';
import 'package:wellbe/provider/video_player_provider.dart';
import 'package:wellbe/screens/homepage/MIndFul/breathing_tab.dart';
import 'package:wellbe/screens/homepage/MoodSpace/my_daily_journal_screen.dart';
import 'package:wellbe/screens/homepage/MoodSpace/my_jounal_screen.dart';
import 'package:wellbe/utilites/app_constant.dart';
import 'package:wellbe/utilites/colors.dart';
import 'package:wellbe/widgets/custom_inkwell_btn.dart';
import 'package:wellbe/widgets/custom_loader.dart';
import 'package:wellbe/widgets/custom_parent_widget.dart';
import 'package:wellbe/widgets/custom_text.dart';
import 'package:wellbe/widgets/execute_after_frame_render.dart';

import '../../../utilites/helper.dart';
import '../../../widgets/error_text_widget.dart';
import '../HomeScreens/homepage_screen.dart';
import '../MIndFul/breath_in.dart';
import '../MoodSpace/academic_info_input.dart';
import 'video_widget.dart';

class QuickMeditationScreen extends StatefulWidget {
  String? screenName = '';
  QuickMeditationScreen({Key? key, this.screenName}) : super(key: key);

  @override
  State<QuickMeditationScreen> createState() => _QuickMeditationScreenState();
}

class _QuickMeditationScreenState extends State<QuickMeditationScreen> {
  MeditationProvider? meditationProvider;
  @override
  void initState() {
    // TODO: implement initState

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return CustomParentWidget(
      child: Consumer3<MeditationProvider, MoodSpaceProvider, MoodProvider>(
          builder: (context, meditationProvider, moodSpaceProvider,
              moodProvider, child) {
        return Scaffold(
            appBar: AppBar(
              elevation: 0,
              centerTitle: false,
              automaticallyImplyLeading: false,
              backgroundColor: kPrimaryColor,
              title: CustomText(
                title: "Quick Meditation",
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
            body: moodProvider.getVideoMoodBasedModels.length == 0 &&
                    !moodProvider.isApiErrorOccured
                ? Center(child: CustomLoader())
                : moodProvider.isApiErrorOccured
                    ? ErrorTextWidget()
                    : SingleChildScrollView(
                        child: Column(
                          children: [
                            //Box
                            Container(
                              height: 310,
                              width: MediaQuery.of(context).size.width,
                              decoration: BoxDecoration(
                                  color: kPrimaryColor,
                                  borderRadius: BorderRadius.only(
                                    bottomLeft: Radius.circular(25),
                                    bottomRight: Radius.circular(25),
                                  )),
                              padding: EdgeInsets.symmetric(horizontal: 18),
                              child: Column(
                                children: [
                                  //Space
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Container(
                                    height: 220,
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
                                          meditationProvider
                                              .changeCurrentPage(index);
                                          moodProvider.addUserVideo(
                                              moodProvider.moodId,
                                              moodProvider.subMoodId,
                                              moodProvider
                                                  .getVideoMoodBasedModels[0]
                                                  .videos![index]
                                                  .id
                                                  .toString(),
                                              (status, String message) {
                                            if (status) {
                                              debugPrint(
                                                  '<<<<<<<<<<<<${message}>>>>>>>>>>>');
                                            } else {
                                              debugPrint(
                                                  '<<<<<<<<<<<<${message}>>>>>>>>>>>');
                                            }
                                          }, context);
                                        },
                                      ),
                                      carouselController: meditationProvider
                                          .buttonCarouselController,
                                      items: moodProvider
                                          .getVideoMoodBasedModels[0].videos!
                                          .asMap()
                                          .map((index, i) {
                                            return MapEntry(
                                              index,
                                              Builder(
                                                builder:
                                                    (BuildContext context) {
                                                  final key =
                                                      Key('$index + 1}');
                                                  return Container(
                                                      width:
                                                          MediaQuery.of(context)
                                                              .size
                                                              .width,
                                                      child: Stack(
                                                        children: [
                                                          // moodProvider
                                                          //         .isCompleted
                                                          //     ?
                                                          VideoWidget(
                                                              key: key,
                                                              videoUrl: i.filePath !=
                                                                      null
                                                                  ? '${i.filePath}'
                                                                  : '${i.link}')

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
                                  SizedBox(
                                    height: 12,
                                  ),
                                  Container(
                                    padding:
                                        EdgeInsets.only(left: 18, right: 18),
                                    child: Row(
                                      children: [
                                        Expanded(
                                            child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            CustomText(
                                              title:
                                                  "${moodProvider.getVideoMoodBasedModels[0].moodName}",
                                              fontSize: 16,
                                              fontWeight: FontWeight.w700,
                                              color: blackColor,
                                            ),
                                            //Space
                                            SizedBox(
                                              height: 5,
                                            ),
                                            CustomText(
                                              title:
                                                  "${moodProvider.getVideoMoodBasedModels[0].subMoodName}",
                                              fontSize: 12,
                                              //  fontWeight: FontWeight.w700,
                                              color: blackColor,
                                            ),
                                          ],
                                        )),
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.end,
                                          children: [
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.end,
                                              children: [
                                                CustomText(
                                                  title:
                                                      "0${meditationProvider.currentPage + 1}",
                                                  fontSize: 16,
                                                  fontWeight: FontWeight.w700,
                                                  color: blackColor,
                                                ),
                                                CustomText(
                                                  title:
                                                      "/0${moodProvider.getVideoMoodBasedModels[0].videos!.length}",
                                                  fontSize: 12,
                                                  //fontWeight: FontWeight.w700,
                                                  color: blackColor,
                                                ),
                                              ],
                                            ),
                                            //Space
                                            SizedBox(
                                              height: 5,
                                            ),
                                            Row(
                                              children: [
                                                CustomInkWell(
                                                  onTap: () {
                                                    if (meditationProvider
                                                            .currentPage !=
                                                        0) {
                                                      meditationProvider
                                                          .changeSliderBack(
                                                              context);
                                                    }
                                                  },
                                                  child: Container(
                                                      padding:
                                                          EdgeInsets.all(1),
                                                      decoration: BoxDecoration(
                                                          shape:
                                                              BoxShape.circle,
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
                                                    if (meditationProvider
                                                            .currentPage <
                                                        meditationViewList
                                                                .length -
                                                            1) {
                                                      meditationProvider
                                                          .changeSliderForward(
                                                              context);
                                                    }
                                                  },
                                                  child: Container(
                                                      padding:
                                                          EdgeInsets.all(1),
                                                      decoration: BoxDecoration(
                                                          shape:
                                                              BoxShape.circle,
                                                          border: Border.all(
                                                              width: 1.5,
                                                              color: meditationProvider.currentPage ==
                                                                      meditationViewList.length -
                                                                          1
                                                                  ? greyColor
                                                                  : blackColor)),
                                                      child: Icon(
                                                          Icons
                                                              .keyboard_arrow_right_sharp,
                                                          color: meditationProvider
                                                                      .currentPage ==
                                                                  meditationViewList.length - 1
                                                              ? greyColor
                                                              : blackColor)),
                                                ),
                                              ],
                                            )
                                          ],
                                        )
                                      ],
                                    ),
                                  )
                                ],
                              ),
                            ),
                            //Space
                            SizedBox(
                              height: 30,
                            ),
                            //
                            Container(
                              width: double.infinity,
                              padding: EdgeInsets.symmetric(horizontal: 18),
                              child: CustomText(
                                title:
                                    "${moodProvider.getVideoMoodBasedModels[0].description}",
                                fontSize: 12,
                                color: blackColor,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            const SizedBox(
                              height: 30,
                            ),

                            //BUTTON
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                GestureDetector(
                                    onTap: () async {
                                      if (moodSpaceProvider.isThoughtPage) {
                                        moodSpaceProvider
                                            .onSelectedIndexChange(0);
                                        Navigator.pop(context);
                                        moodSpaceProvider
                                            .thoughtPageChange(false);
                                      } else {
                                        Helper.toScreen(
                                            context, AcademicInfoInput());
                                      }
                                      // await Future.delayed(Duration(milliseconds: 200));
                                      // moodSpaceProvider.tabNavigate(context, 2);
                                    },
                                    child: Container(
                                      padding: EdgeInsets.symmetric(
                                          horizontal: 37, vertical: 12),
                                      child: Text(
                                        'Next',
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
                      ));
      }),
    );
  }
}
