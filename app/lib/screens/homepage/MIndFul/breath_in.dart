import 'dart:async';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:time_range_picker/time_range_picker.dart';
import 'package:wellbe/provider/mindful_provider.dart';
import 'package:wellbe/screens/homepage/MoodSpace/mood_space.dart';
import 'package:wellbe/screens/homepage/Recomendation/recomendation_screen.dart';
import 'package:wellbe/widgets/custom_parent_widget.dart';

import '../../../provider/MoodProvider/mood_provider.dart';
import '../../../provider/insight_provider.dart';
import '../../../utilites/colors.dart';
import '../../../utilites/helper.dart';
import '../../../widgets/custom_inkwell_btn.dart';
import '../../../widgets/custom_text.dart';

import '../HomeScreens/homepage_screen.dart';
import 'info_screen.dart';

class BreathIn extends StatefulWidget {
  String? screenName;

  BreathIn({this.screenName});

  @override
  State<BreathIn> createState() => _BreathInState();
}

class _BreathInState extends State<BreathIn> {
  int selectedMinute = 0;

  // countdown timer

  int _timeLeft = 0;
  bool timerStarted = false;
  Timer? _timer;

  void toggleTimer() {
    _timeLeft = 0;
    setState(() {});
    // if (selectedMinute != 0) {
    //   selectedMinute = 0;
    //   _timeLeft = 0;
    //   setState(() {});
    // }
    const oneSec = Duration(seconds: 1);
    _timer?.cancel();
    _timer = Timer.periodic(oneSec, (Timer t) {
      if (selectedMinute == 0) {
        debugPrint('selected ==o,this condition is callled');

        if (_timeLeft < -1) {
          t.cancel();
        } else {
          setState(() {
            _timeLeft = _timeLeft + 1;
          });
        }
      } else {
        debugPrint('selected !=o,this condition is callled');
        debugPrint('${_timeLeft}');
        debugPrint('${selectedMinute * 60}');

        if (_timeLeft > selectedMinute * 60) {
          _timeLeft = _timeLeft - 1;
          t.cancel();
        } else {
          setState(() {
            _timeLeft = _timeLeft + 1;
          });
        }
      }
    });
  }

  void limitedtoggleTimer() {
    const oneSec = Duration(seconds: 1);
    _timer?.cancel();
    _timer = Timer.periodic(oneSec, (Timer t) {
      if (_timeLeft > selectedMinute) {
        t.cancel();
      } else {
        setState(() {
          _timeLeft = _timeLeft + 1;
        });
      }
    });
  }

