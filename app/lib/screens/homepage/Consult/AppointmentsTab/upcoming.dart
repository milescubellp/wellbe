import 'package:flutter/material.dart';
import 'package:wellbe/screens/homepage/Consult/consult.dart';

import '../../../../utilites/colors.dart';
import '../../../../utilites/helper.dart';
import '../../../../widgets/custom_text.dart';
import '../../HomeScreens/homepage_screen.dart';

class Upcoming extends StatelessWidget {
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
                  title: 'Wait Up!',
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                  color: blackColor,
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 12),
                Text(
                  'Are you sure to cancel the appointment\nwith Dr James William',
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

                          // Helper.toScreen(context, DoctorDetails());
                        },
                        child: CustomText(
                            title: 'Cancel',
                            color: blueColor,
                            fontWeight: FontWeight.bold,
                            fontSize: 12),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.transparent,
                          foregroundColor: Colors.white,
                          elevation: 0,
                          padding:
                              EdgeInsets.symmetric(vertical: 2, horizontal: 7),
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
                          Navigator.pop(context);
                          _openSuccessfulDialog(context);
                        },
                        child: CustomText(
                          title: 'Confirm',
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
                  title: 'Cancelled Successfully',
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                  color: blackColor,
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 12),
                Text(
                  'Your appointment with James Willian\nhas been canceled',
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
                        Navigator.pop(context);
                        // Helper.toScreen(context, HomePageScreen());
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
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(
          height: 20,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 18.0),
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
            decoration: BoxDecoration(
                color: Colors.white,
                border: Border.all(color: darkGreyColor),
                borderRadius: BorderRadius.circular(8)),
            child: Row(
              children: [
                Container(
                  width: 80,
                  height: 86,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      image: DecorationImage(
                          fit: BoxFit.cover,
                          image: AssetImage("assets/icons/slider_01.png"))),
                  clipBehavior: Clip.hardEdge,
                ),
                //Space
                SizedBox(
                  width: 17,
                ),
                //
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CustomText(
                      title: "Dr James William",
                      fontSize: 13,
                      color: blackColor,
                      fontWeight: FontWeight.w700,
                    ),
                    CustomText(
                      title: "Cardiologist",
                      fontSize: 11,
                      color: greyColor,
                      fontWeight: FontWeight.w700,
                    ),

                    //Space
                    SizedBox(
                      height: 8,
                    ),
                    Row(
                      children: [
                        CustomText(
                          title: "Type",
                          fontSize: 11,
                          color: greyColor,
                          fontWeight: FontWeight.w700,
                        ),
                        const SizedBox(
                          width: 4,
                        ),
                        CustomText(
                          title: "Video Call",
                          fontSize: 11,
                          color: textGreyColor2,
                          fontWeight: FontWeight.w700,
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                CustomText(
                                  title: "Date",
                                  fontSize: 11,
                                  color: greyColor,
                                  fontWeight: FontWeight.w700,
                                ),
                                const SizedBox(
                                  width: 4,
                                ),
                                CustomText(
                                  title: "28 April 2023",
                                  fontSize: 11,
                                  color: textGreyColor2,
                                  fontWeight: FontWeight.w700,
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                CustomText(
                                  title: "Time",
                                  fontSize: 11,
                                  color: greyColor,
                                  fontWeight: FontWeight.w700,
                                ),
                                const SizedBox(
                                  width: 4,
                                ),
                                CustomText(
                                  title: "12.00 PM",
                                  fontSize: 11,
                                  color: textGreyColor2,
                                  fontWeight: FontWeight.w700,
                                ),
                              ],
                            ),
                          ],
                        ),
                        SizedBox(
                          width: 40,
                        ),
                        SizedBox(
                          height: 24,
                          child: ElevatedButton(
                            onPressed: () {
                              // Perform action for the first button
                              _openDialog(context);
                              // Helper.toScreen(context, DoctorDetails());
                            },
                            child: CustomText(
                                title: 'Cancel',
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
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 18.0),
          child: Row(
            children: [
              Image.asset(
                'assets/icons/info_01.png',
                width: 22,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CustomText(
                    fontSize: 11,
                    color: greyColor,
                    title: 'You cannot cancel appointment 30 min before',
                  ),
                  Row(
                    children: [
                      CustomText(
                        fontSize: 11,
                        color: greyColor,
                        title: 'Scheduled time',
                      ),
                      const SizedBox(
                        width: 4,
                      ),
                      CustomText(
                        fontSize: 11,
                        color: textGreyColor2,
                        fontWeight: FontWeight.w700,
                        decoration: TextDecoration.underline,
                        title: 'T&C',
                      ),
                    ],
                  ),
                ],
              )
            ],
          ),
        ),
      ],
    );
  }
}
