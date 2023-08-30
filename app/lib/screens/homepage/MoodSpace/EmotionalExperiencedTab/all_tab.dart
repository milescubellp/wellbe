import 'package:flutter/material.dart';
import 'package:persistent_bottom_nav_bar_v2/persistent-tab-view.dart';
import 'package:provider/provider.dart';
import 'package:wellbe/provider/mindful_provider.dart';
import 'package:wellbe/screens/homepage/MoodSpace/academic_audio_done.dart';
import 'package:wellbe/screens/homepage/MoodSpace/all_recommended.dart';
import 'package:wellbe/screens/homepage/Recomendation/recomendation_screen.dart';
import 'package:wellbe/utilites/string_utils.dart';
import 'package:wellbe/widgets/error_text_widget.dart';

import '../../../../models/CustomModels/custom_model.dart';
import '../../../../provider/ThoughtProvider/thought_provider.dart';
import '../../../../utilites/colors.dart';
import '../../../../utilites/helper.dart';
import '../../../../widgets/custom_inkwell_btn.dart';
import '../../../../widgets/custom_loader.dart';
import '../../../../widgets/custom_text.dart';
import '../academic_screen.dart';

class AllTab extends StatefulWidget {
  @override
  State<AllTab> createState() => _AllTabState();
}

class _AllTabState extends State<AllTab> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Provider.of<ThoughtProvider>(context, listen: false)
        .getThoughts((status) {}, context);
  }

  @override
  Widget build(BuildContext context) {
    return Consumer2<MoodSpaceProvider, ThoughtProvider>(
        builder: (context, moodSpaceProvider, thoughtProvider, child) {
      return thoughtProvider.isLoading2
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
                  thoughtProvider.getThoughtModel.length == 0
              ? Column(
                  children: [
                    const SizedBox(
                      height: 55,
                    ),
                    ErrorTextWidget(),
                  ],
                )
              : ListView.builder(
                  padding: const EdgeInsets.only(
                      left: 18.0, right: 18.0, bottom: 80),
                  itemCount: thoughtProvider.getThoughtModel.length,
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  itemBuilder: (context, index) {
                    final getThought = thoughtProvider.getThoughtModel[index];
                    return Container(
                      padding: EdgeInsets.only(bottom: 10),
                      child: CustomInkWell(
                        onTap: () {
                          // pushNewScreen(context,
                          //     screen: AcademicScreen(), withNavBar: false);
                          moodSpaceProvider.thoughtPageChange(true);
                          Helper.toScreen(
                              context,
                              AcademicAudioDoneScreen(
                                description: getThought.description.toString(),
                                title: getThought.title.toString(),
                                fileType: getThought.fileType.toString(),
                                url: getThought.audioVideo.toString(),
                                thoughtId: getThought.id.toString(),
                              ));
                        },
                        child: Container(
                          padding: EdgeInsets.symmetric(
                              horizontal: 10, vertical: 10),
                          decoration: BoxDecoration(
                              color: journalList[0].color,
                              border: Border.all(color: darkGreyColor),
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
                                            "${meditationList[0].img}"))),
                                clipBehavior: Clip.hardEdge,
                                child: getThought.fileType!.contains('Audio')
                                    ? Image.asset(
                                        meditationList[1].icon.toString())
                                    : Image.asset(
                                        meditationList[0].icon.toString()),
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
                                    title: "${getThought.title}",
                                    fontSize: 14.5,
                                    color: blackColor,
                                    fontWeight: FontWeight.w600,
                                  ),
                                  //Space
                                  SizedBox(
                                    height: 6,
                                  ),
                                  CustomText(
                                    title: removeHtmlTags(
                                        getThought.description.toString()),
                                    fontSize: 12,
                                    color: blackColor,
                                    //fontWeight: FontWeight.w700,
                                  ),

                                  //Space
                                  SizedBox(
                                    height: 6,
                                  ),
                                  CustomText(
                                    title: "0${index + 1} Steps",
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
                  });
    });
  }
}
