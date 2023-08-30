import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wellbe/provider/MoodProvider/mood_provider.dart';
import 'package:wellbe/provider/mindful_provider.dart';
import 'package:wellbe/screens/homepage/Recomendation/recomendation_screen.dart';
import 'package:wellbe/utilites/colors.dart';
import 'package:wellbe/utilites/string_utils.dart';
import 'package:wellbe/widgets/custom_button.dart';
import 'package:wellbe/widgets/custom_text.dart';

import '../../../provider/insight_provider.dart';
import '../../../utilites/helper.dart';
import '../../../widgets/custom_loader.dart';
import '../../../widgets/error_text_widget.dart';
import '../../../widgets/execute_after_frame_render.dart';
import '../Consult/consult.dart';
import '../HomeScreens/homepage_screen.dart';
import 'today_graph.dart';

class TodayTab extends StatefulWidget {
  TodayTab({Key? key}) : super(key: key);

  @override
  State<TodayTab> createState() => _TodayTabState();
}

class _TodayTabState extends State<TodayTab> {
  init() async {
    if (Provider.of<InsightProvider>(context, listen: false).selectedIndex ==
        0) {
      await Provider.of<MoodProvider>(context, listen: false).getMoodsToday(
        () {},
        context,
      );
    }
    debugPrint('<<<<<<<<<<<<<<<<<<<<today tab is selected>>>>>>>>>>>>>>>>>>>');
  }

