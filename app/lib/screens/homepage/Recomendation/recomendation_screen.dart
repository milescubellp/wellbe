import 'package:flutter/material.dart';
import 'package:persistent_bottom_nav_bar_v2/persistent-tab-view.dart';
import 'package:provider/provider.dart';
import 'package:wellbe/models/CustomModels/custom_model.dart';
import 'package:wellbe/screens/homepage/MIndFul/breath_in.dart';
import 'package:wellbe/screens/homepage/MoodSpace/academic_audio.dart';
import 'package:wellbe/screens/homepage/MoodSpace/academic_info_input.dart';
import 'package:wellbe/screens/homepage/MoodSpace/academic_screen.dart';
import 'package:wellbe/screens/homepage/MoodSpace/my_daily_journal_screen.dart';
import 'package:wellbe/screens/homepage/MoodSpace/my_jounal_screen.dart';
import 'package:wellbe/screens/homepage/QuickMeditation/quick_meditation_screen.dart';
import 'package:wellbe/utilites/colors.dart';
import 'package:wellbe/utilites/helper.dart';
import 'package:wellbe/widgets/custom_cached_network_image.dart';
import 'package:wellbe/widgets/custom_inkwell_btn.dart';
import 'package:wellbe/widgets/custom_parent_widget.dart';
import 'package:wellbe/widgets/custom_text.dart';

import '../../../provider/MoodProvider/mood_provider.dart';
import '../../../provider/insight_provider.dart';
import '../../../provider/mindful_provider.dart';
import '../HomeScreens/homepage_screen.dart';

class RecommendationScreen extends StatefulWidget {
  String? screenName;

  RecommendationScreen({Key? key, this.screenName}) : super(key: key);

  @override
  State<RecommendationScreen> createState() => _RecommendationScreenState();
}

