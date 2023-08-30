import 'package:flutter/material.dart';
import 'package:persistent_bottom_nav_bar_v2/persistent-tab-view.dart';
import 'package:provider/provider.dart';
import 'package:wellbe/provider/mindful_provider.dart';
import 'package:wellbe/screens/homepage/MoodSpace/academic_screen.dart';
import 'package:wellbe/screens/homepage/Recomendation/recomendation_screen.dart';

import '../../../../models/CustomModels/custom_model.dart';
import '../../../../provider/ThoughtProvider/thought_provider.dart';
import '../../../../utilites/colors.dart';
import '../../../../utilites/helper.dart';
import '../../../../utilites/string_utils.dart';
import '../../../../widgets/custom_cached_network_image.dart';
import '../../../../widgets/custom_inkwell_btn.dart';
import '../../../../widgets/custom_loader.dart';
import '../../../../widgets/custom_text.dart';
import '../../../../widgets/error_text_widget.dart';
import '../../QuickMeditation/quick_meditation_screen.dart';
import '../academic_audio_done.dart';

class DisgustingTab extends StatefulWidget {
  const DisgustingTab({super.key, required this.index});

  @override
  State<DisgustingTab> createState() => _DisgustingTabState();
  final int index;
}

class _DisgustingTabState extends State<DisgustingTab> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Provider.of<ThoughtProvider>(context, listen: false)
        .getThoughtsByCategory(widget.index, (status) {}, context);
  }

  @override
  Widget build(BuildContext context) {
    return Consumer2<MoodSpaceProvider, ThoughtProvider>(
        builder: (context, moodSpaceProvider, thoughtProvider, child) {
      return thoughtProvider.isLoading
          ? Center(
              child: Column(
                children: [
                  const SizedBox(
                    height: 55,
                  ),
                  CustomLoader(),
                ],
              ),
            )
          : !thoughtProvider.isLoading2 &&
                  thoughtProvider.getThoughtsByCategoryModel.length == 0
              ? Column(
                  children: [
                    const SizedBox(
                      height: 55,
                    ),
                    ErrorTextWidget(),
                  ],
                )
              : Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const SizedBox(
                      height: 14,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 18.0),
                      child: CustomText(
                        title:
                            '${thoughtProvider.getThoughtsByCategoryModel[0].title}',
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        color: blackColor,
                      ),
                    ),
                    const SizedBox(
                      height: 14,
                    ),
                    ListView.builder(
                        itemCount:
                            thoughtProvider.getThoughtsByCategoryModel.length,
                        shrinkWrap: true,
                        padding:
                            EdgeInsets.only(bottom: 80, left: 18, right: 18),
                        physics: NeverScrollableScrollPhysics(),
                        itemBuilder: (context, index) {
                          final thought =
                              thoughtProvider.getThoughtsByCategoryModel[index];
                          return Container(
                            padding: EdgeInsets.only(bottom: 10),
                            child: CustomInkWell(
                              onTap: () {
                                moodSpaceProvider.thoughtPageChange(true);
                                Helper.toScreen(
                                    context,
                                    AcademicAudioDoneScreen(
                                      thoughtId: thought.id.toString(),
                                      description:
                                          thought.description.toString(),
                                      fileType: thought.fileType.toString(),
                                      title: thought.title.toString(),
                                      url: thought.audioVideo.toString(),
                                    ));
                              },
                              child: Container(
                                padding: EdgeInsets.symmetric(
                                    horizontal: 10, vertical: 10),
                                decoration: BoxDecoration(
                                    color: Color(0xFFe2f2ff),
                                    borderRadius: BorderRadius.circular(8)),
                                child: Row(
                                  children: [
                                    Stack(
                                      alignment: Alignment.center,
                                      children: [
                                        Container(
                                          width: 80,
                                          height: 80,
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(8),
                                          ),
                                          clipBehavior: Clip.hardEdge,
                                          child: Image.asset(
                                            '${journalList[0].img}',
                                            fit: BoxFit.cover,
                                          ),
                                        ),
                                        Positioned(
                                            child: thought.fileType!
                                                    .contains('Audio')
                                                ? Image.asset(
                                                    '${meditationList[1].icon}')
                                                : Image.asset(
                                                    '${meditationList[0].icon}')),
                                      ],
                                    ),
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
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            CustomText(
                                              title: "${thought.title}",
                                              fontSize: 12.5,
                                              color: blackColor,
                                              fontWeight: FontWeight.w700,
                                            ),
                                            CustomText(
                                              title: "6 min",
                                              fontSize: 12.5,
                                              color: greyColor,
                                              fontWeight: FontWeight.w500,
                                            ),
                                          ],
                                        ),
                                        //Space
                                        SizedBox(
                                          height: 6,
                                        ),
                                        CustomText(
                                          title: removeHtmlTags(
                                              thought.description.toString()),
                                          fontSize: 12,
                                          color: textGreyColor2,
                                          //fontWeight: FontWeight.w700,
                                        ),
                                      ],
                                    )),
                                    //Space
                                    SizedBox(
                                      width: 12,
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          );
                        }),
                  ],
                );
    });
  }
}