  void TimePickerDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return Consumer<MoodProvider>(builder: (context, moodProvider, child) {
          return StatefulBuilder(builder: (context, setState) {
            DateTime currentTime = DateTime.now();
            DateTime endTime = currentTime.add(Duration(
                minutes:
                    1)); // Default end time is one minute from current time
            DateFormat timeFormat = DateFormat("HH:mm");
            String fotmatedStartTime = timeFormat.format(currentTime);
            String fotmatedEndTime = timeFormat.format(endTime);
            return Dialog(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
              child: Container(
                padding: EdgeInsets.all(16),
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
                    SizedBox(height: 4),
                    Image.asset(
                      'assets/icons/timer.png',
                      color: blueColor,
                      fit: BoxFit.cover,
                      width: 50,
                    ),
                    SizedBox(height: 5),
                    CustomText(
                      title: 'Breath Time',
                      fontWeight: FontWeight.w700,
                      color: blackColor,
                      fontSize: 18,
                    ),
                    SizedBox(height: 5),
                    SizedBox(
                      height: 70,
                      child: ListWheelScrollView(
                        itemExtent: 30,
                        diameterRatio: 2,
                        squeeze: 1,
                        physics: FixedExtentScrollPhysics(),
                        children: List.generate(30, (index) {
                          final minute = index + 1;
                          final isSelected = minute == selectedMinute;

                          return Container(
                            alignment: Alignment.center,
                            child: CustomText(
                              title: '$minute min',
                              fontSize: 13,
                              fontWeight: isSelected
                                  ? FontWeight.w600
                                  : FontWeight.normal,
                              color: isSelected ? blueColor : greyColor,
                            ),
                          );
                        }),
                        onSelectedItemChanged: (index) {
                          selectedMinute = index + 1;
                          setState(() {});

                          endTime = currentTime
                              .add(Duration(minutes: selectedMinute));
                          fotmatedEndTime = timeFormat.format(endTime);

                          debugPrint('Selected minute: $selectedMinute');
                        },
                      ),
                    ),
                    SizedBox(height: 20),
                    GestureDetector(
                      onTap: () {
                        debugPrint(
                            '<<<startime:${fotmatedStartTime}   endtime:${fotmatedEndTime}');

                        moodProvider.addUserBreathing(
                            moodProvider.moodId,
                            moodProvider.subMoodId,
                            fotmatedStartTime,
                            fotmatedEndTime, (isverfied, message) {
                          if (isverfied) {
                            timerStarted = true;
                            toggleTimer();
                            Navigator.pop(context);
                            Helper.showSnack(context, message);
                          }
                        }, context);
                        // Helper.toScreen(context, BreathIn());
                      },
                      child: Container(
                        padding:
                            EdgeInsets.symmetric(horizontal: 42, vertical: 13),
                        child: Text(
                          'Set Timer',
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w500,
                              fontSize: 14),
                        ),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(30),
                            color: darkBlueColor),
                      ),
                    ),
                    SizedBox(height: 20),
                  ],
                ),
              ),
            );
          });
        });
      },
    );
  }

  void _openDoneDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return Material(
          color: Colors.transparent,
          child: Consumer<MoodSpaceProvider>(
              builder: (context, moodSpaceProvider, child) {
            return Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 33, vertical: 50),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Container(
                    padding: EdgeInsets.all(16),
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
                          title: 'Well Done !',
                          fontSize: 20,
                          fontWeight: FontWeight.w600,
                          color: blackColor,
                          textAlign: TextAlign.center,
                        ),
                        SizedBox(height: 12),
                        Text(
                          'Congraulation\nsteps completed successfully',
                          style: TextStyle(
                              fontSize: 13,
                              color: blackColor,
                              fontWeight: FontWeight.w500),
                          textAlign: TextAlign.center,
                        ),
                        SizedBox(height: 16),
                        Row(
                          children: [
                            Expanded(
                              child: Divider(
                                height: 1,
                                color: mediumGreyColor,
                                thickness: 0.8,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 10),
                        Text(
                          'There are many variations of passages of\nbut the majority have suffered alteration in\nsame form',
                          style: TextStyle(
                              fontSize: 13,
                              color: textGreyColor2,
                              fontWeight: FontWeight.w500),
                          textAlign: TextAlign.center,
                        ),
                        SizedBox(height: 16),
                        // moodSpaceProvider.isThoughtPage
                        //     ?
                        // Row(
                        //         mainAxisAlignment:
                        //             MainAxisAlignment.spaceEvenly,
                        //         children: [
                        //           Expanded(
                        //             child: ElevatedButton(
                        //               onPressed: () {
                        //                 // Perform action for the first button
                        //                 Navigator.pop(context);
                        //                 Helper.toScreen(
                        //                     context,
                        //                     HomePageScreen(
                        //                       index: 3,
                        //                     ));
                        //               },
                        //               child: CustomText(
                        //                   title: 'Consult',
                        //                   color: Colors.white,
                        //                   fontSize: 11),
                        //               style: ElevatedButton.styleFrom(
                        //                 backgroundColor: darkBlueColor,
                        //                 foregroundColor: Colors.white,
                        //                 shape: RoundedRectangleBorder(
                        //                   borderRadius:
                        //                       BorderRadius.circular(60),
                        //                 ),
                        //               ),
                        //             ),
                        //           ),
                        //           const SizedBox(
                        //             width: 4,
                        //           ),
                        //           Expanded(
                        //             child: ElevatedButton(
                        //               onPressed: () async {
                        //                 // Perform action for the second button
                        //                 Navigator.pop(context);
                        //
                        //                 Helper.toRemoveUntiScreen(
                        //                     context,
                        //                     HomePageScreen(
                        //                       index: 1,
                        //                     ));
                        //                 await Future.delayed(
                        //                     Duration(milliseconds: 200));
                        //                 moodSpaceProvider.tabNavigate(
                        //                     context, 2,
                        //                     isInitial: true);
                        //               },
                        //               child: CustomText(
                        //                 title: 'Back to Thoughts',
                        //                 fontSize: 11,
                        //                 color: Colors.white,
                        //               ),
                        //               style: ElevatedButton.styleFrom(
                        //                 backgroundColor: darkBlueColor,
                        //                 foregroundColor: Colors.white,
                        //                 shape: RoundedRectangleBorder(
                        //                   borderRadius:
                        //                       BorderRadius.circular(60),
                        //                 ),
                        //               ),
                        //             ),
                        //           ),
                        //         ],
                        //       )
                        // :
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            ElevatedButton(
                              onPressed: () async {
                                // Perform action for the first button
                                if (moodSpaceProvider.isThoughtPage) {
                                  Navigator.pop(context);
                                  Navigator.pop(context);
                                } else if (Provider.of<InsightProvider>(context,
                                            listen: false)
                                        .isInsight &&
                                    widget.screenName == null) {
                                  Navigator.of(context, rootNavigator: true)
                                      .pop(context);
                                  Navigator.of(context, rootNavigator: true)
                                      .pop(context);
                                  Navigator.of(context, rootNavigator: true)
                                      .pop(context);
                                  Navigator.of(context, rootNavigator: true)
                                      .pop(context);
                                } else if (widget.screenName ==
                                    'recommendationScreen') {
                                  Navigator.of(context, rootNavigator: true)
                                      .pop(context);
                                  Navigator.of(context, rootNavigator: true)
                                      .pop(context);
                                } else {
                                  debugPrint('this condition is called');
                                  Navigator.of(context, rootNavigator: true)
                                    ..pop()
                                    ..pop()
                                    ..pop();
                                }

                                if (!Provider.of<InsightProvider>(context,
                                        listen: false)
                                    .isInsight) {
                                  Provider.of<InsightProvider>(context,
                                          listen: false)
                                      .onInsightChange(true);
                                }

                                // Helper.toScreen(
                                //     context, HomePageScreen(index: 2));
                                // await Future.delayed(
                                //     Duration(milliseconds: 200));
                                // moodSpaceProvider.controller!
                                //     .animateTo(2);
                              },
                              child: CustomText(
                                  title: 'OK',
                                  color: Colors.white,
                                  fontSize: 11),
                              style: ElevatedButton.styleFrom(
                                backgroundColor: darkBlueColor,
                                foregroundColor: Colors.white,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(60),
                                ),
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              ],
            );
          }),
        );
      },
    );
  }

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
                Image.asset(
                  'assets/icons/achieve_popup.png',
                  width: 70, // Replace with your image asset path
                  height: 70,
                ),
                SizedBox(height: 16),
                CustomText(
                  title: 'Great Achievement',
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                  color: blackColor,
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 12),
                Text(
                  'There are many variations of passages of\nbut the majority have suffered alteration in\nsame form',
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
                        },
                        child: CustomText(
                            title: 'Try Again',
                            color: Colors.white,
                            fontSize: 12),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: darkBlueColor,
                          foregroundColor: Colors.white,
                          shape: RoundedRectangleBorder(
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
                          Helper.toScreen(context, MoodSpace());
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
      child: Consumer2<MoodSpaceProvider, MoodProvider>(
          builder: (context, moodSpaceProvider, moodProvider, child) {
        return WillPopScope(
          onWillPop: () async {
            debugPrint(Provider.of<InsightProvider>(context, listen: false)
                .isInsight
                .toString());
            if (moodSpaceProvider.isThoughtPage) {
              Navigator.of(context, rootNavigator: true).pop(context);
            } else if (Provider.of<InsightProvider>(context, listen: false)
                    .isInsight &&
                widget.screenName == null) {
              debugPrint('insight true condition');

              Navigator.of(context, rootNavigator: true).pop(context);
              Navigator.of(context, rootNavigator: true).pop(context);
              Navigator.of(context, rootNavigator: true).pop(context);
            } else if (widget.screenName == 'recommendationScreen') {
              Navigator.of(context, rootNavigator: true).pop(context);
            } else {
              Navigator.of(context, rootNavigator: true).pop(context);
              Navigator.of(context, rootNavigator: true).pop(context);
            }

            if (!Provider.of<InsightProvider>(context, listen: false)
                .isInsight) {
              Provider.of<InsightProvider>(context, listen: false)
                  .onInsightChange(true);
            }
            return true;
          },
          child: Scaffold(
            backgroundColor: kPrimaryColor,
            appBar: AppBar(
              elevation: 0,
              centerTitle: false,
              automaticallyImplyLeading: false,
              backgroundColor: kPrimaryColor,
              title: CustomText(
                title: "Anapana Technique",
                fontSize: 17,
                color: blackColor,
                fontWeight: FontWeight.w700,
              ),
              actions: [
                CustomInkWell(
                  onTap: () async {
                    debugPrint(
                        Provider.of<InsightProvider>(context, listen: false)
                            .isInsight
                            .toString());
                    if (moodSpaceProvider.isThoughtPage) {
                      Navigator.of(context, rootNavigator: true).pop(context);
                    } else if (Provider.of<InsightProvider>(context,
                                listen: false)
                            .isInsight &&
                        widget.screenName == null) {
                      debugPrint('insight true condition');

                      Navigator.of(context, rootNavigator: true).pop(context);
                      Navigator.of(context, rootNavigator: true).pop(context);
                      Navigator.of(context, rootNavigator: true).pop(context);
                    } else if (widget.screenName == 'recommendationScreen') {
                      Navigator.of(context, rootNavigator: true).pop(context);
                    } else {
                      Navigator.of(context, rootNavigator: true).pop(context);
                      Navigator.of(context, rootNavigator: true).pop(context);
                    }

                    if (!Provider.of<InsightProvider>(context, listen: false)
                        .isInsight) {
                      Provider.of<InsightProvider>(context, listen: false)
                          .onInsightChange(true);
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
            body: Column(children: [
              SizedBox(
                height: 10,
              ),
              Divider(
                height: 1,
                thickness: 1,
                color: Colors.white,
                indent: 18,
                endIndent: 18,
              ),
              const SizedBox(
                height: 50,
              ),
              Image.asset(
                'assets/icons/breath_in.png',
                width: 210,
              ),
              SizedBox(
                height: 20,
              ),
              CustomText(
                title: 'Breath In',
                fontWeight: FontWeight.w600,
                fontSize: 15,
              ),
              SizedBox(
                height: 90,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CustomInkWell(
                    onTap: () {
                      _openDoneDialog(context);
                      // setState(() {
                      //   if (timerStarted) {
                      //     final currentTime = DateTime.now();
                      //     final dateFormat = DateFormat("HH:mm");
                      //
                      //     final countedTime = _timeLeft;
                      //     final endTime =
                      //         currentTime.add(Duration(seconds: countedTime));
                      //     timerStarted = false;
                      //     _timer?.cancel();
                      //     moodProvider.addUserBreathing(
                      //         moodProvider.moodId,
                      //         moodProvider.subMoodId,
                      //         dateFormat.format(currentTime),
                      //         DateFormat("HH:mm")
                      //             .format(endTime)
                      //             .toString()
                      //             .padLeft(2, '0'), (isverfied, message) {
                      //       if (isverfied) {
                      //         Helper.showSnack(context, message);
                      //       }
                      //     }, context);
                      //   } else {
                      //     timerStarted = true;
                      //     toggleTimer();
                      //   }
                      // });
                    },
                    child: timerStarted
                        ? Image.asset(
                            'assets/icons/pause_01.png',
                            width: 60,
                          )
                        : Image.asset(
                            'assets/icons/play_02.png',
                            width: 60,
                          ),
                  ),
                ],
              ),
              SizedBox(
                height: 7,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CustomText(
                    title:
                        '${_timeLeft ~/ 60}:${(_timeLeft % 60).toString().padLeft(2, '0')}',
                    color: greyColor,
                    fontSize: 12,
                    fontWeight: FontWeight.w600,
                  )
                ],
              ),
              const SizedBox(
                height: 25,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CustomInkWell(
                    onTap: () {
                      Helper.toScreen(context, InfoScreen());
                    },
                    child: Container(
                      padding: EdgeInsets.only(right: 50),
                      decoration: BoxDecoration(
                          color: Color(0xFFe2f2ff),
                          borderRadius: BorderRadius.circular(25)),
                      child: Row(
                        children: [
                          Image.asset(
                            'assets/icons/info_01.png',
                            width: 40,
                          ),
                          CustomText(
                            title: 'info',
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 18,
                  ),
                  CustomInkWell(
                    onTap: () async {
                      TimePickerDialog(context);
                    },
                    child: Container(
                      padding: EdgeInsets.only(right: 30),
                      decoration: BoxDecoration(
                          color: Color(0xFFe2f2ff),
                          borderRadius: BorderRadius.circular(25)),
                      child: Row(
                        children: [
                          Image.asset(
                            'assets/icons/timer_02.png',
                            width: 40,
                          ),
                          CustomText(
                            title: 'Set timer',
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              )
            ]),
          ),
        );
      }),
    );
  }
}
