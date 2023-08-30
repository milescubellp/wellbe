import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wellbe/utilites/colors.dart';
import 'package:wellbe/widgets/custom_parent_widget.dart';
import 'package:wellbe/widgets/custom_text.dart';

import '../../../models/CustomModels/custom_model.dart';
import '../../../provider/mindful_provider.dart';
import '../../../utilites/helper.dart';
import '../../../widgets/custom_inkwell_btn.dart';
import '../../homepage/MoodSpace/EmotionalExperiencedTab/disgusting_tab.dart';
import '../../homepage/MoodSpace/EmotionalExperiencedTab/all_tab.dart';
import '../../homepage/MoodSpace/EmotionalExperiencedTab/angry_thought.dart';
import '../../homepage/MoodSpace/EmotionalExperiencedTab/fear_thought_tab.dart';

class ImageThoughtsTab extends StatelessWidget {
  const ImageThoughtsTab({Key? key}) : super(key: key);
  String getButtonTitle(int index) {
    switch (index) {
      case 0:
        return 'All';
      case 1:
        return 'Academic';
      case 2:
        return 'Emotional';
      case 3:
        return 'Social';

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
          child: SizedBox(
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
                //             title: 'Thoughts',
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
                //                 'The wise man therefore always holds in\nthese matters to this principle of that he\nrejects else endures pains to avoid\nto the worse pains',
                //             color: Colors.white,
                //             textAlign: TextAlign.center,
                //             fontWeight: FontWeight.w500,
                //             fontSize: 11,
                //           ),
                //           const SizedBox(
                //             height: 10,
                //           ),
                //           Container(
                //             width: 40,
                //             height: 40,
                //             decoration: BoxDecoration(
                //                 shape: BoxShape.circle,
                //                 color: Colors.transparent),
                //             child: Icon(
                //               Icons.arrow_forward,
                //               color: Colors.transparent,
                //             ),
                //           ),
                //         ],
                //       ),
                //     )
                //   ]),
                // ),
                const SizedBox(
                  height: 12,
                ),
                const SizedBox(
                  height: 15,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 18.0),
                  child: Row(
                    children: [
                      CustomText(
                        title: "Select according to your mood",
                        fontSize: 14.7,
                        color: blackColor,
                        fontWeight: FontWeight.w600,
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 8,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 18.0),
                  child: Row(
                    children: [
                      Expanded(
                        child: CustomText(
                          title:
                              "The thoughts landing page in the app could be arranged into following categories for negative emotion experienced by Children's -Academic,Social & Emotional.Basesd on the thought's selected,the could recommend appopriate techniques to deal with negative thoughts.",
                          color: textGreyColor2,
                          fontSize: 12,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 18.0),
                  child: Container(
                    height: 30,
                    alignment: Alignment.centerLeft,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      padding: EdgeInsets.zero,
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      itemCount: 4,
                      itemBuilder: (context, index) {
                        return GestureDetector(
                          onTap: () {
                            mindfulProvider.onEmotionalExperienceChange(index);
                          },
                          child: Container(
                            padding:
                                EdgeInsetsDirectional.symmetric(horizontal: 12),
                            alignment: Alignment.center,
                            margin: EdgeInsets.only(right: 8),
                            decoration: BoxDecoration(
                              border: Border.all(
                                color: Colors.grey,
                                width: 1,
                              ),
                              borderRadius: BorderRadius.circular(4),
                              color: index ==
                                      mindfulProvider.selectEmotionalExprience
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
                        );
                      },
                    ),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                // mindfulProvider.selectEmotionalExprience == 0
                //     ? AllTab()
                //     : mindfulProvider.selectEmotionalExprience == 1
                //         ? DisgustingTab()
                //         : mindfulProvider.selectEmotionalExprience == 2
                //             ? EmotionalTab()
                //             : SocialTab()
              ],
            ),
          ),
        );
      }),
    );
  }
}