  @override
  void initState() {
    // TODO: implement initState
    init();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer2<MoodSpaceProvider, MoodProvider>(
        builder: (context, moodSpaceProvider, moodProvider, child) {
      return moodProvider.getMoodsTodayModels.length == 0 &&
              !moodProvider.isApiErrorOccured
          ? Center(child: CustomLoader())
          : moodProvider.isApiErrorOccured
              ? ErrorTextWidget()
              : SingleChildScrollView(
                  child: Column(
                    children: [
                      //Graph
                      Stack(
                        children: [
                          Container(
                            width: double.infinity,
                            height: 230,
                            padding: EdgeInsets.only(top: 20),
                            decoration: BoxDecoration(
                                // color: greenColor
                                ),
                            child: TodayGraph(),
                          ),
                          Positioned(
                              left: 20,
                              top: 0,
                              child: Image.asset(
                                'assets/icons/01_happy.png',
                                width: 30,
                              )),
                          Positioned(
                              left: 60,
                              top: 0,
                              child: Image.asset(
                                'assets/icons/03_surprised.png',
                                width: 30,
                              )),
                          Positioned(
                              left: 100,
                              top: 0,
                              // bottom:
                              //     moodProvider.yPositions[3].toDouble() + 19,
                              child: Image.asset(
                                'assets/icons/04_bad.png',
                                width: 30,
                              )),
                          Positioned(
                              left: 140,
                              top: 0,
                              child: Image.asset(
                                'assets/icons/05_sad.png',
                                width: 30,
                              )),
                          Positioned(
                              left: 190,
                              top: 0,
                              child: Image.asset(
                                'assets/icons/06_fear.png',
                                width: 30,
                              )),
                          Positioned(
                              left: 230,
                              top: 0,
                              child: Image.asset(
                                'assets/icons/01_happy.png',
                                width: 30,
                              )),
                          Positioned(
                              left: 290,
                              top: 0,
                              child: Image.asset(
                                'assets/icons/07_anger.png',
                                width: 30,
                              )),
                        ],
                      ),
                      //Space
                      SizedBox(
                        height: 14,
                      ),
                      //You've been feeling
                      Container(
                        margin: EdgeInsets.symmetric(horizontal: 18),
                        padding:
                            EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                        decoration: BoxDecoration(
                            color: greyColor.withOpacity(0.2),
                            borderRadius: BorderRadius.circular(10)),
                        child: Row(
                          children: [
                            Container(
                              width: 32,
                              height: 32,
                              child: CachedNetworkImage(
                                  imageUrl: moodProvider.selectedEmoji!.image ??
                                      moodProvider.getMoodsTodayModels[0].image
                                          .toString()),
                            ),
                            //Space
                            SizedBox(
                              width: 10,
                            ),
                            Expanded(
                                child: CustomText(
                              title:
                                  "You've been feeling quite ${moodProvider.selectedEmoji?.name}",
                              fontSize: 14,
                              color: blackColor,
                              // fontWeight: FontWeight.w700,
                            ))
                          ],
                        ),
                      ),
                      //Space
                      SizedBox(
                        height: 20,
                      ),
                      //Feelings
                      Container(
                        margin: EdgeInsets.symmetric(horizontal: 18),
                        alignment: Alignment.centerLeft,
                        child: CustomText(
                          title: "Feelings",
                          fontSize: 18,
                          color: blackColor,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      //Space
                      SizedBox(
                        height: 10,
                      ),
                      //
                      Container(
                        //  height: 180,
                        child: Container(
                          width: double.infinity,
                          padding: EdgeInsets.symmetric(horizontal: 18),
                          child: Wrap(
                            spacing: 8,
                            runSpacing: 8,
                            children: [
                              ...List.generate(
                                moodProvider.getMoodsTodayModels.length,
                                (index) => Padding(
                                  padding: const EdgeInsets.only(bottom: 12.0),
                                  child: Container(
                                    width: MediaQuery.of(context).size.width *
                                            0.3 -
                                        8,
                                    child: Container(
                                      height: 60,
                                      // margin: index % 3 == 0 ? EdgeInsets.only(left: 12) : EdgeInsets.only(right: 12),
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(5),
                                          color: Color(0xFFe2f2ff)),
                                      alignment: Alignment.center,
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          CustomText(
                                            title: moodProvider
                                                .getMoodsTodayModels[index]
                                                .name,
                                            fontSize: 15,
                                            color: blackColor,
                                            fontWeight: FontWeight.w700,
                                          ),
                                          //Space
                                          SizedBox(
                                            height: 4,
                                          ),
                                          CustomText(
                                            title: moodProvider
                                                .getMoodsTodayModels[index]
                                                .moodCount
                                                .toString(),
                                            fontSize: 12,
                                            color: blackColor,
                                            //  fontWeight: FontWeight.w700,
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                      //Space
                      SizedBox(
                        height: 10,
                      ),
                      //
                      Container(
                        padding: EdgeInsets.symmetric(horizontal: 18),
                        alignment: Alignment.centerLeft,
                        child: CustomText(
                          title: removeHtmlTags(moodProvider
                              .getMoodsTodayModels[0].description
                              .toString()),
                          fontSize: 12,
                          color: blackColor,
                        ),
                      ),
                      //Space
                      SizedBox(
                        height: 20,
                      ),
                      //
                      Container(
                        padding: EdgeInsets.symmetric(horizontal: 18),
                        // alignment: Alignment.bottomCenter,
                        child: Row(
                          children: [
                            Expanded(
                              child: CustomButton(
                                onPressed: () async {
                                  moodSpaceProvider.thoughtPageChange(false);
                                  Helper.toScreen(
                                      context, RecommendationScreen());
                                },
                                btnHeight: 48,
                                btnWidth: double.infinity,
                                btnRadius: 26,
                                title: 'Explore',
                                fontWeight: FontWeight.w600,
                                btnColor: Colors.transparent,
                                btnBorderWidth: 2,
                                btnBorderColor: darkBlueColor,
                                textColor: darkBlueColor,
                                fontSize: 17,
                              ),
                            ),
                            //Space
                            SizedBox(
                              width: 15,
                            ),
                            Expanded(
                              child: CustomButton(
                                onPressed: () async {
                                  Helper.toRemoveUntiScreen(
                                      context,
                                      HomePageScreen(
                                        index: 3,
                                      ));

                                  //  Helper.toScreen(context, HomePageScreen());
                                },
                                btnHeight: 48,
                                btnWidth: double.infinity,
                                btnRadius: 26,
                                title: 'Talk to Expert',
                                fontWeight: FontWeight.w600,
                                btnColor: darkBlueColor,
                                textColor: whiteColor,
                                fontSize: 17,
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 120,
                      ),
                    ],
                  ),
                );
    });
  }
}