class _RecommendationScreenState extends State<RecommendationScreen> {
  @override
  void initState() {
    // TODO: implement initState
    Provider.of<MoodProvider>(context, listen: false)
        .getVideoMoodBased(2, (isVerified) {}, context, isVideo: true);
    Provider.of<MoodProvider>(context, listen: false)
        .getVideoMoodBased(2, (isVerified) {}, context, isVideo: false);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return CustomParentWidget(
      child: Consumer<MoodSpaceProvider>(
          builder: (context, moodSpaceProvider, child) {
        return WillPopScope(
          onWillPop: () async {
            if (moodSpaceProvider.isThoughtPage) {
              Provider.of<InsightProvider>(context, listen: false)
                  .onInsightChange(false);
              Navigator.of(
                context,
              )
                ..pop()
                ..pop();
            } else {
              Provider.of<InsightProvider>(context, listen: false)
                  .onInsightChange(false);
              Navigator.of(
                context,
              )
                ..pop()
                ..pop();
            }
            return true;
          },
          child: Scaffold(
            appBar: AppBar(
              elevation: 0,
              centerTitle: true,
              leading: CustomInkWell(
                onTap: () {
                  if (moodSpaceProvider.isThoughtPage) {
                    Navigator.of(
                      context,
                    )
                      ..pop()
                      ..pop();
                  } else {
                    Provider.of<InsightProvider>(context, listen: false)
                        .onInsightChange(false);
                    Navigator.of(
                      context,
                    )
                      ..pop()
                      ..pop();
                  }
                },
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Image.asset(
                    "assets/icons/arrow_back_02.png",
                    scale: 1.1,
                  ),
                ),
              ),
              title: CustomText(
                title: "Recommendation",
                fontSize: 16,
                color: blackColor,
                fontWeight: FontWeight.w700,
              ),
              bottom: PreferredSize(
                preferredSize: Size.fromHeight(2),
                child: Divider(
                  height: 1,
                  thickness: 1,
                  color: kPrimaryColor,
                  indent: 18,
                  endIndent: 18,
                ),
              ),
            ),
            body: SingleChildScrollView(
              child: Column(
                children: [
                  //
                  Container(
                    height: 50,
                    padding: EdgeInsets.symmetric(horizontal: 18),
                    alignment: Alignment.centerLeft,
                    child: CustomText(
                      title: "A grate day change your mood",
                      fontSize: 12,
                      color: blackColor,
                    ),
                  ),
                  ListView.builder(
                      itemCount: meditationList.length,
                      shrinkWrap: true,
                      padding: EdgeInsets.symmetric(horizontal: 18),
                      physics: ClampingScrollPhysics(),
                      itemBuilder: (context, index) {
                        return Container(
                          padding: EdgeInsets.only(bottom: 10),
                          child: CustomInkWell(
                            onTap: () {
                              if (widget.screenName == 'alltab') {
                                if (index == 0) {
                                  Helper.toScreen(
                                    context,
                                    AcademicScreen(),
                                  );
                                } else if (index == 1) {
                                  Helper.toScreen(
                                    context,
                                    AcademicAudioScreen(),
                                  );
                                } else if (index == 2) {
                                  Helper.toScreen(
                                    context,
                                    AcademicInfoInput(),
                                  );
                                } else if (index == 3) {
                                  Helper.toScreen(
                                    context,
                                    BreathIn(),
                                  );
                                }
                              } else {
                                if (index == 1) {
                                  Helper.toScreen(
                                    context,
                                    AcademicAudioScreen(
                                        screenName: 'recommendationScreen'),
                                  );
                                } else if (index == 2) {
                                  if (Provider.of<InsightProvider>(context,
                                          listen: false)
                                      .isInsight) {
                                    Provider.of<InsightProvider>(context,
                                            listen: false)
                                        .onInsightChange(false);
                                  }
                                  Helper.toScreen(
                                    context,
                                    AcademicInfoInput(
                                        screenName: 'recommendationScreen'),
                                  );
                                } else if (index == 3) {
                                  Helper.toScreen(
                                    context,
                                    BreathIn(
                                        screenName: 'recommendationScreen'),
                                  );
                                } else {
                                  Helper.toScreen(
                                    context,
                                    QuickMeditationScreen(),
                                  );
                                }
                              }
                              ;
                            },
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
                                      CustomText(
                                        title: "Quick Meditation",
                                        fontSize: 16,
                                        color: blackColor,
                                        fontWeight: FontWeight.w700,
                                      ),
                                      //Space
                                      SizedBox(
                                        height: 6,
                                      ),
                                      CustomText(
                                        title:
                                            "It is a long established fact that a reader",
                                        fontSize: 12,
                                        color: blackColor,
                                        //fontWeight: FontWeight.w700,
                                      ),
                                    ],
                                  )),
                                  //Space
                                  SizedBox(
                                    width: 12,
                                  ),
                                  CustomInkWell(
                                    onTap: () {},
                                    child: Container(
                                        padding: EdgeInsets.all(3),
                                        decoration: BoxDecoration(
                                            shape: BoxShape.circle,
                                            // border: Border.all(
                                            //     width: 1,
                                            color: darkBlueColor
                                            //  )
                                            ),
                                        child: Icon(
                                          Icons.keyboard_arrow_right_sharp,
                                          color: whiteColor,
                                        )),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        );
                      }),
                  //Space
                  SizedBox(
                    height: 10,
                  ),
                  //
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 18),
                    child: CustomInkWell(
                      onTap: () {
                        Helper.toRemoveUntiScreen(
                            context,
                            HomePageScreen(
                              index: 3,
                            ));
                      },
                      child: Container(
                        padding:
                            EdgeInsets.symmetric(horizontal: 15, vertical: 15),
                        decoration: BoxDecoration(
                            color: greyColor.withOpacity(0.2),
                            borderRadius: BorderRadius.circular(10)),
                        child: Row(
                          children: [
                            Expanded(
                                child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                CustomText(
                                  title: "I need someone to talk to?",
                                  fontSize: 16,
                                  color: blackColor,
                                  fontWeight: FontWeight.w700,
                                ),
                                //Space
                                SizedBox(
                                  height: 4,
                                ),
                                CustomText(
                                  title: "Find the right therapist for you.",
                                  fontSize: 12,
                                  color: greyColor,
                                  fontWeight: FontWeight.w700,
                                ),
                                //Space
                                SizedBox(
                                  height: 20,
                                ),
                                Row(
                                  children: [
                                    CustomText(
                                      title: "Book an Appointment",
                                      fontSize: 14,
                                      color: blueColor,
                                      fontWeight: FontWeight.w600,
                                    ),
                                    //Space
                                    SizedBox(
                                      width: 2,
                                    ),
                                    Icon(
                                      Icons.keyboard_arrow_right,
                                      color: greyColor,
                                    )
                                  ],
                                ),
                              ],
                            )),
                            Image.asset("assets/icons/talk.png")
                          ],
                        ),
                      ),
                    ),
                  ),
                  //Space
                  SizedBox(
                    height: 60,
                  ),
                ],
              ),
            ),
          ),
        );
      }),
    );
  }
}
