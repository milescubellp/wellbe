import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wellbe/screens/homepage/VentOut/heading_form.dart';
import 'package:wellbe/screens/homepage/VentOut/ventout_screen.dart';
import 'package:wellbe/screens/homepage/VentOut/write_your_post.dart';
import 'package:wellbe/widgets/custom_parent_widget.dart';

import '../../../provider/mindful_provider.dart';
import '../../../utilites/colors.dart';
import '../../../utilites/helper.dart';
import '../../../widgets/custom_inkwell_btn.dart';
import '../../../widgets/custom_text.dart';
import '../../../widgets/custom_textfield.dart';

class EditYourPost extends StatelessWidget {
  void _openDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return Dialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          child: Container(
            padding: EdgeInsets.all(16),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Container(
                  // 'assets/icons/delete_popup.png',
                  width: 70, // Replace with your image asset path
                  height: 70,
                ),
                SizedBox(height: 16),
                CustomText(
                  title: 'Wait',
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                  color: blackColor,
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 12),
                Text(
                  'Do you want to edit this comment?',
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
                          Navigator.pop(context);
                        },
                        child: CustomText(
                            title: 'No', color: darkBlueColor, fontSize: 12),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.white,
                          shape: RoundedRectangleBorder(
                            side: BorderSide(color: darkBlueColor),
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
                          // Helper.toScreen(context, MoodSpace());
                          Navigator.pop(context);
                          _openDoneDialog(context);
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
      },
    );
  }

  void _openDoneDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return Dialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          child: Container(
            padding: EdgeInsets.all(16),
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
                  title: 'Done!',
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                  color: blackColor,
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 12),
                Text(
                  'Your comment has been edited successfully',
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
                    SizedBox(
                      width: 60,
                      child: ElevatedButton(
                        onPressed: () {
                          // Perform action for the second button
                          Navigator.of(context, rootNavigator: true).pop(
                            context,
                          );
                          Navigator.of(context, rootNavigator: true).pop(
                            context,
                          );
                        },
                        child: CustomText(
                          title: 'ok',
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
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return CustomParentWidget(
      child: Scaffold(
        appBar: AppBar(
          elevation: 0,
          centerTitle: false,
          automaticallyImplyLeading: false,
          backgroundColor: Colors.white,
          title: CustomText(
            title: "Edit Your Post",
            fontSize: 17,
            color: blackColor,
            fontWeight: FontWeight.w700,
          ),
          actions: [
            CustomInkWell(
              onTap: () {
                Navigator.pop(context);
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
            ),
          ],
        ),
        body: SingleChildScrollView(
            child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 18.0),
              child: Row(
                children: [
                  Container(
                    padding: EdgeInsets.all(3),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        shape: BoxShape.circle,
                        boxShadow: [
                          BoxShadow(
                              spreadRadius: 4,
                              blurRadius: 1,
                              color: lightGrey,
                              offset: Offset(1, 1))
                        ]),
                    child: CircleAvatar(
                        radius: 17,
                        backgroundImage: AssetImage(
                          'assets/icons/user_03.png',
                        )),
                  ),
                  const SizedBox(
                    width: 9,
                  ),
                  Row(
                    children: [
                      CustomText(
                        title: 'You',
                        fontWeight: FontWeight.w600,
                        color: blackColor,
                        fontSize: 12.5,
                      ),
                      const SizedBox(
                        width: 5,
                      ),
                      CustomText(
                        title: '| 20 April 2023',
                        fontWeight: FontWeight.w500,
                        color: textGreyColor,
                        fontSize: 12.5,
                      ),
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 15,
            ),

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 18.0),
              child: CustomTextField(
                hintText: 'Forum Discussion 01',
                hintWeight: FontWeight.bold,
                hintTextColor: Colors.black,
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
                padding: EdgeInsets.fromLTRB(15, 27, 15, 15),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  border: Border.all(
                    color: hintTextColor,
                  ),
                ),
                child: Column(children: [
                  CustomTextField(
                    isOutlineInputBorder: false,
                    isUnderlineInputBorder: false,
                    hintTextColor: hintTextColor,
                    hintFontSize: 13,
                    maxLines: 17,
                    hintText: 'Type your answer here...',
                  )
                ]),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 18.0),
              child: Row(
                children: [
                  StylishSwitchButton(
                    initialValue: false,
                    onChanged: (value) {
                      // Handle switch button value change here
                    },
                  ),
                  SizedBox(width: 8.0),
                  CustomText(
                    title: 'Posting as Anonymous',
                    fontSize: 12,
                    color: mediumGreyColor,
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 60,
            ),

            //BUTTON
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 18.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  GestureDetector(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: Container(
                        padding:
                            EdgeInsets.symmetric(horizontal: 33, vertical: 12),
                        child: Text(
                          'Cancel',
                          style: TextStyle(
                              color: darkBlueColor,
                              fontWeight: FontWeight.w700,
                              fontSize: 14),
                        ),
                        decoration: BoxDecoration(
                            border: Border.all(color: darkBlueColor),
                            borderRadius: BorderRadius.circular(30),
                            color: Colors.white),
                      )),
                  const SizedBox(
                    width: 10,
                  ),
                  GestureDetector(
                      onTap: () {
                        _openDialog(context);
                      },
                      child: Container(
                        padding:
                            EdgeInsets.symmetric(horizontal: 37, vertical: 12),
                        child: Text(
                          'Save',
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
        )),
      ),
    );
  }
}
