import 'package:flutter/material.dart';
import 'package:flutter_date_pickers/flutter_date_pickers.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';
import 'package:time_range_picker/time_range_picker.dart';
import 'package:wellbe/provider/insight_provider.dart';
import 'package:wellbe/utilites/colors.dart';
import 'package:wellbe/widgets/custom_button.dart';
import 'package:wellbe/widgets/custom_inkwell_btn.dart';
import 'package:wellbe/widgets/custom_parent_widget.dart';
import 'package:wellbe/widgets/custom_text.dart';

import '../../../provider/MoodProvider/mood_provider.dart';
import '../../../utilites/helper.dart';
import 'month_tab.dart';
import 'today_tab.dart';
import 'week_tab.dart';

class InsightScreen extends StatefulWidget {
  final String? screenName;
  InsightScreen({Key? key, this.screenName}) : super(key: key);

  @override
  State<InsightScreen> createState() => _InsightScreenState();
}

class _InsightScreenState extends State<InsightScreen>
    with SingleTickerProviderStateMixin {
  DateTime selectedStartDate = DateTime.now();
  DateTime selectedEndDate = DateTime.now();
  TimeOfDay _selectedTime = TimeOfDay.now();

  void _showMonthPicker(MoodProvider moodProvider) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return StatefulBuilder(builder: (context, setState) {
          return AlertDialog(
            title: Text('Choose Month Range', style: TextStyle(fontSize: 18)),
            content: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                MonthPicker.single(
                  selectedDate: selectedStartDate,
                  datePickerStyles: DatePickerRangeStyles(
                    defaultDateTextStyle:
                        TextStyle(fontSize: 16, color: Colors.black),
                  ),
                  onChanged: (newDate) {
                    setState(() {
                      selectedStartDate = newDate;
                    });
                    debugPrint('start:${selectedStartDate}');
                  },
                  firstDate: DateTime.now().subtract(Duration(days: 45)),
                  lastDate: DateTime.now().add(Duration(days: 45)),
                ),
                SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () {
                    // Perform any action you want here with selectedStartDate and selectedEndDate

                    getMoodDateRange(
                        context,
                        moodProvider,
                        DateFormat('yyyy-MM-dd').format(selectedStartDate),
                        DateFormat('yyyy-MM-dd')
                            .format(selectedEndDate)); // Close the dialog
                  },
                  child: Text('Submit', style: TextStyle(fontSize: 16)),
                ),
              ],
            ),
          );
        });
      },
    );
  }

  void _showWeekPicker(MoodProvider moodProvider) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return StatefulBuilder(builder: (context, setState) {
          return AlertDialog(
            title: Text('Choose Week Range', style: TextStyle(fontSize: 18)),
            content: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                WeekPicker(
                  selectedDate: selectedStartDate,
                  datePickerStyles: DatePickerRangeStyles(
                    defaultDateTextStyle:
                        TextStyle(fontSize: 16, color: Colors.black),
                  ),
                  onChanged: (newDate) {
                    setState(() {
                      selectedStartDate = newDate.start;
                      selectedEndDate = newDate.end;
                    });
                    debugPrint(
                        'start:${selectedStartDate}   end${selectedEndDate}');
                  },
                  firstDate: DateTime.now().subtract(Duration(days: 350)),
                  lastDate: DateTime.now().add(Duration(days: 350)),
                ),
                SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () {
                    // Perform any action you want here with selectedStartDate and selectedEndDate

                    getMoodDateRange(
                        context,
                        moodProvider,
                        DateFormat('yyyy-MM-dd').format(selectedStartDate),
                        DateFormat('yyyy-MM-dd')
                            .format(selectedEndDate)); // Close the dialog
                  },
                  child: Text('Submit', style: TextStyle(fontSize: 16)),
                ),
              ],
            ),
          );
        });
      },
    );
  }

  Future<void> _showTimeRangePicker(
      BuildContext context, MoodProvider moodProvider) async {
    DateTime now = DateTime.now();
    DateTime todayStart = DateTime(now.year, now.month, now.day);
    DateTime todayEnd = DateTime(now.year, now.month, now.day);

    TimeRange? result = await showTimeRangePicker(
      context: context,
      labelOffset: 20,

      handlerColor: kPrimaryColor,
      selectedColor: Color(0xFFFFA97C),

      use24HourFormat: false,
      strokeWidth: 8,
      strokeColor: kPrimaryColor,
      ticks: 8,

      ticksLength: 32,

      ticksColor: Colors.grey,
      labelStyle: TextStyle(
        fontWeight: FontWeight.w400,
        fontSize: 12,
        color: Colors.grey.shade700,
      ),
      timeTextStyle: const TextStyle(
        fontWeight: FontWeight.w700,
        fontSize: 20,
        color: Colors.white,
      ),
      activeTimeTextStyle: const TextStyle(
        fontWeight: FontWeight.w700,
        fontSize: 28,
        color: Colors.white,
      ),
      handlerRadius: 6,

      backgroundWidget: Image.asset(
        'assets/icons/wb_logo_01.png',
        scale: 1.19,
      ),

      labels: [
        '12 AM',
        '3 AM',
        '6 AM',
        '9 AM',
        '12 PM',
        '3 PM',
        '6 PM',
        '9 PM',
      ].asMap().entries.map((e) {
        return ClockLabel.fromIndex(idx: e.key, length: 8, text: e.value);
      }).toList(),
      start: TimeOfDay.fromDateTime(todayStart),
      end: TimeOfDay.fromDateTime(todayEnd),

      // Other properties...
      builder: (BuildContext context, Widget? child) {
        return Theme(
          data: ThemeData.light().copyWith(
            datePickerTheme: DatePickerThemeData(
              rangePickerHeaderBackgroundColor: kPrimaryColor,
              rangePickerHeaderForegroundColor: Colors.black,
              rangePickerBackgroundColor: kPrimaryColor,
              headerHelpStyle: TextStyle(
                color: Colors.red, // Customize the header text color
              ),
              headerBackgroundColor: kPrimaryColor,
              headerHeadlineStyle: TextStyle(
                color: Colors.red, // Customize the header text color
              ),
            ),
            colorScheme: ColorScheme.light()
                .copyWith(primary: kPrimaryColor, onSurface: Colors.black
                    // Customize the primary color
                    ),

            dialogBackgroundColor:
                Colors.white, // Customize the background color
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              child!,
            ],
          ),
        );
      },
    );
    getMoodDateRange(context, moodProvider, result!.startTime.toString(),
        result.endTime.toString());
    if (result != null) {
      print('Selected Time Range: ${result.startTime}');
    }
  }

  // void _show(MoodProvider moodProvider) async {
  //   final DateTimeRange? result = await showDateRangePicker(
  //     context: context,
  //     firstDate: DateTime(2022, 1, 1),
  //     initialEntryMode: DatePickerEntryMode.inputOnly,
  //     lastDate: DateTime(2030, 12, 31),
  //     currentDate: DateTime.now(),
  //     saveText: 'Done',
  //     builder: (BuildContext context, Widget? child) {
  //       return Theme(
  //         data: ThemeData.light().copyWith(
  //           datePickerTheme: DatePickerThemeData(
  //             rangePickerHeaderForegroundColor: Colors.black,
  //             headerHelpStyle: TextStyle(
  //               color: Colors.red, // Customize the header text color
  //             ),
  //             headerForegroundColor: Colors.black,
  //             headerHeadlineStyle: TextStyle(
  //               color: Colors.red, // Customize the header text color
  //             ),
  //           ),
  //           colorScheme: ColorScheme.light()
  //               .copyWith(primary: kPrimaryColor, onSurface: Colors.black
  //                   // Customize the primary color
  //                   ),
  //           dialogBackgroundColor:
  //               Colors.white, // Customize the background color
  //         ),
  //         child: Column(
  //           mainAxisAlignment: MainAxisAlignment.center,
  //           children: [
  //             child!,
  //           ],
  //         ),
  //       );
  //     },
  //   );
  //
  //   if (result != null) {
  //     // Rebuild the UI
  //     print(result.start.toString());
  //     print(result.end.toString());
  //     getMoodDateRange(context, moodProvider, result.start.toString(),
  //         result.end.toString());
  //
  //     setState(() {
  //       _selectedDateRange = result;
  //     });
  //   }
  // }

  getMoodDateRange(BuildContext context, MoodProvider moodProvider,
      String startDate, String endDate) {
    moodProvider.getMoodDataRange(startDate, endDate, (status, String message) {
      if (status) {
        Provider.of<InsightProvider>(context, listen: false).selectedIndex =
            Provider.of<InsightProvider>(context, listen: false)
                .controller!
                .index;
        Navigator.pop(context);

        // Helper.showSnack(
        //   context,
        //   message,
        // );
      } else {
        Helper.showSnack(context, message);
      }
    }, context);
  }

  @override
  void initState() {
    super.initState();
    Provider.of<InsightProvider>(context, listen: false).tabFuncation(this);
    Provider.of<MoodProvider>(context, listen: false)
        .getMoodsToday(() {}, context, isFirstTime: true);
  }

  @override
  Widget build(BuildContext context) {
    return CustomParentWidget(
      child: Consumer2<InsightProvider, MoodProvider>(
          builder: (context, insightProvider, moodProvider, child) {
        return Scaffold(
            appBar: AppBar(
              elevation: 0,
              centerTitle: true,
              leading: CustomInkWell(
                onTap: () {
                  if (widget.screenName != null)
                    Navigator.of(context, rootNavigator: true).pop(context);

                  Navigator.of(context, rootNavigator: true).pop(context);
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
                title: "Insight",
                fontSize: 16,
                color: blackColor,
                fontWeight: FontWeight.w700,
              ),
              actions: [
                CustomInkWell(
                    onTap: () {
                      // _show(moodProvider);
                      // _showTimeRangePicker(context, moodProvider);
                      if (Provider.of<InsightProvider>(context, listen: false)
                              .controller!
                              .index ==
                          0) {
                        _showTimeRangePicker(context, moodProvider);
                      } else if (Provider.of<InsightProvider>(context,
                                  listen: false)
                              .controller!
                              .index ==
                          1) {
                        _showWeekPicker(moodProvider);
                      } else {
                        _showMonthPicker(moodProvider);
                      }
                    },
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Icon(
                        Icons.calendar_month,
                        size: 27,
                      ),
                    )),
                const SizedBox(
                  width: 4,
                )
              ],
              bottom: PreferredSize(
                  preferredSize: Size.fromHeight(50),
                  child: Container(
                    decoration: BoxDecoration(
                        border: Border(
                            bottom:
                                BorderSide(width: 1.5, color: kPrimaryColor))),
                    margin: EdgeInsets.only(left: 18, right: 18, bottom: 0),
                    child: Container(
                      child: Theme(
                        data: ThemeData(
                          highlightColor: Colors.transparent,
                          splashColor: Colors.transparent,
                        ),
                        child: TabBar(
                          controller: insightProvider.controller,
                          physics: NeverScrollableScrollPhysics(),
                          // isScrollable: true,
                          indicatorColor: kPrimaryColor,
                          indicator: UnderlineTabIndicator(
                              borderRadius: BorderRadius.circular(20),
                              borderSide:
                                  BorderSide(width: 3, color: kPrimaryColor)),
                          labelPadding: EdgeInsets.only(bottom: 12, top: 8),
                          indicatorSize: TabBarIndicatorSize.tab,

                          indicatorWeight: 5.0,
                          indicatorPadding:
                              EdgeInsets.symmetric(horizontal: 22),
                          // labelColor: wh,
                          labelColor: kPrimaryColor,
                          unselectedLabelColor: blackColor,
                          tabs: [
                            CustomText(
                              title: "Today",
                              fontSize: 14,
                              fontWeight: FontWeight.w700,
                              color: blackColor,
                            ),
                            CustomText(
                              title: "Week",
                              fontSize: 14,
                              fontWeight: FontWeight.w700,
                              color: blackColor,
                            ),
                            CustomText(
                              title: "Month",
                              fontSize: 14,
                              fontWeight: FontWeight.w700,
                              color: blackColor,
                            ),
                          ],
                        ),
                      ),
                    ),
                  )),
            ),
            body: Column(
              children: [
                Expanded(
                  child: TabBarView(
                      controller: insightProvider.controller,
                      children: [TodayTab(), WeekTab(), MonthTab()]),
                ),
              ],
            ));
      }),
    );
  }
}
