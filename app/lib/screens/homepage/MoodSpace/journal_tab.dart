import 'package:flutter/material.dart';
import 'package:persistent_bottom_nav_bar_v2/persistent-tab-view.dart';
import 'package:provider/provider.dart';
import 'package:wellbe/models/CustomModels/custom_model.dart';
import 'package:wellbe/screens/homepage/MoodSpace/edit_journal_detail.dart';
import 'package:wellbe/screens/homepage/MoodSpace/journal_detail.dart';
import 'package:wellbe/screens/homepage/MoodSpace/my_jounal_screen.dart';

import 'package:wellbe/utilites/colors.dart';
import 'package:wellbe/utilites/helper.dart';
import 'package:wellbe/utilites/string_utils.dart';
import 'package:wellbe/widgets/custom_inkwell_btn.dart';
import 'package:wellbe/widgets/custom_text.dart';

import '../../../provider/JournalProvider/journal_provider.dart';
import '../../../widgets/custom_cached_network_image.dart';
import '../../../widgets/custom_loader.dart';
import 'my_daily_journal_screen.dart';

class JournalTab extends StatefulWidget {
  const JournalTab({Key? key}) : super(key: key);

  @override
  State<JournalTab> createState() => _JournalTabState();
}

class _JournalTabState extends State<JournalTab> {
  @override
  void initState() {
    // TODO: implement initState
    Provider.of<JournalProvider>(context, listen: false)
        .getJournal((status) {}, context);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<JournalProvider>(
        builder: (context, journalProvider, child) {
      return Scaffold(
        body: journalProvider.getJournalModel.length != 0
            ? SingleChildScrollView(
                child: Column(
                  children: [
                    Container(
                      height: 50,
                      padding: EdgeInsets.symmetric(horizontal: 18),
                      alignment: Alignment.centerLeft,
                      child: CustomText(
                        title: "Explore according to your mood",
                        fontSize: 15,
                        color: blackColor,
                      ),
                    ),
                    ListView.builder(
                        itemCount: journalProvider.getJournalModel.length,
                        shrinkWrap: true,
                        padding: EdgeInsets.symmetric(horizontal: 18),
                        physics: ClampingScrollPhysics(),
                        itemBuilder: (context, index) {
                          final getJournal =
                              journalProvider.getJournalModel[index];
                          return Container(
                            padding: EdgeInsets.only(bottom: 10),
                            child: CustomInkWell(
                              onTap: () {
                                // if (index == 0)
                                //   pushNewScreen(context,
                                //       screen: JournalDetail(), withNavBar: false);

                                Helper.toScreen(
                                    context,
                                    MyDailyJournalScreen(
                                      index: getJournal.id,
                                    ));
                                debugPrint(
                                    'journal questions length:${getJournal.questions!.length}');
                              },
                              child: Container(
                                padding: EdgeInsets.symmetric(
                                    horizontal: 10, vertical: 10),
                                decoration: BoxDecoration(
                                    color: journalList[0].color,
                                    borderRadius: BorderRadius.circular(8)),
                                child: Row(
                                  children: [
                                    Container(
                                        width: 80,
                                        height: 80,
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(8),
                                        ),
                                        clipBehavior: Clip.hardEdge,
                                        child: CustomCachedNetworkImage(
                                          url: getJournal.image,
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
                                          title: "${getJournal.title}",
                                          fontSize: 16,
                                          color: blackColor,
                                          fontWeight: FontWeight.w700,
                                        ),
                                        //Space
                                        SizedBox(
                                          height: 6,
                                        ),
                                        CustomText(
                                          title: removeHtmlTags(getJournal
                                              .description
                                              .toString()),
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
                      height: 5,
                    ),
                    //Feelings
                    Container(
                      margin: EdgeInsets.only(left: 18, right: 10),
                      alignment: Alignment.centerLeft,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          CustomText(
                            title: "Recent Entries",
                            fontSize: 17,
                            color: blackColor,
                            fontWeight: FontWeight.w700,
                          ),
                          CustomInkWell(
                            onTap: () {
                              Helper.toScreen(context, MyJournalScreen());
                            },
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Row(
                                children: [
                                  CustomText(
                                    title: "View All",
                                    fontSize: 15,
                                    color: blueColor,
                                    fontWeight: FontWeight.w600,
                                  ),
                                  //Space
                                  // SizedBox(width: 4,),
                                  Icon(
                                    Icons.keyboard_arrow_right,
                                    color: blackColor,
                                  )
                                ],
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                    //
                    Container(
                      height: 125,
                      child: ListView.builder(
                          itemCount: journalList.length,
                          shrinkWrap: true,
                          padding: EdgeInsets.symmetric(horizontal: 18),
                          physics: ClampingScrollPhysics(),
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (context, index) {
                            return Container(
                              padding: EdgeInsets.only(right: 15),
                              child: CustomInkWell(
                                onTap: () {
                                  Helper.toScreen(context, EditJournalDetail());
                                },
                                child: Container(
                                  width:
                                      MediaQuery.of(context).size.width * 0.6,
                                  padding: EdgeInsets.symmetric(
                                      horizontal: 15, vertical: 13),
                                  decoration: BoxDecoration(
                                      color: journalList[index].color,
                                      borderRadius: BorderRadius.circular(8)),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      //Space
                                      //    SizedBox(height: 6,),
                                      Row(
                                        children: [
                                          Expanded(
                                            child: CustomText(
                                              title:
                                                  "${journalList[index].title}",
                                              fontSize: 16,
                                              color: blackColor,
                                              fontWeight: FontWeight.w700,
                                            ),
                                          ),
                                        ],
                                      ),
                                      //Space
                                      SizedBox(
                                        height: 6,
                                      ),
                                      Row(
                                        children: [
                                          Expanded(
                                            child: CustomText(
                                              title:
                                                  "${journalList[index].subTitle}",
                                              fontSize: 12,
                                              color: blackColor,
                                              //fontWeight: FontWeight.w700,
                                            ),
                                          ),
                                        ],
                                      ),
                                      //Space
                                      SizedBox(
                                        height: 6,
                                      ),
                                      Row(
                                        children: [
                                          Expanded(
                                            child: CustomText(
                                                title: "12 Apr 2023",
                                                fontSize: 10,
                                                color: greyColor
                                                //fontWeight: FontWeight.w700,
                                                ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            );
                          }),
                    ),
                    //Space
                    SizedBox(
                      height: 100,
                    )
                  ],
                ),
              )
            : Center(child: CustomLoader()),
      );
    });
  }
}
