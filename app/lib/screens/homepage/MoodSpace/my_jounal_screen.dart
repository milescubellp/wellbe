import 'package:flutter/material.dart';
import 'package:persistent_bottom_nav_bar_v2/persistent-tab-view.dart';
import 'package:provider/provider.dart';
import 'package:wellbe/models/CustomModels/custom_model.dart';
import 'package:wellbe/screens/homepage/HomeScreens/homepage_screen.dart';
import 'package:wellbe/screens/homepage/MoodSpace/edit_journal_detail.dart';
import 'package:wellbe/screens/homepage/MoodSpace/my_daily_journal_screen.dart';
import 'package:wellbe/utilites/colors.dart';
import 'package:wellbe/utilites/helper.dart';
import 'package:wellbe/widgets/custom_button.dart';
import 'package:wellbe/widgets/custom_inkwell_btn.dart';
import 'package:wellbe/widgets/custom_parent_widget.dart';
import 'package:wellbe/widgets/custom_text.dart';
import 'package:wellbe/widgets/custom_textfield.dart';

import '../../../provider/JournalProvider/journal_provider.dart';
import 'journal_detail.dart';

class MyJournalScreen extends StatefulWidget {
  MyJournalScreen({Key? key}) : super(key: key);

  @override
  State<MyJournalScreen> createState() => _MyJournalScreenState();
}

