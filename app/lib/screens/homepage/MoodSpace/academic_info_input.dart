import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wellbe/screens/homepage/HomeScreens/homepage_screen.dart';
import 'package:wellbe/screens/homepage/MIndFul/breath_in.dart';

import 'package:wellbe/utilites/colors.dart';
import 'package:wellbe/utilites/string_utils.dart';
import 'package:wellbe/widgets/custom_parent_widget.dart';
import 'package:wellbe/widgets/custom_textfield.dart';

import '../../../provider/MoodProvider/mood_provider.dart';
import '../../../provider/auth_provider.dart';
import '../../../provider/mindful_provider.dart';
import '../../../utilites/helper.dart';
import '../../../widgets/custom_inkwell_btn.dart';
import '../../../widgets/custom_loader.dart';
import '../../../widgets/custom_text.dart';
import '../../../widgets/execute_after_frame_render.dart';
import 'mood_space.dart';

class AcademicInfoInput extends StatefulWidget {
  String? screenName;
  AcademicInfoInput({Key? key, this.screenName}) : super(key: key);

  @override
  State<AcademicInfoInput> createState() => _AcademicInfoInputState();
}

class _AcademicInfoInputState extends State<AcademicInfoInput> {
  final formKey = GlobalKey<FormState>();
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  TextEditingController _title = TextEditingController();
  TextEditingController _question1 = TextEditingController();
  TextEditingController _question2 = TextEditingController();
  TextEditingController _question3 = TextEditingController();

  addUserAcademic(
    BuildContext context,
    AuthProvider authProvider,
    MoodProvider moodProvider, {
    String? answerOne,
    String? answerTwo,
    String? answerThree,
  }) {
    moodProvider.addUserAcademic(
      authProvider.userModel.id.toString(),
      moodProvider.moodId.toString(),
      moodProvider.subMoodId.toString(),
      _title.text.toString(),
      (isVerified, String message) {
        if (isVerified) {
          if (Provider.of<MoodSpaceProvider>(context, listen: false)
              .isThoughtPage) {
            Navigator.pop(context);
            Navigator.pop(context);
          } else {
            Navigator.pop(context);
            Helper.toScreen(context, BreathIn());
          }
        } else {
          // Helper.showSnack(context, message);
        }
        _question1.clear();
        _question2.clear();
        _question3.clear();
      },
      context,
      questionIdOne: moodProvider.getAllQuestionsModels[0].id.toString(),
      questionIdTwo: moodProvider.getAllQuestionsModels.length == 2
          ? moodProvider.getAllQuestionsModels[1].id.toString()
          : null,
      questionIdThree: moodProvider.getAllQuestionsModels.length == 3
          ? moodProvider.getAllQuestionsModels[2].id.toString()
          : null,
      answerOne: answerOne,
      answerTwo: answerTwo,
      answerThree: answerThree,
    );
  }

