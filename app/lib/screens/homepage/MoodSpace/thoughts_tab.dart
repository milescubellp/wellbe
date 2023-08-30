import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wellbe/utilites/colors.dart';
import 'package:wellbe/widgets/custom_parent_widget.dart';
import 'package:wellbe/widgets/custom_text.dart';

import '../../../models/CustomModels/custom_model.dart';
import '../../../provider/ThoughtProvider/thought_provider.dart';
import '../../../provider/mindful_provider.dart';
import '../../../utilites/helper.dart';
import '../../../widgets/custom_inkwell_btn.dart';
import '../../../widgets/custom_loader.dart';
import 'EmotionalExperiencedTab/disgusting_tab.dart';
import 'EmotionalExperiencedTab/all_tab.dart';
import 'EmotionalExperiencedTab/angry_thought.dart';
import 'EmotionalExperiencedTab/fear_thought_tab.dart';
import 'EmotionalExperiencedTab/happy_thought_tab.dart';
import 'EmotionalExperiencedTab/sad_thought_tab.dart';
import 'academic_screen.dart';
import 'my_daily_journal_screen.dart';

class ThoughtsTab extends StatefulWidget {
  const ThoughtsTab({Key? key}) : super(key: key);

  @override
  State<ThoughtsTab> createState() => _ThoughtsTabState();
}

class _ThoughtsTabState extends State<ThoughtsTab> {
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
  void initState() {
    super.initState();

    Provider.of<ThoughtProvider>(context, listen: false).getThoughtCategory(
      (status) {},
      context,
    );
    Provider.of<ThoughtProvider>(context, listen: false)
        .getThoughts((status) {}, context, isFirstTime: true);
  }

  @override
  Widget build(BuildContext context) {
    return CustomParentWidget(
      child: Consumer2<MoodSpaceProvider, ThoughtProvider>(
          builder: (context, mindfulProvider, thoughtProvider, child) {
        return thoughtProvider.isLoading
            ? Center(
                child: CustomLoader(),
              )
            : SingleChildScrollView(
                child: SizedBox(
                  child: Column(
                    children: [
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
                            itemCount:
                                thoughtProvider.getThoughtCategoryModel.length +
                                    1,
                            itemBuilder: (context, index) {
                              if (index == 0) {
                                return GestureDetector(
                                  onTap: () {
                                    mindfulProvider
                                        .onEmotionalExperienceChange(-1);
                                  },
                                  child: Container(
                                    padding: EdgeInsetsDirectional.symmetric(
                                        horizontal: 12),
                                    alignment: Alignment.center,
                                    margin: EdgeInsets.only(right: 8),
                                    decoration: BoxDecoration(
                                      border: Border.all(
                                        color: Colors.grey,
                                        width: 1,
                                      ),
                                      borderRadius: BorderRadius.circular(4),
                                      color: mindfulProvider
                                                  .selectEmotionalExprience ==
                                              -1
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
                              } else {
                                int dynamicIndex = index - 1;
                                debugPrint('dynamicindex:${dynamicIndex}');
                                return GestureDetector(
                                  onTap: () {
                                    mindfulProvider.onEmotionalExperienceChange(
                                        dynamicIndex);
                                  },
                                  child: Container(
                                    padding: EdgeInsetsDirectional.symmetric(
                                        horizontal: 12),
                                    alignment: Alignment.center,
                                    margin: EdgeInsets.only(right: 8),
                                    decoration: BoxDecoration(
                                      border: Border.all(
                                        color: Colors.grey,
                                        width: 1,
                                      ),
                                      borderRadius: BorderRadius.circular(4),
                                      color: dynamicIndex ==
                                              mindfulProvider
                                                  .selectEmotionalExprience
                                          ? kPrimaryColor
                                          : Colors.transparent,
                                    ),
                                    child: Text(
                                      thoughtProvider
                                          .getThoughtCategoryModel[dynamicIndex]
                                          .title
                                          .toString(),
                                      style: TextStyle(
                                        fontSize: 12,
                                        color: textGreyColor2,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                );
                              }
                            },
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      mindfulProvider.selectEmotionalExprience == -1
                          ? AllTab()
                          : mindfulProvider.selectEmotionalExprience == 0
                              ? DisgustingTab(
                                  index: thoughtProvider
                                      .getThoughtCategoryModel[0].id!
                                      .toInt(),
                                )
                              : mindfulProvider.selectEmotionalExprience == 1
                                  ? AngryThoughtTab(
                                      index: thoughtProvider
                                          .getThoughtCategoryModel[1].id!
                                          .toInt(),
                                    )
                                  : mindfulProvider.selectEmotionalExprience ==
                                          2
                                      ? FearThoughtTab(
                                          index: thoughtProvider
                                              .getThoughtCategoryModel[2].id!
                                              .toInt(),
                                        )
                                      : mindfulProvider
                                                  .selectEmotionalExprience ==
                                              3
                                          ? SadThoughtTab(
                                              index: thoughtProvider
                                                  .getThoughtCategoryModel[3]
                                                  .id!
                                                  .toInt(),
                                            )
                                          : HappyThoughtTab(
                                              index: thoughtProvider
                                                  .getThoughtCategoryModel[4]
                                                  .id!
                                                  .toInt(),
                                            )
                    ],
                  ),
                ),
              );
      }),
    );
  }
}
