import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wellbe/models/CustomModels/custom_model.dart';
import 'package:wellbe/provider/homepage_provider.dart';
import 'package:wellbe/provider/meditation_provider.dart';
import 'package:wellbe/provider/mindful_provider.dart';
import 'package:wellbe/screens/homepage/MIndFul/breathing_tab.dart';
import 'package:wellbe/screens/homepage/MoodSpace/my_daily_journal_screen.dart';
import 'package:wellbe/screens/homepage/MoodSpace/my_jounal_screen.dart';
import 'package:wellbe/utilites/colors.dart';
import 'package:wellbe/widgets/custom_inkwell_btn.dart';
import 'package:wellbe/widgets/custom_parent_widget.dart';
import 'package:wellbe/widgets/custom_text.dart';

import '../../../utilites/helper.dart';
import '../HomeScreens/homepage_screen.dart';
import '../MIndFul/breath_in.dart';
import '../MoodSpace/academic_info_input.dart';
import '../QuickMeditation/video_widget.dart';

class MindfulQuickMeditationScreen extends StatefulWidget {
  MindfulQuickMeditationScreen({Key? key}) : super(key: key);

  @override
  State<MindfulQuickMeditationScreen> createState() =>
      _MindfulQuickMeditationScreenState();
}

class _MindfulQuickMeditationScreenState
    extends State<MindfulQuickMeditationScreen> {
  @override
  void dispose() {
    super.dispose();
    //  _pageController.dispose();
    //cameraController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return CustomParentWidget(
      child: Consumer2<MeditationProvider, MoodSpaceProvider>(
          builder: (context, meditationProvider, moodSpaceProvider, child) {
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
          body: SingleChildScrollView(
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
                              meditationProvider.changeCurrentPage(index);
                            },
                          ),
                          carouselController:
                              meditationProvider.buttonCarouselController,
                          items: meditationViewList.map((i) {
                            return Builder(
                              builder: (BuildContext context) {
                                return Container(
                                    width: MediaQuery.of(context).size.width,
                                    child: Stack(
                                      children: [
                                        VideoWidget(
                                          videoUrl: '',
                                        ),
                                        Positioned.directional(
                                            textDirection:
                                                Directionality.of(context),
                                            bottom: 15,
                                            start: 15,
                                            child: meditationProvider
                                                        .currentPage ==
                                                    0
                                                ? Image.asset(
                                                    "assets/icons/video_player_01.png")
                                                : SizedBox()),
                                        Positioned.directional(
                                            textDirection:
                                                Directionality.of(context),
                                            bottom: 0,
                                            top: 0,
                                            start: 0,
                                            end: 0,
                                            child: meditationProvider
                                                        .currentPage ==
                                                    1
                                                ? Image.asset(
                                                    "assets/icons/audio_player_02.png")
                                                : SizedBox())
                                      ],
                                    ));
                              },
                            );
                          }).toList(),
                        ),
                      ),
                      //Space
                      SizedBox(
                        height: 12,
                      ),
                      Container(
                        padding: EdgeInsets.only(left: 18, right: 18),
                        child: Row(
                          children: [
                            Expanded(
                                child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                CustomText(
                                  title:
                                      "QM Heading 0${meditationProvider.currentPage + 1}",
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
                                      "Session 0${meditationProvider.currentPage + 1}",
                                  fontSize: 12,
                                  //  fontWeight: FontWeight.w700,
                                  color: blackColor,
                                ),
                              ],
                            )),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    CustomText(
                                      title:
                                          "0${meditationProvider.currentPage + 1}",
                                      fontSize: 16,
                                      fontWeight: FontWeight.w700,
                                      color: blackColor,
                                    ),
                                    CustomText(
                                      title: "/04",
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
                                        if (meditationProvider.currentPage !=
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
                                              Icons.keyboard_arrow_left_sharp,
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
                                              Icons.keyboard_arrow_right_sharp,
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
                        "It is a long established fact that a reader will be "
                        "and the distracted by the readable content of a page when looking "
                        "at its by layout. The point of using is that it a normal distribution "
                        "of letters, as opposed to using content here, content here, making it look "
                        "like readable English. Many desktop the a publishing packages and web page editors "
                        "now as their default model text, and a search for will be uncover "
                        "many web sites still in their infancy.\n\nVarious versions have evolved over the years, sometimes by "
                        "accident, sometimes on purpose and to injected humour and using content the like.",
                    fontSize: 12,
                    color: blackColor,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),

                //BUTTON
                // Row(
                //   mainAxisAlignment: MainAxisAlignment.center,
                //   children: [
                //     GestureDetector(
                //         onTap: () async {
                //           Helper.toScreen(context, AcademicInfoInput());
                //           // await Future.delayed(Duration(milliseconds: 200));
                //           // moodSpaceProvider.tabNavigate(context, 2);
                //         },
                //         child: Container(
                //           padding: EdgeInsets.symmetric(
                //               horizontal: 37, vertical: 12),
                //           child: Text(
                //             'Next',
                //             style: TextStyle(
                //                 color: Colors.white,
                //                 fontWeight: FontWeight.w500,
                //                 fontSize: 14),
                //           ),
                //           decoration: BoxDecoration(
                //               borderRadius: BorderRadius.circular(30),
                //               color: darkBlueColor),
                //         )),
                //   ],
                // ),
                const SizedBox(
                  height: 50,
                ),
              ],
            ),
          ),
        );
      }),
    );
  }
}