  // Define a function to open the dialog
  void _openDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext dialogcontext) {
        return Consumer2<AuthProvider, MoodProvider>(
            builder: (context, authProvider, moodProvider, child) {
          return Dialog(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
            ),
            child: Container(
              padding: EdgeInsets.all(20),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Image.asset(
                    'assets/icons/successful_popup.png',
                    width: 70, // Replace with your image asset path
                    height: 70,
                  ),
                  SizedBox(height: 16),
                  CustomText(
                    title: 'Wait Up!',
                    fontSize: 20,
                    fontWeight: FontWeight.w600,
                    color: blackColor,
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: 12),
                  Text(
                    'Do you want to save your Jounral?',
                    style: TextStyle(
                        fontSize: 12,
                        color: textGreyColor2,
                        fontWeight: FontWeight.w700),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: 16),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Expanded(
                        child: ElevatedButton(
                          onPressed: () {
                            // Perform action for the first button
                            Navigator.pop(dialogcontext);

                            // Helper.toScreen(context, DoctorDetails());
                          },
                          child: CustomText(
                              title: 'No',
                              color: blueColor,
                              fontWeight: FontWeight.bold,
                              fontSize: 12),
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.transparent,
                            foregroundColor: Colors.white,
                            elevation: 0,
                            padding: EdgeInsets.symmetric(
                                vertical: 2, horizontal: 7),
                            shape: RoundedRectangleBorder(
                              side: BorderSide(width: 2, color: blueColor),
                              borderRadius: BorderRadius.circular(60),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(
                        width: 4,
                      ),
                      Expanded(
                        child: ElevatedButton(
                          onPressed: () {
                            // Perform action for the second button
                            // Helper.toReplacementScreenSlideLeftToRight(
                            //     context, MoodSpace());
                            // Navigator.pop(dialogcontext);

                            addUserAcademic(
                                dialogcontext, authProvider, moodProvider,
                                answerOne: _question1.text,
                                answerTwo: _question2.text,
                                answerThree: _question3.text);
                          },
                          child: CustomText(
                            title: 'Yes',
                            fontSize: 12,
                            color: Colors.white,
                          ),
                          style: ElevatedButton.styleFrom(
                            backgroundColor: darkBlueColor,
                            foregroundColor: Colors.white,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(60),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          );
        });
      },
    );
  }

  void _openSuccessfulDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext buildcontext) {
        return Dialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          child: Container(
            padding: EdgeInsets.all(20),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Image.asset(
                  'assets/icons/successful_popup.png',
                  width: 70, // Replace with your image asset path
                  height: 70,
                ),
                SizedBox(height: 16),
                CustomText(
                  title: 'Saved Successfully',
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                  color: blackColor,
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 12),
                Text(
                  'Your Journal has been Saved',
                  style: TextStyle(
                      fontSize: 12,
                      color: textGreyColor2,
                      fontWeight: FontWeight.w700),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 16),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ElevatedButton(
                      onPressed: () {
                        // Perform action for the second button
                        // Navigator.pop(context);
                        if (Provider.of<MoodSpaceProvider>(context,
                                listen: false)
                            .isThoughtPage) {
                          Navigator.pop(context);
                          Navigator.pop(context);
                        } else {
                          Navigator.pop(context);
                          Helper.toScreen(context, BreathIn());
                        }
                        _question1.clear();
                        _question2.clear();
                        _question3.clear();
                      },
                      child: CustomText(
                        title: 'OK',
                        fontSize: 12,
                        color: Colors.white,
                      ),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: darkBlueColor,
                        foregroundColor: Colors.white,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(60),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  @override
  void initState() {
    // TODO: implement initState
    executeAfterFrameRender(() {
      Provider.of<MoodProvider>(context, listen: false)
          .getAllQuestions(2, (isVerified) {}, context);
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return CustomParentWidget(
      child: WillPopScope(
        onWillPop: () async {
          if (Provider.of<MoodSpaceProvider>(context, listen: false)
              .isThoughtPage) {
            Navigator.of(context, rootNavigator: true).pop(context);
          } else if (widget.screenName == 'recommendationScreen') {
            Navigator.of(context, rootNavigator: true).pop(context);
          } else {
            Navigator.of(context, rootNavigator: true).pop(context);
            Navigator.of(context, rootNavigator: true).pop(context);
          }
          return true;
        },
        child: Consumer2<MoodProvider, AuthProvider>(
            builder: (context, moodProvider, authProvider, child) {
          return Scaffold(
            appBar: AppBar(
              elevation: 0,
              centerTitle: false,
              automaticallyImplyLeading: false,
              backgroundColor: whiteColor,
              title: CustomText(
                title: "Academic 01",
                fontSize: 17,
                color: blackColor,
                fontWeight: FontWeight.w700,
              ),
              actions: [
                CustomInkWell(
                  onTap: () {
                    if (Provider.of<MoodSpaceProvider>(context, listen: false)
                        .isThoughtPage) {
                      Navigator.of(context, rootNavigator: true).pop(context);
                    } else if (widget.screenName == 'recommendationScreen') {
                      Navigator.of(context, rootNavigator: true).pop(context);
                    } else {
                      Navigator.of(context, rootNavigator: true).pop(context);
                      Navigator.of(context, rootNavigator: true).pop(context);
                    }
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Image.asset(
                      "assets/icons/close.png",
                      scale: 1.1,
                    ),
                  ),
                ),
                //Space
                SizedBox(
                  width: 10,
                )
              ],
            ),
            body: moodProvider.getAllQuestionsModels.length != 0
                ? SingleChildScrollView(
                    child: Form(
                    key: formKey,
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 18.0),
                          child: Container(
                            decoration: BoxDecoration(
                              color: lightGreenColor.withOpacity(0.3),
                              border: Border.all(
                                color: mediumGreyColor,
                              ),
                              borderRadius: BorderRadius.circular(15),
                            ),
                            padding: EdgeInsets.all(10),
                            child: CustomText(
                              title:
                                  'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Curabitur gravida justo nec tempor euismod. Sed id mauris mauris. Morbi in elit pharetra, efficitur enim ut, efficitur ligula. Aliquam tempor fringilla nisi vitae eleifend. Nam vel suscipit ipsum, ac viverra justo. Integer malesuada purus ac risus rutrum, ac ullamcorper metus egestas.',
                              maxLines: 5,
                              fontWeight: FontWeight.w500,
                              fontSize: 12,
                              color: textGreyColor2,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 18.0),
                          child: Row(
                            children: [
                              CustomText(
                                  title: 'Title',
                                  fontSize: 14,
                                  color: blackColor,
                                  fontWeight: FontWeight.w600),
                            ],
                          ),
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 18.0),
                          child: CustomTextField(
                            controller: _title,
                            hintText: 'Academic 01',
                            hintTextColor: hintTextColor,
                            isOutlineInputBorderColor: hintTextColor,
                            hintFontSize: 14,
                          ),
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 18.0),
                          child: Row(
                            children: [
                              CustomText(
                                  title: 'Story',
                                  fontSize: 14,
                                  color: blackColor,
                                  fontWeight: FontWeight.w600),
                            ],
                          ),
                        ),
                        const SizedBox(
                          height: 5,
                        ),

                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 18.0),
                          child: Container(
                            alignment: Alignment.centerLeft,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(12),
                                border: Border.all(
                                    width: 1,
                                    color: greyColor.withOpacity(0.6))),
                            padding: EdgeInsets.symmetric(horizontal: 12),
                            child: Column(
                              children: [
                                SizedBox(
                                  height: 12,
                                ),
                                //
                                if (moodProvider.getAllQuestionsModels.length >=
                                    1)
                                  Column(
                                    children: [
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.end,
                                        children: [
                                          CustomInkWell(
                                            onTap: () {
                                              moodProvider.getAllQuestions(2,
                                                  (status) {
                                                if (status) {
                                                  Helper.showSnack(context,
                                                      'questions sucessfully updated');
                                                } else {
                                                  Helper.showSnack(context,
                                                      'There was an error in your request.Please try again later');
                                                }
                                              }, context, isChanged: true);
                                              _question1.clear();
                                              _question2.clear();
                                              _question3.clear();
                                            },
                                            child: Container(
                                              padding: EdgeInsets.symmetric(
                                                  horizontal: 6, vertical: 3),
                                              decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(20),
                                                  color: Color(0xFFdaedd9)),
                                              child: Row(
                                                children: [
                                                  Icon(
                                                    Icons.refresh,
                                                    color: blackColor,
                                                    size: 16,
                                                  ),
                                                  //Space
                                                  SizedBox(
                                                    width: 2,
                                                  ),
                                                  CustomText(
                                                    title: "Change",
                                                    fontSize: 10,
                                                    color: blackColor,
                                                  )
                                                ],
                                              ),
                                            ),
                                          )
                                        ],
                                      ),
                                      //Space
                                      SizedBox(
                                        height: 8,
                                      ),
                                      //

                                      Row(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Container(
                                            decoration: BoxDecoration(
                                                shape: BoxShape.circle,
                                                color: Color(0xFFdaedd9)),
                                            padding: EdgeInsets.all(8),
                                            child: Center(
                                              child: CustomText(
                                                title: "Q",
                                                fontSize: 15,
                                                color: blackColor,
                                                fontWeight: FontWeight.w700,
                                              ),
                                            ),
                                          ),
                                          //Space
                                          SizedBox(
                                            width: 12,
                                          ),
                                          Expanded(
                                              child: CustomText(
                                            title: removeHtmlTags(moodProvider
                                                .getAllQuestionsModels[0]
                                                .question
                                                .toString()),
                                            fontSize: 14,
                                            color: blackColor,
                                          ))
                                        ],
                                      ),
                                      //Space
                                      // const SizedBox(
                                      //   height: 1,
                                      // ),
                                      //input
                                      CustomTextField(
                                        controller: _question1,
                                        keyboardType: TextInputType.text,
                                        //textInputAction: TextInputAction.done,
                                        isOutlineInputBorder: false,
                                        isOutlineInputBorderColor:
                                            greyColor.withOpacity(0.5),
                                        validation: (value) {
                                          if (value!.isEmpty) {
                                            return 'this field cannot be empty';
                                          }
                                          // if (value!.length < 6) {
                                          //   return 'length is too short';
                                          // }
                                        },
                                        isUnderlineInputBorderWidth: 0.5,
                                        onChanged: (_) {},
                                        hintText: "Type your answer here",
                                        hintFontSize: 13,
                                        fieldborderRadius: 7,
                                        contentPaddingLeft: 40,
                                        outlineBottomLeftRadius: 6,
                                        outlineTopRightRadius: 6,
                                        outlineTopLeftRadius: 6,
                                        outlineBottomRightRadius: 6,
                                        textFieldFillColor: whiteColor,
                                      ),
                                    ],
                                  ),
                                //Space
                                SizedBox(
                                  height: 12,
                                ),

                                //right now
                                if (moodProvider.getAllQuestionsModels.length >=
                                    2)
                                  Column(
                                    children: [
                                      //
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.end,
                                        children: [
                                          Container(
                                            padding: EdgeInsets.symmetric(
                                                horizontal: 6, vertical: 3),
                                            decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(20),
                                                color: Color(0xFFdaedd9)),
                                            child: Row(
                                              children: [
                                                Icon(
                                                  Icons.refresh,
                                                  color: blackColor,
                                                  size: 16,
                                                ),
                                                //Space
                                                SizedBox(
                                                  width: 2,
                                                ),
                                                CustomText(
                                                  title: "Change",
                                                  fontSize: 10,
                                                  color: blackColor,
                                                )
                                              ],
                                            ),
                                          )
                                        ],
                                      ),
                                      SizedBox(
                                        height: 10,
                                      ),
                                      Row(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: [
                                          Container(
                                            decoration: BoxDecoration(
                                                shape: BoxShape.circle,
                                                color: Color(0xFFdaedd9)),
                                            padding: EdgeInsets.all(8),
                                            child: Center(
                                              child: CustomText(
                                                title: "Q",
                                                fontSize: 15,
                                                color: blackColor,
                                                fontWeight: FontWeight.w700,
                                              ),
                                            ),
                                          ),
                                          //Space
                                          SizedBox(
                                            width: 12,
                                          ),
                                          Expanded(
                                              child: CustomText(
                                            title: removeHtmlTags(moodProvider
                                                .getAllQuestionsModels[1]
                                                .question
                                                .toString()),
                                            fontSize: 14,
                                            color: blackColor,
                                          ))
                                        ],
                                      ),
                                      //Space
                                      // SizedBox(
                                      //   height: 20,
                                      // ),
                                      //input
                                      CustomTextField(
                                        controller: _question2,
                                        keyboardType: TextInputType.text,
                                        //textInputAction: TextInputAction.done,
                                        isOutlineInputBorder: false,
                                        validation: (value) {
                                          if (value!.isEmpty) {
                                            return 'this field cannot be empty';
                                          }
                                          if (value!.length < 6) {
                                            return 'length is too short';
                                          }
                                        },
                                        isOutlineInputBorderColor:
                                            greyColor.withOpacity(0.5),
                                        isUnderlineInputBorderWidth: 0.5,
                                        onChanged: (_) {},
                                        hintText: "Type your answer here",
                                        hintFontSize: 13,
                                        fieldborderRadius: 7,
                                        contentPaddingLeft: 40,
                                        outlineBottomLeftRadius: 6,
                                        outlineTopRightRadius: 6,
                                        outlineTopLeftRadius: 6,
                                        outlineBottomRightRadius: 6,
                                        textFieldFillColor: whiteColor,
                                      ),
                                    ],
                                  ),
                                //Space
                                SizedBox(
                                  height: 12,
                                ),
                                //
                                if (moodProvider.getAllQuestionsModels.length >=
                                    3)
                                  Column(
                                    children: [
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.end,
                                        children: [
                                          Container(
                                            padding: EdgeInsets.symmetric(
                                                horizontal: 6, vertical: 3),
                                            decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(20),
                                                color: Color(0xFFdaedd9)),
                                            child: Row(
                                              children: [
                                                Icon(
                                                  Icons.refresh,
                                                  color: blackColor,
                                                  size: 16,
                                                ),
                                                //Space
                                                SizedBox(
                                                  width: 2,
                                                ),
                                                CustomText(
                                                  title: "Change",
                                                  fontSize: 10,
                                                  color: blackColor,
                                                )
                                              ],
                                            ),
                                          )
                                        ],
                                      ),
                                      SizedBox(
                                        height: 10,
                                      ),
                                      //affirmations
                                      Row(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: [
                                          Container(
                                            decoration: BoxDecoration(
                                                shape: BoxShape.circle,
                                                color: Color(0xFFdaedd9)),
                                            padding: EdgeInsets.all(8),
                                            child: Center(
                                              child: CustomText(
                                                title: "Q",
                                                fontSize: 15,
                                                color: blackColor,
                                                fontWeight: FontWeight.w700,
                                              ),
                                            ),
                                          ),
                                          //Space
                                          SizedBox(
                                            width: 12,
                                          ),
                                          Expanded(
                                              child: CustomText(
                                            title: removeHtmlTags(moodProvider
                                                .getAllQuestionsModels[2]
                                                .question
                                                .toString()),
                                            fontSize: 14,
                                            color: blackColor,
                                          ))
                                        ],
                                      ),
                                      //Space
                                      // SizedBox(
                                      //   height: 20,
                                      // ),
                                      //input
                                      CustomTextField(
                                        controller: _question3,
                                        keyboardType: TextInputType.text,
                                        //textInputAction: TextInputAction.done,
                                        isOutlineInputBorder: false,
                                        isOutlineInputBorderColor:
                                            greyColor.withOpacity(0.5),
                                        validation: (value) {
                                          if (value!.isEmpty) {
                                            return 'this field cannot be empty';
                                          }
                                          if (value!.length < 6) {
                                            return 'length is too short';
                                          }
                                        },
                                        isUnderlineInputBorderWidth: 0.5,
                                        onChanged: (_) {},
                                        hintText: "Type your answer here",
                                        hintFontSize: 13,
                                        fieldborderRadius: 7,
                                        contentPaddingLeft: 40,
                                        outlineBottomLeftRadius: 6,
                                        outlineTopRightRadius: 6,
                                        outlineTopLeftRadius: 6,
                                        outlineBottomRightRadius: 6,
                                        textFieldFillColor: whiteColor,
                                      ),
                                    ],
                                  ),
                                //Space
                                SizedBox(
                                  height: 20,
                                ),
                              ],
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 30,
                        ),

                        //BUTTON
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 18.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              GestureDetector(
                                  onTap: () {
                                    // Helper.toScreen(context, BreathIn());
                                    if (formKey.currentState!.validate()) {
                                      _openDialog(context);
                                    }
                                  },
                                  child: Container(
                                    padding: EdgeInsets.symmetric(
                                        horizontal: 37, vertical: 12),
                                    child: Text(
                                      Provider.of<MoodSpaceProvider>(context)
                                              .isThoughtPage
                                          ? 'Done'
                                          : 'Save',
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.w500,
                                          fontSize: 14),
                                    ),
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(30),
                                        color: darkBlueColor),
                                  )),
                            ],
                          ),
                        ),
                        const SizedBox(
                          height: 50,
                        ),
                      ],
                    ),
                  ))
                : Center(child: CustomLoader()),
          );
        }),
      ),
    );
  }
}

