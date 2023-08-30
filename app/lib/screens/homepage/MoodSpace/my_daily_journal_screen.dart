import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wellbe/utilites/colors.dart';
import 'package:wellbe/utilites/helper.dart';
import 'package:wellbe/widgets/custom_button.dart';
import 'package:wellbe/widgets/custom_inkwell_btn.dart';
import 'package:wellbe/widgets/custom_parent_widget.dart';
import 'package:wellbe/widgets/custom_text.dart';
import 'package:wellbe/widgets/custom_textfield.dart';

import '../../../models/GetJournalModel/get_journal_model.dart';
import '../../../provider/JournalProvider/journal_provider.dart';
import '../../../utilites/string_utils.dart';
import '../../../widgets/custom_loader.dart';
import 'my_jounal_screen.dart';

class MyDailyJournalScreen extends StatefulWidget {
  MyDailyJournalScreen({Key? key, this.index}) : super(key: key);

  int? index;

  @override
  State<MyDailyJournalScreen> createState() => _MyDailyJournalScreenState();
}

class _MyDailyJournalScreenState extends State<MyDailyJournalScreen> {
  List<TextEditingController> _controllers = [];
  TextEditingController titleController = TextEditingController();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _controllers.clear();
    Future dataLoading = Provider.of<JournalProvider>(context, listen: false)
        .getJournalQuestionById(widget.index!, (status) {}, context);

