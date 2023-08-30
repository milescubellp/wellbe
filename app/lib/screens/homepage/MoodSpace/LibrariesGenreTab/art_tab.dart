import 'package:flutter/material.dart';
import 'package:wellbe/screens/homepage/MoodSpace/saerch_screen.dart';

import '../../../../models/CustomModels/custom_model.dart';
import '../../../../utilites/colors.dart';
import '../../../../utilites/helper.dart';
import '../../../../widgets/custom_inkwell_btn.dart';
import '../../../../widgets/custom_text.dart';
import '../../MIndFul/explore_screen.dart';
import '../all_recommended.dart';

class ArtTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(
            height: 15,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 18.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    CustomText(
                      title: 'Explore by Emotions',
                      fontWeight: FontWeight.bold,
                      color: blackColor,
                      fontSize: 17.5,
                    ),
                    GestureDetector(
                      onTap: () {
                        // Add your action here
                        Helper.toScreen(context, SearchScreen());
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
                  height: 5,
                ),
                CustomText(
                  title:
                      "Discover a wide  range of guided meditations tailored\nto navigate life's emotional landscape",
                  fontWeight: FontWeight.w600,
                  color: textGreyColor2,
                  fontSize: 12,
                ),
              ],
            ),
          ),
          SizedBox(
            height: 15,
          ),
          Container(
            height: 140,
            child: ListView.builder(
                padding: EdgeInsets.only(left: 18),
                itemCount: journalList.length,
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                physics: ClampingScrollPhysics(),
                itemBuilder: (context, index) {
                  return Container(
                    padding: EdgeInsets.only(bottom: 10),
                    child: CustomInkWell(
                      onTap: () {
                        Helper.toScreen(context, ExploreScreen());
                      },
                      child: Container(
                        padding:
                            EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                        margin: EdgeInsets.only(right: 10),
                        decoration: BoxDecoration(
                            color: Color(0xFFe2f2ff),
                            border: Border.all(color: darkGreyColor),
                            borderRadius: BorderRadius.circular(8)),
                        child: Row(
                          children: [
                            const SizedBox(
                              width: 10,
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                CustomText(
                                  title: "Transforming\nAnger",
                                  fontSize: 14.5,
                                  color: blackColor,
                                  fontWeight: FontWeight.w600,
                                ),
                                //Space
                                SizedBox(
                                  height: 30,
                                ),
                                CustomText(
                                  title: "Episode 04",
                                  fontSize: 12,
                                  color: blackColor,
                                  //fontWeight: FontWeight.w700,
                                ),

                                //Space
                                SizedBox(
                                  height: 6,
                                ),
                                CustomText(
                                  title: "26 min",
                                  fontSize: 12,
                                  color: greyColor,
                                  //fontWeight: FontWeight.w700,
                                ),
                              ],
                            ),
                            const SizedBox(
                              width: 70,
                            ),
                            Container(
                              width: 90,
                              height: 120,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(5),
                                  image: DecorationImage(
                                      fit: BoxFit.cover,
                                      image: AssetImage(
                                          "${meditationList[index].img}"))),
                              clipBehavior: Clip.hardEdge,
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                }),
          ),
          SizedBox(
            height: 20,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 18.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    CustomText(
                      title: 'Explore by Thoughts',
                      fontWeight: FontWeight.bold,
                      color: blackColor,
                      fontSize: 17.5,
                    ),
                    GestureDetector(
                      onTap: () {
                        // Add your action here
                        Helper.toScreen(context, SearchScreen());
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
                  height: 5,
                ),
                CustomText(
                  title:
                      "Embark on a tranformative journey through our\nthought-focused meditation",
                  fontWeight: FontWeight.w600,
                  color: textGreyColor2,
                  fontSize: 12,
                ),
              ],
            ),
          ),
          SizedBox(
            height: 15,
          ),
          Container(
            height: 140,
            child: ListView.builder(
                padding: const EdgeInsets.only(left: 18.0),
                itemCount: journalList.length,
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                physics: ClampingScrollPhysics(),
                itemBuilder: (context, index) {
                  return Container(
                    padding: EdgeInsets.only(bottom: 10),
                    child: CustomInkWell(
                      onTap: () {
                        Helper.toScreen(context, ExploreScreen());
                      },
                      child: Container(
                        padding:
                            EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                        margin: EdgeInsets.only(right: 10),
                        decoration: BoxDecoration(
                            color: Color(0xFFdaedd9),
                            border: Border.all(color: darkGreyColor),
                            borderRadius: BorderRadius.circular(8)),
                        child: Row(
                          children: [
                            const SizedBox(
                              width: 10,
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                CustomText(
                                  title: "Restore Your\ntrueself",
                                  fontSize: 14.5,
                                  color: blackColor,
                                  fontWeight: FontWeight.w600,
                                ),
                                //Space
                                SizedBox(
                                  height: 30,
                                ),
                                CustomText(
                                  title: "Episode 04",
                                  fontSize: 12,
                                  color: blackColor,
                                  //fontWeight: FontWeight.w700,
                                ),

                                //Space
                                SizedBox(
                                  height: 6,
                                ),
                                CustomText(
                                  title: "26 min",
                                  fontSize: 12,
                                  color: greyColor,
                                  //fontWeight: FontWeight.w700,
                                ),
                              ],
                            ),
                            const SizedBox(
                              width: 70,
                            ),
                            Container(
                              width: 90,
                              height: 120,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(5),
                                  image: DecorationImage(
                                      fit: BoxFit.cover,
                                      image: AssetImage(
                                          "${meditationList[index].img}"))),
                              clipBehavior: Clip.hardEdge,
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                }),
          ),
          SizedBox(
            height: 20,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 18.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    CustomText(
                      title: 'Explore by  Everyday\nChallenges',
                      fontWeight: FontWeight.bold,
                      color: blackColor,
                      fontSize: 17.5,
                    ),
                    GestureDetector(
                      onTap: () {
                        // Add your action here
                        Helper.toScreen(context, SearchScreen());
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
                  height: 5,
                ),
                CustomText(
                  title:
                      "Embark on a Mindful Quest,unlock the power of\ntransformative meditation techniques tailored\nto various aspects of your life",
                  fontWeight: FontWeight.w600,
                  color: textGreyColor2,
                  fontSize: 12,
                ),
              ],
            ),
          ),
          SizedBox(
            height: 15,
          ),
          Container(
            height: 140,
            child: ListView.builder(
                padding: const EdgeInsets.only(left: 18.0),
                itemCount: journalList.length,
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                physics: ClampingScrollPhysics(),
                itemBuilder: (context, index) {
                  return Container(
                    padding: EdgeInsets.only(bottom: 10),
                    child: CustomInkWell(
                      onTap: () {
                        Helper.toScreen(context, ExploreScreen());
                      },
                      child: Container(
                        padding:
                            EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                        margin: EdgeInsets.only(right: 10),
                        decoration: BoxDecoration(
                            color: Color(0xFFffffd8),
                            border: Border.all(color: darkGreyColor),
                            borderRadius: BorderRadius.circular(8)),
                        child: Row(
                          children: [
                            const SizedBox(
                              width: 10,
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                CustomText(
                                  title: "Enhance focus\nand Concentration",
                                  fontSize: 14.5,
                                  color: blackColor,
                                  fontWeight: FontWeight.w600,
                                ),
                                //Space
                                SizedBox(
                                  height: 30,
                                ),
                                CustomText(
                                  title: "Episode 04",
                                  fontSize: 12,
                                  color: blackColor,
                                  //fontWeight: FontWeight.w700,
                                ),

                                //Space
                                SizedBox(
                                  height: 6,
                                ),
                                CustomText(
                                  title: "26 min",
                                  fontSize: 12,
                                  color: greyColor,
                                  //fontWeight: FontWeight.w700,
                                ),
                              ],
                            ),
                            const SizedBox(
                              width: 70,
                            ),
                            Container(
                              width: 90,
                              height: 120,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(5),
                                  image: DecorationImage(
                                      fit: BoxFit.cover,
                                      image: AssetImage(
                                          "${meditationList[index].img}"))),
                              clipBehavior: Clip.hardEdge,
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                }),
          ),
          SizedBox(
            height: 20,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 18.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        CustomText(
                          title: 'Explore by Techniques',
                          fontWeight: FontWeight.bold,
                          color: blackColor,
                          fontSize: 17.5,
                        ),
                        CustomText(
                          title: 'For Beginner',
                          fontWeight: FontWeight.w700,
                          color: greyColor,
                          fontSize: 12.5,
                        ),
                      ],
                    ),
                    GestureDetector(
                      onTap: () {
                        // Add your action here
                        Helper.toScreen(context, SearchScreen());
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
                  height: 5,
                ),
                CustomText(
                  title:
                      "Embark on an Inner Jounrey to  nourish and elevate\ndifferent aspects of your being",
                  fontWeight: FontWeight.w600,
                  color: textGreyColor2,
                  fontSize: 12,
                ),
              ],
            ),
          ),
          SizedBox(
            height: 5,
          ),
          Container(
            height: 140,
            child: ListView.builder(
                padding: const EdgeInsets.only(left: 18.0),
                itemCount: journalList.length,
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                physics: ClampingScrollPhysics(),
                itemBuilder: (context, index) {
                  return Container(
                    padding: EdgeInsets.only(bottom: 10),
                    child: CustomInkWell(
                      onTap: () {
                        Helper.toScreen(context, ExploreScreen());
                      },
                      child: Container(
                        padding:
                            EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                        margin: EdgeInsets.only(right: 10),
                        decoration: BoxDecoration(
                            color: Color(0xFFfedcdc),
                            border: Border.all(color: darkGreyColor),
                            borderRadius: BorderRadius.circular(8)),
                        child: Row(
                          children: [
                            const SizedBox(
                              width: 10,
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                CustomText(
                                  title: "Grounding\nMeditation",
                                  fontSize: 14.5,
                                  color: blackColor,
                                  fontWeight: FontWeight.w600,
                                ),
                                //Space
                                SizedBox(
                                  height: 30,
                                ),
                                CustomText(
                                  title: "Episode 04",
                                  fontSize: 12,
                                  color: blackColor,
                                  //fontWeight: FontWeight.w700,
                                ),

                                //Space
                                SizedBox(
                                  height: 6,
                                ),
                                CustomText(
                                  title: "26 min",
                                  fontSize: 12,
                                  color: greyColor,
                                  //fontWeight: FontWeight.w700,
                                ),
                              ],
                            ),
                            const SizedBox(
                              width: 70,
                            ),
                            Container(
                              width: 90,
                              height: 120,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(5),
                                  image: DecorationImage(
                                      fit: BoxFit.cover,
                                      image: AssetImage(
                                          "${meditationList[index].img}"))),
                              clipBehavior: Clip.hardEdge,
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                }),
          ),
          SizedBox(
            height: 20,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 18.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        CustomText(
                          title: 'Explore by Techniques',
                          fontWeight: FontWeight.bold,
                          color: blackColor,
                          fontSize: 17.5,
                        ),
                        CustomText(
                          title: 'For Intermediate',
                          fontWeight: FontWeight.w700,
                          color: greyColor,
                          fontSize: 12.5,
                        ),
                      ],
                    ),
                    GestureDetector(
                      onTap: () {
                        // Add your action here
                        Helper.toScreen(context, SearchScreen());
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
                  height: 5,
                ),
                CustomText(
                  title:
                      "Embark on an Inner Jounrey to  nourish and elevate\ndifferent aspects of your being",
                  fontWeight: FontWeight.w600,
                  color: textGreyColor2,
                  fontSize: 12,
                ),
              ],
            ),
          ),
          SizedBox(
            height: 5,
          ),
          Container(
            height: 140,
            child: ListView.builder(
                padding: const EdgeInsets.only(left: 18.0),
                itemCount: journalList.length,
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                physics: ClampingScrollPhysics(),
                itemBuilder: (context, index) {
                  return Container(
                    padding: EdgeInsets.only(bottom: 10),
                    child: CustomInkWell(
                      onTap: () {
                        Helper.toScreen(context, ExploreScreen());
                      },
                      child: Container(
                        padding:
                            EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                        margin: EdgeInsets.only(right: 10),
                        decoration: BoxDecoration(
                            color: Color(0xFFfedcdc),
                            border: Border.all(color: darkGreyColor),
                            borderRadius: BorderRadius.circular(8)),
                        child: Row(
                          children: [
                            const SizedBox(
                              width: 10,
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                CustomText(
                                  title: "Grounding\nMeditation",
                                  fontSize: 14.5,
                                  color: blackColor,
                                  fontWeight: FontWeight.w600,
                                ),
                                //Space
                                SizedBox(
                                  height: 30,
                                ),
                                CustomText(
                                  title: "Episode 04",
                                  fontSize: 12,
                                  color: blackColor,
                                  //fontWeight: FontWeight.w700,
                                ),

                                //Space
                                SizedBox(
                                  height: 6,
                                ),
                                CustomText(
                                  title: "26 min",
                                  fontSize: 12,
                                  color: greyColor,
                                  //fontWeight: FontWeight.w700,
                                ),
                              ],
                            ),
                            const SizedBox(
                              width: 70,
                            ),
                            Container(
                              width: 90,
                              height: 120,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(5),
                                  image: DecorationImage(
                                      fit: BoxFit.cover,
                                      image: AssetImage(
                                          "${meditationList[index].img}"))),
                              clipBehavior: Clip.hardEdge,
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                }),
          ),
          const SizedBox(
            height: 80,
          ),
        ],
      ),
    );
  }
}