//QUESTION CARD FOR HANDLING QUESTION
class QuestionCard extends StatelessWidget {
  final String question;
  final String hintText;
  final String? Function(String?)? onChanged;

  QuestionCard({
    required this.question,
    required this.hintText,
    this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Container(
              padding: EdgeInsets.symmetric(horizontal: 6, vertical: 3),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: Color(0xFFdaedd9),
              ),
              child: Row(
                children: [
                  Icon(
                    Icons.refresh,
                    color: Colors.black,
                    size: 16,
                  ),
                  SizedBox(width: 2),
                  Text(
                    "Change",
                    style: TextStyle(fontSize: 10, color: Colors.black),
                  ),
                ],
              ),
            ),
          ],
        ),
        SizedBox(height: 8),
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Color(0xFFdaedd9),
              ),
              padding: EdgeInsets.all(8),
              child: Center(
                child: Text(
                  "Q",
                  style: TextStyle(
                    fontSize: 15,
                    color: Colors.black,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
            ),
            SizedBox(width: 12),
            Expanded(
              child: Text(
                "$question?",
                style: TextStyle(fontSize: 14, color: Colors.black),
              ),
            ),
          ],
        ),
        SizedBox(height: 20),
        CustomTextField(
          keyboardType: TextInputType.text,
          isOutlineInputBorder: false,
          isOutlineInputBorderColor: Colors.grey.withOpacity(0.5),
          isUnderlineInputBorderWidth: 0.5,
          onChanged: onChanged,
          hintText: hintText,
          hintFontSize: 13,
          fieldborderRadius: 7,
          contentPaddingLeft: 40,
          outlineBottomLeftRadius: 6,
          outlineTopRightRadius: 6,
          outlineTopLeftRadius: 6,
          outlineBottomRightRadius: 6,
          textFieldFillColor: Colors.white,
        ),
      ],
    );
  }
}
