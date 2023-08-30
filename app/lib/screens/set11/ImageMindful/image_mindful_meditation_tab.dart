import 'package:flutter/material.dart';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wellbe/utilites/colors.dart';
import 'package:wellbe/widgets/custom_parent_widget.dart';
import 'package:wellbe/widgets/custom_text.dart';

import '../../../models/CustomModels/custom_model.dart';
import '../../../provider/mindful_provider.dart';
import '../../../utilites/helper.dart';
import '../../../widgets/custom_inkwell_btn.dart';
import '../../../widgets/custom_textfield.dart';
import '../../homepage/MIndFul/explore_screen.dart';
import '../../homepage/MoodSpace/academic_screen.dart';

class ImageMindfulMeditationTab extends StatelessWidget {
  const ImageMindfulMeditationTab({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<MoodSpaceProvider>(
        builder: (context, mindfulProvider, child) {
      return SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: 15,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 18.0),
              child: Row(
                children: [
                  Expanded(
                    child: CustomText(
                      title:
                          "Welcome to WellBe Meditation,\nYour guide to find inner peace and\nemotional balance",
                      color: blackColor,
                      fontSize: 15,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 20,
            ),

            //
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 18.0),
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
              ),
            ),
            //Space
            SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 18.0),
              child: CustomText(
                title: 'Explore by Emotions',
                fontWeight: FontWeight.bold,
                color: blackColor,
                fontSize: 18,
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
                          padding: EdgeInsets.symmetric(
                              horizontal: 10, vertical: 10),
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
              child: CustomText(
                title: 'Explore by Thoughts',
                fontWeight: FontWeight.bold,
                color: blackColor,
                fontSize: 18,
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
                          padding: EdgeInsets.symmetric(
                              horizontal: 10, vertical: 10),
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
              child: CustomText(
                title: 'Explore by  Everyday Challenges',
                fontWeight: FontWeight.bold,
                color: blackColor,
                fontSize: 18,
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
                          padding: EdgeInsets.symmetric(
                              horizontal: 10, vertical: 10),
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
              child: CustomText(
                title: 'Explore by Techniques',
                fontWeight: FontWeight.bold,
                color: blackColor,
                fontSize: 18,
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
                          padding: EdgeInsets.symmetric(
                              horizontal: 10, vertical: 10),
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
    });
  }
}
