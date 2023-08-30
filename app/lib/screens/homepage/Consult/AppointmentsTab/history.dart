import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wellbe/screens/homepage/HomeScreens/homepage_screen.dart';

import '../../../../provider/profile_provider.dart';
import '../../../../utilites/colors.dart';
import '../../../../utilites/helper.dart';
import '../../../../widgets/custom_inkwell_btn.dart';
import '../../../../widgets/custom_text.dart';
import '../../../Profile/my_m_c_i_report.dart';

class History extends StatelessWidget {
  void _rangeDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return Consumer<ProfileProvider>(
            builder: (context, profileProvider, child) {
          return StatefulBuilder(builder: (context, setState) {
            return Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 18.0),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                    child: Material(
                      child: Container(
                        padding: EdgeInsets.all(16),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                CustomInkWell(
                                  onTap: () {
                                    Navigator.pop(context);
                                  },
                                  child: Image.asset(
                                    'assets/icons/close.png',
                                    color: mediumGreyColor,
                                  ),
                                )
                              ],
                            ),
                            SizedBox(height: 5),
                            CustomText(
                              title:
                                  'How was your experience\nDr James William',
                              fontWeight: FontWeight.w700,
                              color: blackColor,
                              textAlign: TextAlign.center,
                              fontSize: 15,
                            ),
                            SizedBox(height: 5),
                            Stack(
                              alignment: Alignment.center,
                              clipBehavior: Clip.none,
                              children: [
                                SliderTheme(
                                  data: SliderTheme.of(context).copyWith(
                                    thumbShape: CustomThumbShape(),
                                  ),
                                  child: Slider(
                                    value: profileProvider.sliderValue,
                                    min: 0.0,
                                    max: 100.0,
                                    onChanged: (newValue) {
                                      profileProvider.onChangeSlider(newValue);
                                      // THIS IS THE LOGIC THATS BEEN USED FOR SLIDER VALUE TO MOVE ALONG WITH THUMB
                                      // print(
                                      //     (MediaQuery.of(context).size.width - 26).toString());
                                      // print(((profileProvider.sliderValue / 100.0) *
                                      //         (MediaQuery.of(context).size.width - 32))
                                      //     .toInt()
                                      //     .toString());
                                    },
                                  ),
                                ),
                                const SizedBox(
                                  height: 20,
                                ),
                                Positioned(
                                  left: (profileProvider.sliderValue / 100.0) *
                                      (MediaQuery.of(context).size.width - 32),
                                  top:
                                      -6.0, // Adjust the vertical position of the CustomText widget
                                  child: Row(
                                    children: [
                                      Image.asset(
                                        'assets/icons/star_01.png',
                                        width: 11,
                                        color: greyColor,
                                      ),
                                      CustomText(
                                        fontSize: 11,
                                        color: greyColor,
                                        title: profileProvider.sliderValue
                                            .toInt()
                                            .toString(),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 20.0),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Row(
                                    children: [
                                      Image.asset(
                                        'assets/icons/star_01.png',
                                        width: 11,
                                        color: greyColor,
                                      ),
                                      CustomText(
                                        fontSize: 11,
                                        color: greyColor,
                                        title: '0',
                                      ),
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      CustomText(
                                        fontSize: 11,
                                        color: greyColor,
                                        title: '5',
                                      ),
                                      Image.asset(
                                        'assets/icons/star_01.png',
                                        width: 11,
                                        color: greyColor,
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(height: 10),
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 20.0),
                              child: Row(
                                children: [
                                  CustomText(
                                    title: 'comment',
                                    color: blackColor,
                                    fontSize: 12,
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(height: 10),
                            Container(
                              padding: EdgeInsets.symmetric(horizontal: 50),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(13),
                                border: Border.all(
                                  color: Colors.grey,
                                ),
                              ),
                              child: Stack(
                                children: [
                                  TextField(
                                    decoration: InputDecoration(
                                      hintText: 'Type your comment here',
                                      hintStyle: TextStyle(
                                          fontSize: 12,
                                          fontWeight: FontWeight.w500,
                                          color: greyColor),
                                      border: InputBorder.none,
                                      contentPadding:
                                          EdgeInsets.symmetric(vertical: 10),
                                    ),
                                    maxLines: 5,
                                  ),
                                  // Positioned(
                                  //   bottom: 0,
                                  //   right: 0,
                                  //   child: Container(
                                  //     width: 40,
                                  //     height: 40,
                                  //     decoration: BoxDecoration(
                                  //       border: Border(
                                  //         top: BorderSide(
                                  //           color: Colors.grey,
                                  //           width: 2,
                                  //         ),
                                  //         right: BorderSide(
                                  //           color: Colors.grey,
                                  //           width: 2,
                                  //         ),
                                  //       ),
                                  //     ),
                                  //   ),
                                  // ),
                                ],
                              ),
                            ),
                            SizedBox(height: 20),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Expanded(
                                  child: ElevatedButton(
                                    onPressed: () {
                                      // Perform action for the first button

                                      // _openSuccessfulDialog(context);
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
                                      padding: EdgeInsets.symmetric(
                                          vertical: 2, horizontal: 7),
                                      shape: RoundedRectangleBorder(
                                        side: BorderSide(
                                            width: 2, color: blueColor),
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
                                      // Helper.toScreen(context, HomePageScreen());
                                      Navigator.pop(context);
                                    },
                                    child: CustomText(
                                      title: 'Submit',
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
                            SizedBox(height: 20),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            );
          });
        });
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
                          width: 7,
                        ),
                        SizedBox(
                          height: 29,
                          child: ElevatedButton(
                            onPressed: () {
                              // Perform action for the first button
                              _rangeDialog(context);
                              // Helper.toScreen(context, DoctorDetails());
                            },
                            child: CustomText(
                                title: 'You Rated 4.0',
                                color: blueColor,
                                fontWeight: FontWeight.bold,
                                fontSize: 11),
                            style: ElevatedButton.styleFrom(
                              backgroundColor: kPrimaryColor,
                              foregroundColor: Colors.white,
                              elevation: 0,
                              padding: EdgeInsets.symmetric(
                                  vertical: 0, horizontal: 10),
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
                          width: 30,
                        ),
                        SizedBox(
                          height: 29,
                          child: ElevatedButton(
                            onPressed: () {
                              // Perform action for the first button

                              // Helper.toScreen(context, DoctorDetails());
                            },
                            child: CustomText(
                                title: 'Canceled',
                                color: blueColor,
                                fontWeight: FontWeight.bold,
                                fontSize: 11),
                            style: ElevatedButton.styleFrom(
                              backgroundColor: orangeColor2.withOpacity(0.5),
                              foregroundColor: Colors.white,
                              elevation: 0,
                              padding: EdgeInsets.symmetric(
                                  vertical: 0, horizontal: 10),
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
      ],
    );
  }
}
