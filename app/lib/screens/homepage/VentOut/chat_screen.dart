import 'dart:async';

import 'package:flutter/material.dart';
import 'package:persistent_bottom_nav_bar_v2/persistent-tab-view.dart';
import 'package:provider/provider.dart';
import 'package:wellbe/provider/mindful_provider.dart';
import 'package:wellbe/provider/ventout_provider.dart';
import 'package:wellbe/screens/homepage/HomeScreens/homepage_screen.dart';
import 'package:wellbe/screens/homepage/VentOut/ventout_screen.dart';
import 'package:wellbe/utilites/helper.dart';
import 'package:wellbe/widgets/custom_parent_widget.dart';

import '../../../provider/profile_provider.dart';
import '../../../utilites/colors.dart';
import '../../../widgets/custom_inkwell_btn.dart';
import '../../../widgets/custom_text.dart';
import '../../Profile/my_m_c_i_report.dart';

class ChatScreen extends StatefulWidget {
  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  BuildContext? _dialogContext;
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
                  'assets/icons/done_popup.png',
                  width: 70, // Replace with your image asset path
                  height: 70,
                ),
                SizedBox(height: 16),
                CustomText(
                  title: 'Great!',
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                  color: blackColor,
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 12),
                Text(
                  'Hope Your Conversation\n with James Williams helpful for you',
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
                        onPressed: () async {
                          // Perform action for the first button
                          if (Provider.of<VentoutProvider>(context,
                                  listen: false)
                              .isStartConversationScreen) {
                            Helper.toScreen(
                                context,
                                HomePageScreen(
                                  index: 4,
                                ));
                            await Future.delayed(Duration(milliseconds: 200));
                            Provider.of<MoodSpaceProvider>(context,
                                    listen: false)
                                .controller!
                                .animateTo(1);
                          } else {
                            Helper.toScreen(
                                context,
                                HomePageScreen(
                                  index: 3,
                                ));
                          }

                          Provider.of<VentoutProvider>(context, listen: false)
                              .onisStartConversationScreenChange(false);
                          // Helper.toScreen(context, DoctorDetails());
                        },
                        child: CustomText(
                            title: 'Back to Home',
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
                          _rangeDialog(context);
                        },
                        child: CustomText(
                          title: "Rate Dr",
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

  void hider() {
    Navigator.pop(_dialogContext!);
  }

  void _timerDialog(BuildContext buildContext, String text) {
    showDialog(
      context: buildContext,
      builder: (BuildContext context) {
        _dialogContext = buildContext;

        return StatefulBuilder(builder: (context, setState) {
          return Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: MediaQuery.of(context).size.width * 0.8,
                height: MediaQuery.of(context).size.height * 0.4,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Material(
                  borderRadius: BorderRadius.circular(20),
                  child: Dialog(
                    elevation: 0,
                    backgroundColor: Colors.transparent,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Container(
                      padding: EdgeInsets.all(8),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          Image.asset(
                            'assets/icons/done_popup.png',
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
                            'Time remaining for appointment ${text}',
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
                                  onPressed: () async {
                                    Helper.toScreen(
                                        context,
                                        HomePageScreen(
                                          index: 0,
                                        ));

                                    // // Perform action for the first button
                                    // if (Provider.of<VentoutProvider>(context,
                                    //         listen: false)
                                    //     .isStartConversationScreen) {
                                    //   Helper.toScreen(
                                    //       context,
                                    //       HomePageScreen(
                                    //         index: 4,
                                    //       ));
                                    //   await Future.delayed(
                                    //       Duration(milliseconds: 200));
                                    //   Provider.of<MoodSpaceProvider>(context,
                                    //           listen: false)
                                    //       .controller!
                                    //       .animateTo(1);
                                    // } else {
                                    //   Helper.toScreen(
                                    //       context,
                                    //       HomePageScreen(
                                    //         index: 3,
                                    //       ));
                                    // }

                                    Provider.of<VentoutProvider>(context,
                                            listen: false)
                                        .onisStartConversationScreenChange(
                                            false);
                                    // Helper.toScreen(context, DoctorDetails());
                                  },
                                  child: CustomText(
                                      title: 'Back to Home',
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
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ],
          );
        });
      },
    );
  }

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
                                      _openSuccessfulDialog(context);
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

  void _openSuccessfulDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return Consumer<VentoutProvider>(
            builder: (context, ventoutProvider, child) {
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
                    title: 'Thanks your\nfor your response',
                    fontSize: 20,
                    fontWeight: FontWeight.w600,
                    color: blackColor,
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: 16),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ElevatedButton(
                        onPressed: () async {
                          // Perform action for the second button
                          Provider.of<VentoutProvider>(context, listen: false)
                              .onisBookedChange(true);
                          ventoutProvider.onisBookedChange(true);
                          Helper.toScreen(
                              context,
                              HomePageScreen(
                                index: 0,
                              ));

                          // if (Provider.of<VentoutProvider>(context,
                          //         listen: false)
                          //     .isStartConversationScreen) {
                          //   Helper.toScreen(
                          //       context,
                          //       HomePageScreen(
                          //         index: 4,
                          //       ));
                          //   await Future.delayed(Duration(milliseconds: 200));
                          //   Provider.of<MoodSpaceProvider>(context,
                          //           listen: false)
                          //       .controller!
                          //       .animateTo(1);
                          // } else {
                          //   Helper.toScreen(
                          //       context,
                          //       HomePageScreen(
                          //         index: 3,
                          //       ));
                          // }

                          Provider.of<VentoutProvider>(context, listen: false)
                              .onisStartConversationScreenChange(false);
                        },
                        child: CustomText(
                          title: 'Back to Home',
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
        });
      },
    );
  }

  Timer? _timer;
  int _start = 20;
  Duration _duration = Duration(hours: 2);

  String get countdownText {
    int minutes = _duration.inMinutes % 60;
    int seconds = _duration.inSeconds % 60;
    return '${_duration.inHours.toString().padLeft(2, '0')}:${minutes.toString().padLeft(2, '0')}:${seconds.toString().padLeft(2, '0')}';
  }

  void _startCountdown() {
    _timer = Timer.periodic(Duration(seconds: 1), (_) {
      setState(() {
        if (_duration.inSeconds > 0) {
          _duration -= Duration(seconds: 1);
        } else {
          hider();
          _timer!.cancel();
        }
      });
    });
  }

  @override
  void initState() {
    _startCountdown();
    Future.delayed(
      Duration(seconds: 0),
      () => _timerDialog(context, countdownText),
    );

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return CustomParentWidget(
      child: Consumer<MoodSpaceProvider>(
          builder: (context, moodSPaceProvider, child) {
        return WillPopScope(
          onWillPop: () async {
            if (Provider.of<VentoutProvider>(context, listen: false)
                .isStartConversationScreen) {
              Provider.of<VentoutProvider>(context, listen: false)
                  .onisBookedChange(true);
              Helper.toScreen(
                  context,
                  HomePageScreen(
                    index: 4,
                  ));
              await Future.delayed(Duration(milliseconds: 200));
              moodSPaceProvider.controller!.animateTo(1);
              Provider.of<VentoutProvider>(context, listen: false)
                  .onisStartConversationScreenChange(false);
            } else {
              Navigator.pop(context);
            }

            return true;
          },
          child: Scaffold(
            appBar: AppBar(
              elevation: 0,
              centerTitle: false,
              automaticallyImplyLeading: false,
              backgroundColor: Colors.white,
              title: CustomText(
                title: "Dr James Williams",
                fontSize: 17,
                color: blackColor,
                fontWeight: FontWeight.w700,
              ),
              actions: [
                CustomInkWell(
                  onTap: () async {
                    if (Provider.of<VentoutProvider>(context, listen: false)
                        .isStartConversationScreen) {
                      Provider.of<VentoutProvider>(context, listen: false)
                          .onisBookedChange(true);
                      Helper.toScreen(
                          context,
                          HomePageScreen(
                            index: 4,
                          ));
                      await Future.delayed(Duration(milliseconds: 200));
                      moodSPaceProvider.controller!.animateTo(1);
                      Provider.of<VentoutProvider>(context, listen: false)
                          .onisStartConversationScreenChange(false);
                    } else {
                      Navigator.pop(context);
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
                ),
              ],
            ),
            body: Column(
              children: [
                const SizedBox(
                  height: 20,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 18.0),
                  child: Column(
                    children: [
                      Row(
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
                                  'assets/icons/user_04.png',
                                )),
                          ),
                          const SizedBox(
                            width: 9,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              CustomText(
                                title: 'Dr',
                                fontWeight: FontWeight.w700,
                                color: blackColor,
                                fontSize: 13.5,
                              ),
                              const SizedBox(
                                width: 5,
                              ),
                              CustomText(
                                title: 'Today 10:40 am',
                                fontWeight: FontWeight.w500,
                                color: greyColor,
                                fontSize: 12.5,
                              ),
                            ],
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 8,
                      ),
                      Row(
                        children: [
                          Container(
                            padding: EdgeInsets.all(10),
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.only(
                                    bottomLeft: Radius.circular(10),
                                    topRight: Radius.circular(10),
                                    bottomRight: Radius.circular(10)),
                                color: kPrimaryColor),
                            child: CustomText(title: 'How are you'),
                          ),
                          Expanded(
                            flex: 2,
                            child: SizedBox(),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Row(
                        children: [
                          Expanded(
                            child: Column(
                              children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.end,
                                      children: [
                                        CustomText(
                                          title: 'You',
                                          fontWeight: FontWeight.w700,
                                          color: blackColor,
                                          fontSize: 13.5,
                                        ),
                                        const SizedBox(
                                          width: 5,
                                        ),
                                        CustomText(
                                          title: 'Today 10:40 am',
                                          fontWeight: FontWeight.w500,
                                          color: greyColor,
                                          fontSize: 12.5,
                                        ),
                                      ],
                                    ),
                                    const SizedBox(
                                      width: 8,
                                    ),
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
                                  ],
                                ),
                                const SizedBox(
                                  height: 8,
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    Container(
                                      padding: EdgeInsets.all(10),
                                      alignment: Alignment.center,
                                      decoration: BoxDecoration(
                                          borderRadius: BorderRadius.only(
                                              bottomLeft: Radius.circular(10),
                                              topLeft: Radius.circular(10),
                                              bottomRight: Radius.circular(10)),
                                          color:
                                              kPrimaryColor.withOpacity(0.6)),
                                      child: CustomText(title: 'How are you'),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          )
                        ],
                      )
                    ],
                  ),
                ),
              ],
            ),
            bottomNavigationBar: Container(
              height: 120.0,
              decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                      color: Colors.grey.withOpacity(0.1),
                      spreadRadius: 2,
                      blurRadius: 2,
                      offset: Offset(0, -3)),
                ],
                color: Colors.white,
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 18.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Row(
                      children: [
                        CustomText(
                          title: 'End this concersation ?',
                          fontSize: 12,
                        ),
                        const SizedBox(
                          width: 3,
                        ),
                        CustomInkWell(
                          onTap: () {
                            _openDialog(context);
                          },
                          child: CustomText(
                            title: 'Yes',
                            decoration: TextDecoration.underline,
                            color: blueColor,
                            fontSize: 15,
                          ),
                        )
                      ],
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    TextField(
                      decoration: InputDecoration(
                        constraints: BoxConstraints(
                          minHeight: 30.0,
                        ),
                        border: OutlineInputBorder(
                          borderSide: BorderSide(color: greyColor, width: 2),
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        hintText: 'Write your post...',
                        suffixIcon: CustomInkWell(
                          onTap: () {},
                          child: Image.asset(
                            'assets/icons/post_02.png',
                            scale: 1.1,
                          ),
                        ),
                        hintStyle: TextStyle(
                            fontWeight: FontWeight.w500, color: greyColor),
                        contentPadding: EdgeInsets.symmetric(
                            horizontal: 20.0, vertical: 15),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      }),
    );
  }
}
