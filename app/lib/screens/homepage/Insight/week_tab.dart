import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wellbe/provider/mindful_provider.dart';
import 'package:wellbe/utilites/colors.dart';
import 'package:wellbe/widgets/custom_button.dart';
import 'package:wellbe/widgets/custom_parent_widget.dart';
import 'package:wellbe/widgets/custom_text.dart';

import '../../../provider/MoodProvider/mood_provider.dart';
import '../../../provider/insight_provider.dart';
import '../../../utilites/helper.dart';
import '../../../utilites/string_utils.dart';
import '../../../widgets/custom_loader.dart';
import '../../../widgets/error_text_widget.dart';
import '../../../widgets/execute_after_frame_render.dart';
import '../Consult/consult.dart';
import '../HomeScreens/homepage_screen.dart';
import '../Recomendation/recomendation_screen.dart';
import 'week_graph.dart';

class WeekTab extends StatefulWidget {
  const WeekTab({Key? key}) : super(key: key);

  @override
  State<WeekTab> createState() => _WeekTabState();
}

class _WeekTabState extends State<WeekTab> {
  init() async {
    if (Provider.of<InsightProvider>(context, listen: false).selectedIndex !=
        1) {
      await Provider.of<MoodProvider>(context, listen: false)
          .getMoodsWeek(() {}, context, isFirstTime: true);
    }
    debugPrint('<<<<<<<<<<<<<<<<<<<<week tab is selected>>>>>>>>>>>>>>>>>>>');
  }

  @override
  void initState() {
    // TODO: implement initState
    init();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return CustomParentWidget(
      child: Consumer2<MoodSpaceProvider, MoodProvider>(
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
                        Container(
                          width: double.infinity,
                          height: 230,
                          decoration: BoxDecoration(
                              // color: greenColor
                              ),
                          child: WeekGraph(),
                        ),
                        //Space
                        SizedBox(
                          height: 10,
                        ),
                        //You've been feeling
                        Container(
                          margin: EdgeInsets.symmetric(horizontal: 18),
                          padding: EdgeInsets.symmetric(
                              horizontal: 15, vertical: 10),
                          decoration: BoxDecoration(
                              color: greyColor.withOpacity(0.2),
                              borderRadius: BorderRadius.circular(10)),
                          child: Row(
                            children: [
                              Container(
                                width: 32,
                                height: 32,
                                child: CachedNetworkImage(
                                    imageUrl:
                                        moodProvider.selectedEmoji!.image ??
                                            moodProvider
                                                .getMoodsTodayModels[0].image
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
                                    padding:
                                        const EdgeInsets.only(bottom: 12.0),
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
      }),
    );
  }
}
