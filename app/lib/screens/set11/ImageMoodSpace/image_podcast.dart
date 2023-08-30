import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wellbe/models/CustomModels/custom_model.dart';
import 'package:wellbe/provider/mindful_provider.dart';

import 'package:wellbe/utilites/colors.dart';
import 'package:wellbe/utilites/helper.dart';
import 'package:wellbe/widgets/custom_inkwell_btn.dart';
import 'package:wellbe/widgets/custom_parent_widget.dart';
import 'package:wellbe/widgets/custom_text.dart';
import 'package:wellbe/widgets/custom_textfield.dart';

import '../../homepage/MoodSpace/WeeksPodcast/angry_tab.dart';
import '../../homepage/MoodSpace/WeeksPodcast/bad_tab.dart';
import '../../homepage/MoodSpace/WeeksPodcast/disgusted_tab.dart';
import '../../homepage/MoodSpace/WeeksPodcast/happy_tab.dart';
import '../../homepage/MoodSpace/WeeksPodcast/sad_tab.dart';

class ImagePodcastTab extends StatelessWidget {
  ImagePodcastTab({Key? key}) : super(key: key);
  int selectedIndex = 1;

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

  @override
  Widget build(BuildContext context) {
    return CustomParentWidget(
      child: Consumer<MoodSpaceProvider>(
          builder: (context, mindfulProvider, child) {
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
                //           'assets/images/slide_img3.png',
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
                //             title: 'We provide best podcasts',
                //             color: Colors.white,
                //             fontWeight: FontWeight.bold,
                //             fontSize: 19,
                //             textAlign: TextAlign.center,
                //           ),
                //           CustomText(
                //             title:
                //                 'On the other hand,we denounce with righteous\nindignation and dislike men beguiled the foresee\nthepain and trouble',
                //             color: Colors.white,
                //             textAlign: TextAlign.center,
                //             fontWeight: FontWeight.w500,
                //             fontSize: 13,
                //           ),
                //           const SizedBox(
                //             height: 10,
                //           ),
                //           Container(
                //             width: MediaQuery.of(context).size.width - 6,
                //             child: Padding(
                //               padding:
                //                   const EdgeInsets.symmetric(horizontal: 18.0),
                //               child: Row(
                //                 mainAxisSize: MainAxisSize.min,
                //                 children: [
                //                   Expanded(
                //                     child: SizedBox(
                //                       height: 45,
                //                       child: CustomTextField(
                //                         //controller: emailController,
                //                         keyboardType: TextInputType.text,
                //                         //textInputAction: TextInputAction.done,
                //                         isOutlineInputBorder: true,
                //                         isOutlineInputBorderColor: greyColor,
                //                         onChanged: (_) {},
                //                         hintText: "Search",
                //                         hintWeight: FontWeight.w700,
                //                         hintTextColor: Colors.white,
                //                         hintFontSize: 15,
                //                         fieldborderRadius: 7,
                //                         outlineBottomLeftRadius: 30,
                //                         outlineTopRightRadius: 30,
                //                         outlineTopLeftRadius: 30,
                //                         outlineBottomRightRadius: 30,
                //                         contentPaddingBottom: 0,
                //                         isFilled: true,
                //                         textFieldFillColor:
                //                             Colors.white.withOpacity(0.2),
                //                         suffixIcon: Image.asset(
                //                           "assets/icons/search.png",
                //                           color: Colors.white,
                //                         ),
                //                       ),
                //                     ),
                //                   ),
                //                 ],
                //               ),
                //             ),
                //           ),
                //         ],
                //       ),
                //     ),
                //   ]),
                // ),
                const SizedBox(
                  height: 15,
                ),
                Container(
                  height: 50,
                  padding: EdgeInsets.symmetric(horizontal: 18),
                  alignment: Alignment.centerLeft,
                  child: CustomText(
                    title: "We provide best podcosts",
                    fontSize: 15,
                    color: blackColor,
                  ),
                ),
                //Space
                SizedBox(
                  height: 8,
                ),
                //
                Container(
                    padding: EdgeInsets.symmetric(horizontal: 18),
                    child: CustomTextField(
                      //controller: emailController,
                      keyboardType: TextInputType.text,
                      //textInputAction: TextInputAction.done,
                      isOutlineInputBorder: true,
                      isOutlineInputBorderColor: greyColor,
                      onChanged: (_) {},
                      hintText: "Search",
                      hintFontSize: 13,
                      fieldborderRadius: 7,
                      outlineBottomLeftRadius: 6,
                      outlineTopRightRadius: 6,
                      outlineTopLeftRadius: 6,
                      outlineBottomRightRadius: 6,
                      textFieldFillColor: whiteColor,
                      suffixIcon: Image.asset("assets/icons/search.png"),
                    )),
                //Space
                SizedBox(
                  height: 20,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 18.0),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          CustomText(
                            title: "On Trending",
                            fontSize: 16,
                            color: blackColor,
                            fontWeight: FontWeight.w600,
                          ),
                          GestureDetector(
                            onTap: () {
                              // Add your action here
                            },
                            child: Row(
                              children: [
                                CustomText(
                                  title: 'View All',
                                  fontSize: 15,
                                  color: blueColor,
                                  fontWeight: FontWeight.w600,
                                ),
                                const SizedBox(
                                  width: 2,
                                ),
                                Icon(
                                  Icons.arrow_forward_ios,
                                  color: blueColor,
                                  size: 14,
                                ),
                              ],
                            ),
                          ),
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
                          itemCount:
                              5, // Replace with the actual number of items in your list
                          itemBuilder: (context, index) {
                            return Container(
                              width: 290,
                              margin: EdgeInsets.only(right: 10),
                              padding: EdgeInsets.fromLTRB(16, 12, 8, 10),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(15),
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
                                                'Quick meditaion-\nMeditate with me',
                                            fontSize: 13,
                                            color: blackColor,
                                            fontWeight: FontWeight.bold,
                                          ),
                                          SizedBox(height: 15),
                                          Text(
                                            'By Benjamin\nEpisode 03',
                                            style: TextStyle(
                                                fontSize: 12,
                                                color: textGreyColor2,
                                                fontWeight: FontWeight.bold),
                                          ),
                                          SizedBox(height: 8),
                                          Text(
                                            '5 min',
                                            style: TextStyle(
                                              fontSize: 12,
                                              fontWeight: FontWeight.w500,
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
                                              BorderRadius.circular(8),
                                          image: DecorationImage(
                                            image: AssetImage(
                                              'assets/icons/image_01.png', // Replace with your image URL
                                            ),
                                            fit: BoxFit.cover,
                                          ),
                                        ),
                                        clipBehavior: Clip.hardEdge,
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
                            );
                          },
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
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
                                title: "Listen to the favourite Podcast",
                                fontSize: 12,
                                color: textGreyColor2,
                                fontWeight: FontWeight.w600,
                              ),
                            ],
                          ),
                          GestureDetector(
                            onTap: () {
                              // Add your action here
                            },
                            child: Row(
                              children: [
                                CustomText(
                                  title: 'View All',
                                  fontSize: 15,
                                  color: blueColor,
                                  fontWeight: FontWeight.w600,
                                ),
                                const SizedBox(
                                  width: 2,
                                ),
                                Icon(
                                  Icons.arrow_forward_ios,
                                  color: blueColor,
                                  size: 14,
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      Container(
                        height: 30,
                        child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: 5,
                          itemBuilder: (context, index) {
                            return Container(
                              margin: EdgeInsets.only(right: 8),
                              child: CustomInkWell(
                                onTap: () {
                                  mindfulProvider.onChangeWeekPodcast(index);
                                },
                                child: Container(
                                  width: 75,
                                  alignment: Alignment.center,
                                  decoration: BoxDecoration(
                                    border: Border.all(
                                      color: Colors.grey,
                                      width: 1,
                                    ),
                                    borderRadius: BorderRadius.circular(4),
                                    color:
                                        mindfulProvider.selectedWeekPodcast ==
                                                index
                                            ? kPrimaryColor
                                            : Colors.transparent,
                                  ),
                                  child: Text(
                                    getButtonTitle(index),
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
                      // mindfulProvider.selectedWeekPodcast == 0
                      //     ? AngryTab()
                      //     : mindfulProvider.selectedWeekPodcast == 1
                      //         ? GratefulTab()
                      //         : mindfulProvider.selectedWeekPodcast == 2
                      //             ? AnxietyTab()
                      //             : mindfulProvider.selectedWeekPodcast == 3
                      //                 ? HappyTab()
                      //                 : SadTab()
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      }),
    );
  }
}
