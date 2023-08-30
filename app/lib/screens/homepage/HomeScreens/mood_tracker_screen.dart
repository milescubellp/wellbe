import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wellbe/models/CustomModels/custom_model.dart';
import 'package:wellbe/models/GetAllSubMoodsModel/get_all_sub_moods_model.dart';
import 'package:wellbe/provider/MoodProvider/mood_provider.dart';
import 'package:wellbe/provider/homepage_provider.dart';
import 'package:wellbe/screens/homepage/Insight/insight_screen.dart';
import 'package:wellbe/screens/homepage/Recomendation/recomendation_screen.dart';
import 'package:wellbe/utilites/colors.dart';
import 'package:wellbe/utilites/string_utils.dart';
import 'package:wellbe/widgets/custom_button.dart';
import 'package:wellbe/widgets/custom_inkwell_btn.dart';
import 'package:wellbe/widgets/custom_parent_widget.dart';
import 'package:wellbe/widgets/custom_text.dart';
import 'package:wellbe/widgets/custom_textfield.dart';

import '../../../models/GetAllMoodsModel/get_all_moods_model.dart';
import '../../../provider/insight_provider.dart';
import '../../../utilites/helper.dart';
import '../../../widgets/custom_loader.dart';

class MoodTrackerScreen extends StatefulWidget {
  String? moodType;

  GetAllMoodsModel? getAllMoods;

  MoodTrackerScreen({this.getAllMoods, this.moodType, Key? key})
      : super(key: key);

  @override
  State<MoodTrackerScreen> createState() => _MoodTrackerScreenState();
}

class _MoodTrackerScreenState extends State<MoodTrackerScreen> {
  final formKey = GlobalKey<FormState>();
  final textEditingController = TextEditingController();
  init() async {
    await Provider.of<MoodProvider>(context, listen: false).getAllSubMoods(
        int.parse(widget.getAllMoods!.id.toString()), (status) {}, context);
    await Provider.of<MoodProvider>(context, listen: false).onChangeMood(
        Provider.of<MoodProvider>(context, listen: false)
            .getAllSubsMoodsModels[0]);
  }

