import 'package:flutter/material.dart';
import 'package:persistent_bottom_nav_bar_v2/persistent-tab-view.dart';
import 'package:provider/provider.dart';
import 'package:wellbe/provider/mindful_provider.dart';
import 'package:wellbe/screens/homepage/VentOut/my_post.dart';
import 'package:wellbe/screens/homepage/VentOut/write_your_post.dart';

import '../../../utilites/colors.dart';
import '../../../utilites/helper.dart';
import '../../../widgets/custom_inkwell_btn.dart';
import '../../../widgets/custom_parent_widget.dart';
import '../../../widgets/custom_text.dart';
import 'heading_form.dart';

class ForumTab extends StatelessWidget {
  int selectedIndex = 1;

  String getButtonTitle(int index) {
    switch (index) {
      case 0:
        return 'Anxiety';
      case 1:
        return 'Grateful';
      case 2:
        return 'Emotional';
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
        return SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 18.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        CustomText(
                          title: "Today's Trending",
                          fontSize: 16,
                          color: blackColor,
                          fontWeight: FontWeight.w600,
                        ),
                        const SizedBox(
                          height: 1.5,
                        ),
                        CustomText(
                          title: "Explore According toyour mood",
                          fontSize: 12,
                          color: textGreyColor2,
                          fontWeight: FontWeight.w600,
                        ),
                      ],
                    ),
                    GestureDetector(
                      onTap: () {
                        // Add your action here
                        Helper.toScreen(context, MyPost());
                      },
                      child: Row(
                        children: [
                          CustomText(
                            title: 'My Post',
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
              ),
              const SizedBox(
                height: 15,
              ),
              Container(
                height: 30,
                child: ListView.builder(
                  padding: EdgeInsets.only(left: 18),
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
                            color: mindfulProvider.selectedWeekPodcast == index
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
                height: 18,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 18.0),
                child: CustomInkWell(
                  onTap: () {
                    pushNewScreen(context,
                        screen: WriteYourPost(), withNavBar: false);
                  },
                  child: Container(
                    padding: EdgeInsets.all(12),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(color: mediumGreyColor)),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            CustomText(
                              title: "Write A Post",
                              fontSize: 16,
                              color: blackColor,
                              fontWeight: FontWeight.w600,
                            ),
                            const SizedBox(
                              height: 1.5,
                            ),
                            CustomText(
                              title:
                                  "If you use this site regularly would like",
                              fontSize: 10.5,
                              color: textGreyColor2,
                              fontWeight: FontWeight.w600,
                            ),
                          ],
                        ),
                        GestureDetector(
                          onTap: () {
                            // Add your action here

                            // Helper.toScreen(context, WriteYourPost());
                          },
                          child: Image.asset(
                            'assets/icons/post_01.png',
                            scale: 1.1,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 13,
              ),
              ListView.builder(
                  itemCount: 3,
                  shrinkWrap: true,
                  padding: EdgeInsets.symmetric(horizontal: 18),
                  physics: NeverScrollableScrollPhysics(),
                  itemBuilder: (context, index) {
                    return Container(
                      padding: EdgeInsets.only(bottom: 10),
                      child: CustomInkWell(
                        onTap: () {
                          pushNewScreen(context,
                              screen: HeadingForm(), withNavBar: false);
                        },
                        child: Container(
                          padding: EdgeInsets.symmetric(
                              horizontal: 11, vertical: 14),
                          decoration: BoxDecoration(
                              color: Color(0xFFe2f2ff),
                              border: Border.all(color: darkGreyColor),
                              borderRadius: BorderRadius.circular(8)),
                          child: Row(
                            children: [
                              Expanded(
                                  child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  CustomText(
                                    title: "Heading Forum ${index + 1}",
                                    fontSize: 14.5,
                                    color: blackColor,
                                    fontWeight: FontWeight.w700,
                                  ),
                                  //Space
                                  SizedBox(
                                    height: 6,
                                  ),
                                  CustomText(
                                    title:
                                        "There are many variations which don't look\neven and to a but the majority",
                                    fontSize: 12,
                                    color: textGreyColor2,
                                    fontWeight: FontWeight.w700,
                                  ),

                                  //Space
                                  SizedBox(
                                    height: 6,
                                  ),
                                  CustomText(
                                    title:
                                        "28 April 2023 | 10 mins ago | By Benjamin",
                                    fontSize: 12,
                                    color: greyColor,
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
              const SizedBox(
                height: 70,
              ),
            ],
          ),
        );
      }),
    );
  }
}
