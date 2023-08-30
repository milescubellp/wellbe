import 'package:flutter/material.dart';
import 'package:wellbe/models/CustomModels/custom_model.dart';

import 'package:wellbe/utilites/colors.dart';
import 'package:wellbe/utilites/helper.dart';
import 'package:wellbe/widgets/custom_inkwell_btn.dart';
import 'package:wellbe/widgets/custom_text.dart';

import '../../homepage/MoodSpace/my_daily_journal_screen.dart';

class ImageJournalTab extends StatelessWidget {
  const ImageJournalTab({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Container(
            //   child: Stack(alignment: Alignment.bottomCenter, children: [
            //     ClipRRect(
            //       borderRadius: BorderRadius.only(
            //           bottomRight: Radius.circular(30),
            //           bottomLeft: Radius.circular(30)),
            //       child: Image(
            //         image: AssetImage(
            //           'assets/images/slide_img1.png',
            //         ),
            //         width: double.maxFinite,
            //         fit: BoxFit.cover,
            //         height: MediaQuery.of(context).size.height * 0.73,
            //       ),
            //     ),
            //     Container(
            //       width: double.maxFinite,
            //       height: MediaQuery.of(context).size.height * 0.73,
            //       decoration: BoxDecoration(
            //         color: Color(0xFF344954).withOpacity(0.7),
            //         borderRadius: BorderRadius.only(
            //             bottomRight: Radius.circular(30),
            //             bottomLeft: Radius.circular(30)),
            //       ),
            //     ),
            //     Positioned(
            //       bottom: 30,
            //       child: Column(
            //         children: [
            //           CustomText(
            //             title: 'Journal',
            //             color: Colors.white,
            //             fontWeight: FontWeight.bold,
            //             fontSize: 19,
            //             textAlign: TextAlign.center,
            //           ),
            //           const SizedBox(
            //             height: 10,
            //           ),
            //           CustomText(
            //             title:
            //                 'If you use this site regularly and would like to help\nkeep on the internet,please consider\ndonating a small sum',
            //             color: Colors.white,
            //             textAlign: TextAlign.center,
            //             fontWeight: FontWeight.w500,
            //             fontSize: 11,
            //           ),
            //           const SizedBox(
            //             height: 17,
            //           ),
            //           Container(
            //             width: 40,
            //             height: 40,
            //             decoration: BoxDecoration(
            //                 shape: BoxShape.circle,
            //                 color: Color(0xFF44454c).withOpacity(0.7)),
            //             child: Icon(
            //               Icons.arrow_forward,
            //               color: Colors.white,
            //             ),
            //           ),
            //           const SizedBox(
            //             height: 30,
            //           ),
            //         ],
            //       ),
            //     )
            //   ]),
            // ),
            const SizedBox(
              height: 12,
            ),
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
                itemCount: journalList.length,
                shrinkWrap: true,
                padding: EdgeInsets.symmetric(horizontal: 18),
                physics: ClampingScrollPhysics(),
                itemBuilder: (context, index) {
                  return Container(
                    padding: EdgeInsets.only(bottom: 10),
                    child: CustomInkWell(
                      onTap: () {
                        Helper.toScreen(context, MyDailyJournalScreen());
                      },
                      child: Container(
                        padding:
                            EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                        decoration: BoxDecoration(
                            color: journalList[index].color,
                            borderRadius: BorderRadius.circular(8)),
                        child: Row(
                          children: [
                            Container(
                              width: 80,
                              height: 80,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(8),
                                  image: DecorationImage(
                                      fit: BoxFit.cover,
                                      image: AssetImage(
                                          "${meditationList[index].img}"))),
                              clipBehavior: Clip.hardEdge,
                            ),
                            //Space
                            SizedBox(
                              width: 12,
                            ),
                            //
                            Expanded(
                                child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                CustomText(
                                  title: "${journalList[index].title}",
                                  fontSize: 16,
                                  color: blackColor,
                                  fontWeight: FontWeight.w700,
                                ),
                                //Space
                                SizedBox(
                                  height: 6,
                                ),
                                CustomText(
                                  title: "${journalList[index].subTitle}",
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
                      //   Helper.toScreen(context, InsightScreen());
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
                          Helper.toScreen(context, MyDailyJournalScreen());
                        },
                        child: Container(
                          width: MediaQuery.of(context).size.width * 0.6,
                          padding: EdgeInsets.symmetric(
                              horizontal: 15, vertical: 13),
                          decoration: BoxDecoration(
                              color: journalList[index].color,
                              borderRadius: BorderRadius.circular(8)),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              //Space
                              //    SizedBox(height: 6,),
                              Row(
                                children: [
                                  Expanded(
                                    child: CustomText(
                                      title: "${journalList[index].title}",
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
                                      title: "${journalList[index].subTitle}",
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
              height: 20,
            )
          ],
        ),
      ),
    );
  }
}