  addMoodTracker(BuildContext context, MoodProvider moodProvider) {
    if (formKey.currentState!.validate()) {
      moodProvider.addMoodTracker(
          widget.getAllMoods!.id.toString(),
          moodProvider.selectGetAllSubMoodsModel.id.toString(),
          textEditingController.text, (bool isVerified, String message) {
        if (isVerified) {
          Provider.of<InsightProvider>(context, listen: false)
              .onInsightChange(true);
          debugPrint(Provider.of<InsightProvider>(context, listen: false)
              .isInsight
              .toString());
          Helper.toScreen(
              context,
              InsightScreen(
                screenName: 'Now it will go to homescreen directly',
              ));
        } else {
          Helper.showSnack(context, message);
        }
      }, context);
      Provider.of<MoodProvider>(context, listen: false)
          .saveMoodId(widget.getAllMoods!.id.toString());
      Provider.of<MoodProvider>(context, listen: false)
          .saveSubMoodId(moodProvider.selectGetAllSubMoodsModel.id.toString());
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      init();
    });
  }

  @override
  void dispose() {
    // TODO: implement dispose
    textEditingController.clear();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    print("id  ${widget.getAllMoods!.id}");
    return CustomParentWidget(
      child: Consumer2<HomePageProvider, MoodProvider>(
          builder: (context, homePageProvider, moodProvider, child) {
        return Scaffold(
          backgroundColor: widget.getAllMoods!.color!.toColor(),
          // widget.moodType == "Disgusted"
          //     ? Color(0xFFfae1d2)
          //     : widget.moodType == "Happy"
          //         ? Color(0xFFe2f2ff)
          //         : widget.moodType == "Sad"
          //             ? Color(0xFFffffd8)
          //             : widget.moodType == "Bad"
          //                 ? Color(0xFFffe9f3)
          //                 : widget.moodType == "Fear"
          //                     ? Color(0xFFe4e1ff)
          //                     : widget.moodType == "Anger"
          //                         ? Color(0xFFfedcdc)
          //                         : Color(0xFFdaedd9),
          appBar: AppBar(
            elevation: 0,
            centerTitle: true,
            backgroundColor: widget.getAllMoods!.color!.toColor(),
            // widget.moodType == "Disgusted"
            //     ? Color(0xFFfae1d2)
            //     : widget.moodType == "Happy"
            //         ? Color(0xFFe2f2ff)
            //         : widget.moodType == "Sad"
            //             ? Color(0xFFffffd8)
            //             : widget.moodType == "Bad"
            //                 ? Color(0xFFffe9f3)
            //                 : widget.moodType == "Fear"
            //                     ? Color(0xFFe4e1ff)
            //                     : widget.moodType == "Anger"
            //                         ? Color(0xFFfedcdc)
            //                         : Color(0xFFdaedd9),
            leading: CustomInkWell(
              onTap: () {
                Navigator.pop(context);
              },
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Image.asset(
                  "assets/icons/arrow_back_02.png",
                  scale: 1.1,
                ),
              ),
            ),
            title: CustomText(
              title: "Mood Tracker",
              fontSize: 16,
              color: blackColor,
              fontWeight: FontWeight.w700,
            ),
          ),
          body: moodProvider.isLoading
              ? CustomLoader()
              : SingleChildScrollView(
                  child: Form(
                    key: formKey,
                    child: Column(
                      children: [
                        //Space
                        SizedBox(
                          height: 10,
                        ),
                        //What precisely...
                        Container(
                          alignment: Alignment.center,
                          child: CustomText(
                            title: widget.getAllMoods!.name == "Disgusted"
                                ? "What precisely is making you feel\ndisgusted right now?"
                                : widget.getAllMoods!.name == "Happy"
                                    ? "What precisely is making you feel\nhappy right now?"
                                    : widget.getAllMoods!.name == "Sad"
                                        ? "What precisely is making you feel\nsad right now?"
                                        : widget.getAllMoods!.name == "Bad"
                                            ? "What precisely is making you feel\nbad right now?"
                                            : widget.getAllMoods!.name == "Fear"
                                                ? "What precisely is making you feel\nfear right now?"
                                                : widget.getAllMoods!.name ==
                                                        "Anger"
                                                    ? "What precisely is making you feel\nanger right now?"
                                                    : "What precisely is making you feel\nsurprised right now?",
                            fontSize: 13,
                            color: blackColor,
                            textAlign: TextAlign.center,
                          ),
                        ),
                        //Space
                        SizedBox(
                          height: 30,
                        ),
                        Column(
                          children: [
                            Image.network(
                              widget.getAllMoods!.image.toString(),
                              scale: 1.4,
                            )
                            // Image.asset(
                            //   widget.moodType == "Disgusted"
                            //       ? "assets/icons/08_disgusted.png"
                            //       : widget.moodType == "Happy"
                            //           ? "assets/icons/01_happy.png"
                            //           : widget.moodType == "Sad"
                            //               ? "assets/icons/05_sad.png"
                            //               : widget.moodType == "Bad"
                            //                   ? "assets/icons/04_bad.png"
                            //                   : widget.moodType == "Fear"
                            //                       ? "assets/icons/06_fear.png"
                            //                       : widget.moodType == "Anger"
                            //                           ? "assets/icons/07_anger.png"
                            //                           : "assets/icons/03_surprised.png",
                            //   scale: 1.1,
                            // ),
                            //Space
                            ,
                            SizedBox(
                              height: 8,
                            ),
                            CustomText(
                              title: "${widget.getAllMoods!.name}",
                              fontSize: 18,
                              color: blackColor,
                              fontWeight: FontWeight.w900,
                            )
                          ],
                        ),
                        //Space
                        SizedBox(
                          height: 10,
                        ),
                        //Based on the ...
                        Container(
                          padding: EdgeInsets.symmetric(horizontal: 12),
                          alignment: Alignment.center,
                          child: CustomText(
                            title: removeHtmlTags(
                                widget.getAllMoods!.description.toString()),
                            // widget.moodType == "Disgusted"
                            //     ? "Based on the emotion(s) selected, we can\n"
                            //         "recommend activities and exercises to find ways to\n"
                            //         "cultivate more positive emotions."
                            //     : widget.moodType == "Happy"
                            //         ? widget.getAllMoods!.description.toString()
                            //         : widget.moodType == "Sad"
                            //             ? "Based on the emotion(s) selected, we can\n"
                            //                 "recommend activities and exercises to find ways to\n"
                            //                 "cultivate more positive emotions."
                            //             : widget.moodType == "Bad"
                            //                 ? "Based on the emotion(s) selected, we can\n"
                            //                     "recommend activities and exercises to find ways to\n"
                            //                     "cultivate more positive emotions."
                            //                 : widget.moodType == "Fear"
                            //                     ? "Based on the emotion(s) selected, we can\n"
                            //                         "recommend activities and exercises to explore\n"
                            //                         "your fears and find ways to manage them."
                            //                     : widget.moodType == "Anger"
                            //                         ? "Based on the emotion(s) selected, we can\n"
                            //                             "recommend activities and exercises to find ways to\n"
                            //                             "manage your anger in a healthy way."
                            //                         : "Based on the emotion(s) selected, we can\n"
                            //                             "recommend activities and exercises to help you\n"
                            //                             "explore any accompanying emotions that\nyou may be feeling.",
                            fontSize: 13,
                            color: blackColor,
                            textAlign: TextAlign.center,
                          ),
                        ),
                        //Space
                        SizedBox(
                          height: 30,
                        ),
                        //
                        Container(
                          width: double.infinity,
                          margin: EdgeInsets.symmetric(horizontal: 18),
                          padding: EdgeInsets.symmetric(
                              horizontal: 10, vertical: 15),
                          decoration: BoxDecoration(
                              border: Border.all(
                                width: 1,
                                color: moodProvider
                                    .getAllSubsMoodsModels[0].subMoodColor!
                                    .toColor(),
                                // widget.moodType == "Disgusted"
                                //     ? Color(0xFFfcc292)
                                //     : widget.moodType == "Happy"
                                //         ? Color(0xFF84ddff)
                                //         : widget.moodType == "Sad"
                                //             ? Color(0xFFfee08d)
                                //             : widget.moodType == "Bad"
                                //                 ? Color(0xFFe09bbd)
                                //                 : widget.moodType == "Fear"
                                //                     ? Color(0xFFb8b1f5)
                                //                     : widget.moodType ==
                                //                             "Anger"
                                //                         ? Color(0xFFeaa1a3)
                                //                         : Color(0xFF9ad197)
                              ),
                              borderRadius: BorderRadius.circular(12)),
                          child: Wrap(
                            spacing: 8,
                            runSpacing: 10,
                            children: List.generate(
                                moodProvider.getAllSubsMoodsModels.length,
                                // widget.moodType == "Disgusted"
                                //     ? naturalMoodList.length
                                //     : widget.moodType == "Happy"
                                //         ? moodProvider
                                //             .getAllSubsMoodsModels.length
                                //         : widget.moodType == "Sad"
                                //             ? sadMoodList.length
                                //             : widget.moodType == "Bad"
                                //                 ? badMoodList.length
                                //                 : widget.moodType == "Fear"
                                //                     ? fearMoodList.length
                                //                     : widget.moodType == "Anger"
                                //                         ? angerMoodList.length
                                //                         : surprisedMoodList
                                //                             .length,
                                (index) {
                              return Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  CustomInkWell(
                                    onTap: () {
                                      // homePageProvider
                                      //     .moodTrackerIndexChanged(index);
                                      moodProvider.onChangeMood(moodProvider
                                          .getAllSubsMoodsModels[index]);
                                    },
                                    child: Container(
                                      height: 44,
                                      padding:
                                          EdgeInsets.symmetric(horizontal: 5),
                                      constraints: BoxConstraints(minWidth: 80),
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(5),
                                          color: moodProvider
                                                      .selectGetAllSubMoodsModel ==
                                                  moodProvider
                                                          .getAllSubsMoodsModels[
                                                      index]
                                              ? moodProvider
                                                  .getAllSubsMoodsModels[index]
                                                  .subMoodColor!
                                                  .toColor()
                                              : null,
                                          border: Border.all(
                                              width: 1,
                                              color: moodProvider
                                                  .getAllSubsMoodsModels[index]
                                                  .subMoodColor!
                                                  .toColor())),
                                      alignment: Alignment.center,
                                      child: CustomText(
                                        title: moodProvider
                                            .getAllSubsMoodsModels[index]
                                            .subMoodName,
                                        fontSize: 12,
                                        color: blackColor,
                                        maxLines: 1,
                                        textAlign: TextAlign.center,
                                      ),
                                    ),
                                  ),
                                ],
                              );
                            }),
                          ),
                        ),
                        //Space
                        SizedBox(
                          height: 20,
                        ),
                        //Journal it down
                        Container(
                          padding: EdgeInsets.symmetric(horizontal: 18),
                          alignment: Alignment.centerLeft,
                          child: CustomText(
                            title: "Journal it down",
                            fontSize: 16,
                            color: blackColor,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        //Space
                        SizedBox(
                          height: 10,
                        ),
                        //
                        Container(
                          margin: EdgeInsets.symmetric(horizontal: 18),
                          decoration: BoxDecoration(
                              border: Border.all(
                                width: 1,
                                color: moodProvider
                                    .getAllSubsMoodsModels[0].subMoodColor!
                                    .toColor(),
                              ),
                              borderRadius: BorderRadius.circular(80)),
                          child: CustomTextField(
                            controller: textEditingController,
                            keyboardType: TextInputType.text,
                            // textInputAction: TextInputAction.done,
                            isOutlineInputBorder: true,
                            isOutlineInputBorderColor: moodProvider
                                .getAllSubsMoodsModels[0].subMoodColor!
                                .toColor(),
                            onChanged: (_) {},
                            //validation: validatePassword,
                            hintText: "type..",
                            hintFontSize: 13,
                            hintTextColor: greyColor,
                            maxLines: 5,
                            fieldborderRadius: 7,
                            outlineBottomLeftRadius: 10,
                            outlineTopRightRadius: 10,
                            outlineTopLeftRadius: 10,
                            outlineBottomRightRadius: 10,
                            textFieldFillColor: whiteColor,
                          ),
                        ),
                        //Space
                        SizedBox(
                          height: 40,
                        ),
                        //Submit
                        Container(
                          padding: EdgeInsets.symmetric(horizontal: 18),
                          // alignment: Alignment.bottomCenter,
                          child: CustomButton(
                            onPressed: () async {
                              addMoodTracker(context, moodProvider);
                              textEditingController.clear();
                            },
                            btnHeight: 48,
                            btnWidth: 120,
                            btnRadius: 26,
                            title: 'Submit',
                            fontWeight: FontWeight.w600,
                            btnColor: darkBlueColor,
                            textColor: whiteColor,
                            fontSize: 17,
                          ),
                        ),
                        //Space
                        SizedBox(
                          height: 80,
                        ),
                      ],
                    ),
                  ),
                ),
        );
      }),
    );
  }
}