class _MyJournalScreenState extends State<MyJournalScreen> {
  void _openDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return Dialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          child: Container(
            padding: EdgeInsets.all(20),
            width: MediaQuery.of(context).size.width,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Image.asset(
                  'assets/icons/delete_popup.png',
                  width: 70, // Replace with your image asset path
                  height: 70,
                ),
                SizedBox(height: 16),
                CustomText(
                  title: 'Wait!',
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                  color: blackColor,
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 12),
                Text(
                  'Do you want to delete it?',
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
                    Expanded(
                      child: CustomButton(
                        onPressed: () {
                          // Perform action for the second button
                          // Helper.toRemoveUntiScreen(context, HeadingForm());
                          Navigator.pop(context);

                          // Helper.toRemoveUntiScreen(
                          //     context,
                          //     HomePageScreen(
                          //       index: 1,
                          //     ));
                        },
                        fontSize: 12,
                        textColor: Colors.white,
                        title: 'No',
                        btnHeight: 40,
                        btnWidth: 90,
                        btnColor: darkBlueColor,
                        btnRadius: 60,
                      ),
                    ),
                    const SizedBox(
                      width: 5,
                    ),
                    Expanded(
                      child: CustomButton(
                        onPressed: () {
                          // Perform action for the second button
                          // Helper.toRemoveUntiScreen(context, HeadingForm());
                          Navigator.pop(context);

                          _openSuccessfulDialog(context);
                        },
                        fontSize: 12,
                        textColor: Colors.white,
                        title: 'Yes',
                        btnHeight: 40,
                        btnWidth: 90,
                        btnColor: darkBlueColor,
                        btnRadius: 60,
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

  void _openSuccessfulDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return Dialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          child: Container(
            padding: EdgeInsets.all(20),
            width: MediaQuery.of(context).size.width,
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
                  title: 'Deleted Successfully',
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                  color: blackColor,
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 12),
                Text(
                  'Your journal has been canceled',
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
                    CustomButton(
                      onPressed: () {
                        // Perform action for the second button
                        // Helper.toRemoveUntiScreen(context, HeadingForm());
                        Navigator.pop(context);
                      },
                      fontSize: 12,
                      textColor: Colors.white,
                      title: 'Okay',
                      btnHeight: 40,
                      btnWidth: 90,
                      btnColor: darkBlueColor,
                      btnRadius: 60,
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
    super.initState();
    // Provider.of<JournalProvider>(context,listen: false).getUser
  }

  @override
  Widget build(BuildContext context) {
    return CustomParentWidget(
      child: WillPopScope(
        onWillPop: () async {
          Navigator.pop(context);
          Helper.toScreen(
              context,
              HomePageScreen(
                index: 1,
              ));
          return true;
        },
        child: Scaffold(
          appBar: AppBar(
            elevation: 0,
            centerTitle: false,
            leading: CustomInkWell(
              onTap: () {
                Navigator.pop(context);
                Helper.toScreen(
                    context,
                    HomePageScreen(
                      index: 1,
                    ));
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
              title: "My Journal",
              fontSize: 16,
              color: blackColor,
              fontWeight: FontWeight.w700,
            ),
            actions: [Image.asset("assets/icons/favorite_big.png")],
          ),
          body: Stack(
            children: [
              Column(
                children: [
                  Divider(
                    height: 1,
                    thickness: 1,
                    color: kPrimaryColor,
                    indent: 18,
                    endIndent: 18,
                  ),
                  //Space
                  SizedBox(
                    height: 15,
                  ),
                  //
                  Container(
                      padding: EdgeInsets.symmetric(horizontal: 18),
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
                      )),
                  //Space
                  SizedBox(
                    height: 20,
                  ),
                  //
                  Expanded(
                    child: ListView.builder(
                        itemCount: journalList.length,
                        shrinkWrap: true,
                        padding: EdgeInsets.symmetric(horizontal: 18),
                        physics: ClampingScrollPhysics(),
                        scrollDirection: Axis.vertical,
                        itemBuilder: (context, index) {
                          return Container(
                            padding: EdgeInsets.only(bottom: 10),
                            child: CustomInkWell(
                              onTap: () {
                                // pushNewScreen(context,
                                //     screen: JournalDetail(), withNavBar: false);
                                Helper.toScreen(context, JournalDetail());
                              },
                              child: Container(
                                width: double.infinity,
                                padding: EdgeInsets.symmetric(
                                    horizontal: 10, vertical: 13),
                                decoration: BoxDecoration(
                                    color: journalList[index].color,
                                    borderRadius: BorderRadius.circular(8)),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    //Space
                                    //    SizedBox(height: 6,),
                                    Row(
                                      children: [
                                        Expanded(
                                          child: CustomText(
                                            title:
                                                "${journalList[index].title}",
                                            fontSize: 16,
                                            color: blackColor,
                                            fontWeight: FontWeight.w700,
                                          ),
                                        ),
                                        CustomInkWell(
                                          onTap: () {
                                            // Helper.toScreen(
                                            //     context, EditJournalDetail());
                                          },
                                          child: Container(
                                            decoration: BoxDecoration(
                                                shape: BoxShape.circle,
                                                color: whiteColor),
                                            child: Padding(
                                              padding:
                                                  const EdgeInsets.all(4.0),
                                              child: Icon(
                                                Icons.favorite_border_outlined,
                                                size: 18,
                                              ),
                                            ),
                                          ),
                                        ),
                                        SizedBox(
                                          width: 7,
                                        ),
                                        CustomInkWell(
                                          onTap: () {
                                            Helper.toScreen(
                                                context, EditJournalDetail());
                                          },
                                          child: Container(
                                            decoration: BoxDecoration(
                                                shape: BoxShape.circle,
                                                color: whiteColor),
                                            child: Padding(
                                              padding:
                                                  const EdgeInsets.all(4.0),
                                              child: Icon(
                                                Icons.mode_edit_outlined,
                                                size: 18,
                                              ),
                                            ),
                                          ),
                                        ),
                                        //Space
                                        SizedBox(
                                          width: 7,
                                        ),
                                        CustomInkWell(
                                          onTap: () {
                                            _openDialog(context);
                                          },
                                          child: Container(
                                            decoration: BoxDecoration(
                                                shape: BoxShape.circle,
                                                color: whiteColor),
                                            child: Padding(
                                              padding:
                                                  const EdgeInsets.all(3.0),
                                              child: Image.asset(
                                                "assets/icons/delete.png",
                                                scale: 1.1,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                    //Space
                                    SizedBox(
                                      height: 6,
                                    ),
                                    Row(
                                      children: [
                                        Expanded(
                                          child: CustomText(
                                            title:
                                                "${journalList[index].subTitle}",
                                            fontSize: 12,
                                            color: blackColor,
                                            maxLines: 2,
                                            //fontWeight: FontWeight.w700,
                                          ),
                                        ),
                                      ],
                                    ),
                                    //Space
                                    SizedBox(
                                      height: 6,
                                    ),
                                    Row(
                                      children: [
                                        Expanded(
                                          child: CustomText(
                                              title: "12 Apr 2023",
                                              fontSize: 10,
                                              color: greyColor
                                              //fontWeight: FontWeight.w700,
                                              ),
                                        ),
                                        CustomText(
                                            title: "10 miints ago",
                                            fontSize: 10,
                                            color: greyColor
                                            //fontWeight: FontWeight.w700,
                                            ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          );
                        }),
                  ),
                  //Space
                  SizedBox(
                    height: 90,
                  ),
                ],
              ),
              // Positioned(
              //   bottom: 30,
              //   right: 6,
              //   child: Container(
              //     padding: EdgeInsets.symmetric(horizontal: 18, vertical: 12),
              //     child: Row(
              //       mainAxisAlignment: MainAxisAlignment.end,
              //       children: [
              //         Container(
              //           width: 50,
              //           height: 50,
              //           decoration: BoxDecoration(
              //               color: darkBlueColor, shape: BoxShape.circle),
              //           child: Center(
              //             child: Icon(
              //               Icons.add,
              //               color: whiteColor,
              //               size: 40,
              //             ),
              //           ),
              //         )
              //       ],
              //     ),
              //   ),
              // )
            ],
          ),
          // bottomNavigationBar: BottomAppBar(
          //   color: Colors.white,
          //   elevation: 0,
          //   child: Container(
          //     padding: EdgeInsets.symmetric(horizontal: 18, vertical: 12),
          //     child: Row(
          //       mainAxisAlignment: MainAxisAlignment.end,
          //       children: [
          //         Container(
          //           width: 50,
          //           height: 50,
          //           decoration: BoxDecoration(
          //               color: darkBlueColor, shape: BoxShape.circle),
          //           child: Center(
          //             child: Icon(
          //               Icons.add,
          //               color: whiteColor,
          //               size: 35,
          //             ),
          //           ),
          //         )
          //       ],
          //     ),
          //   ),
          // ),
        ),
      ),
    );
  }
}