    dataLoading.then((value) {
      for (int i = 0;
          i <
              Provider.of<JournalProvider>(context, listen: false)
                  .getJournalQuestionByIdModel
                  .length;
          i++) {
        _controllers.add(TextEditingController());

        debugPrint('controller length:${_controllers.length}');
      }
    });
  }

  addUserJournalQuestion(
      BuildContext context,
      JournalProvider journalProvider,
      String answerOne,
      String? answerTwo,
      String? answerThree,
      String id,
      String questionId1,
      String? questionId2,
      String? questionId3) {
    if (formKey.currentState!.validate()) {
      journalProvider.addUserJournalQuestion(
          id,
          titleController.text,
          questionId1,
          answerOne,
          questionId2,
          answerTwo,
          questionId3,
          answerThree, (bool status, String message) {
        if (status) {
          Helper.toScreen(context, MyJournalScreen());
        } else {
          Helper.showSnack(context, message);
        }
      }, context);
    }
  }

  final formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return CustomParentWidget(
      child:
          Consumer<JournalProvider>(builder: (context, journalProvider, child) {
        return Scaffold(
          appBar: AppBar(
            elevation: 0,
            centerTitle: false,
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
              title: "My Daily Journal",
              fontSize: 16,
              color: blackColor,
              fontWeight: FontWeight.w700,
            ),
          ),
          body: journalProvider.getJournalQuestionByIdModel.length != 0
              ? SingleChildScrollView(
                  child: Form(
                    key: formKey,
                    child: Column(
                      children: [
                        //
                        Container(
                          margin: EdgeInsets.symmetric(horizontal: 18),
                          padding: EdgeInsets.symmetric(
                              horizontal: 15, vertical: 15),
                          decoration: BoxDecoration(
                              border: Border.all(
                                  width: 1, color: Color(0xFF9ad197)),
                              borderRadius: BorderRadius.circular(10),
                              color: Color(0xFFdaedd9)),
                          alignment: Alignment.centerLeft,
                          child: CustomText(
                            title:
                                "Daily journaling is an easy and enjoyable way to "
                                "improve your well-being. Daily prompts help you set "
                                "intentions, celebrate wins, and work through challenges. "
                                "Whether morning or night, journaling can keep you focused "
                                "and inspired as you move through life.",
                            fontSize: 12,
                            color: blackColor,
                          ),
                        ),

                        //Space
                        SizedBox(
                          height: 15,
                        ),
                        //Title
                        Container(
                          padding: EdgeInsets.symmetric(horizontal: 18),
                          alignment: Alignment.centerLeft,
                          child: CustomText(
                            title: "Title",
                            fontSize: 15,
                            color: blackColor,
                          ),
                        ),
                        //Space
                        SizedBox(
                          height: 2,
                        ),
                        //
                        Container(
                          padding: const EdgeInsets.symmetric(horizontal: 18),
                          child: CustomTextField(
                            //controller: emailController,
                            keyboardType: TextInputType.text,
                            controller: titleController,
                            //textInputAction: TextInputAction.done,
                            isOutlineInputBorder: true,
                            isOutlineInputBorderColor: greyColor,
                            onChanged: (_) {},
                            hintText: "Add a title to this story",
                            hintFontSize: 13,
                            fieldborderRadius: 7,
                            outlineBottomLeftRadius: 6,
                            outlineTopRightRadius: 6,
                            outlineTopLeftRadius: 6,
                            outlineBottomRightRadius: 6,
                            textFieldFillColor: whiteColor,
                          ),
                        ),
                        //Space
                        SizedBox(
                          height: 12,
                        ),
                        //Story
                        Container(
                          padding: EdgeInsets.symmetric(horizontal: 18),
                          alignment: Alignment.centerLeft,
                          child: CustomText(
                            title: "Story",
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
                          margin: EdgeInsets.symmetric(horizontal: 18),
                          alignment: Alignment.centerLeft,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(12),
                              border: Border.all(
                                  width: 1, color: greyColor.withOpacity(0.6))),
                          padding: EdgeInsets.symmetric(horizontal: 12),
                          child: ListView.builder(
                              shrinkWrap: true,
                              itemCount: journalProvider
                                  .getJournalQuestionByIdModel.length,
                              itemBuilder: (context, index) {
                                final question = journalProvider
                                    .getJournalQuestionByIdModel[index];
                                return Container(
                                  child: Column(
                                    children: [
                                      SizedBox(
                                        height: 12,
                                      ),
                                      //
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.end,
                                        children: [
                                          GestureDetector(
                                            onTap: () {
                                              Provider.of<JournalProvider>(
                                                      context,
                                                      listen: false)
                                                  .getJournalQuestionById(
                                                      widget.index!,
                                                      (status) {},
                                                      context,
                                                      isFirstTime: true);
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
                                      //today
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
                                            title: removeHtmlTags(
                                                question.question.toString()),
                                            fontSize: 14,
                                            color: blackColor,
                                          ))
                                        ],
                                      ),
                                      //Space

                                      //input
                                      CustomTextField(
                                        //controller: emailController,
                                        keyboardType: TextInputType.text,
                                        validation: (val) {
                                          if (val!.isEmpty) {
                                            return 'this field cannot be empty';
                                          }
                                        },
                                        //textInputAction: TextInputAction.done,
                                        isOutlineInputBorder: false,
                                        controller: _controllers[index],
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
                                      //Space

                                      SizedBox(
                                        height: 12,
                                      ),
                                    ],
                                  ),
                                );
                              }),
                        ),
                        //Space
                        SizedBox(
                          height: 20,
                        ),
                        //
                        Container(
                          padding: EdgeInsets.symmetric(horizontal: 18),
                          // alignment: Alignment.bottomCenter,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              CustomButton(
                                onPressed: () async {
                                  //  Helper.toScreen(context, HomePageScreen());
                                  Navigator.pop(context);
                                },
                                btnHeight: 48,
                                btnWidth: 140,
                                btnRadius: 26,
                                title: 'Cancel',
                                fontWeight: FontWeight.w600,
                                btnColor: Colors.transparent,
                                btnBorderWidth: 2,
                                btnBorderColor: darkBlueColor,
                                textColor: darkBlueColor,
                                fontSize: 17,
                              ),
                              //Space
                              SizedBox(
                                width: 15,
                              ),
                              CustomButton(
                                onPressed: () async {
                                  String? questionId2;
                                  String? questionId3;

                                  if (journalProvider
                                          .getJournalQuestionByIdModel.length ==
                                      2) {
                                    questionId2 = journalProvider
                                        .getJournalQuestionByIdModel[1].id
                                        .toString();
                                  } else {
                                    questionId2 = null;
                                  }

                                  if (journalProvider
                                          .getJournalQuestionByIdModel.length ==
                                      3) {
                                    questionId3 = journalProvider
                                        .getJournalQuestionByIdModel[2].id
                                        .toString();
                                  } else {
                                    questionId3 = null;
                                  }

                                  addUserJournalQuestion(
                                    context,
                                    journalProvider,
                                    _controllers[0].text,
                                    _controllers.length != 2
                                        ? null
                                        : _controllers[1].text,
                                    _controllers.length != 3
                                        ? null
                                        : _controllers[2].text,
                                    journalProvider
                                        .getJournalQuestionByIdModel[0]
                                        .journalId
                                        .toString(),
                                    journalProvider
                                        .getJournalQuestionByIdModel[0].id
                                        .toString(),
                                    questionId2,
                                    questionId3,
                                  );
                                },
                                btnHeight: 48,
                                btnWidth: 140,
                                btnRadius: 26,
                                title: 'Save',
                                fontWeight: FontWeight.w600,
                                btnColor: darkBlueColor,
                                textColor: whiteColor,
                                fontSize: 17,
                              ),
                            ],
                          ),
                        ),
                        //Space
                        SizedBox(
                          height: 120,
                        ),
                      ],
                    ),
                  ),
                )
              : Center(child: CustomLoader()),
        );
      }),
    );
  }
}
