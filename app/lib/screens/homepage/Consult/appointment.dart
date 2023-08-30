import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:wellbe/models/CustomModels/radio_button.dart';
import 'package:wellbe/provider/ventout_provider.dart';
import 'package:wellbe/screens/homepage/Consult/booking%20confirmed.dart';
import 'package:wellbe/screens/homepage/Consult/payment_confirmation.dart';
import 'package:wellbe/widgets/custom_parent_widget.dart';

import '../../../provider/DoctorUserProvider/doctor_user_provider.dart';
import '../../../provider/consult_provider.dart';
import '../../../utilites/colors.dart';
import '../../../utilites/helper.dart';
import '../../../widgets/custom_inkwell_btn.dart';
import '../../../widgets/custom_text.dart';
import '../../../widgets/radio_button.dart';

class AppointmentScreen extends StatefulWidget {
  @override
  _AppointmentScreenState createState() => _AppointmentScreenState();
}

class _AppointmentScreenState extends State<AppointmentScreen> {
  DateTime? _selectedDate;
  String? formattedDate;
  String? time;
  String? sessionMode;
  String? sessionDuration;

  IconData? getIcons(int index) {
    if (Provider.of<VentoutProvider>(context, listen: false)
            .isStartConversationScreen !=
        true) {
      switch (index) {
        case 0:
          return Icons.video_call;
        case 1:
          return Icons.mic_rounded;
        case 2:
          return Icons.chat;

        default:
          return null;
      }
    } else {
      switch (index) {
        case 0:
          return Icons.chat;

        default:
          return null;
      }
    }
  }

  String getButtonTitle(int index) {
    switch (index) {
      case 0:
        return '30';
      case 1:
        return '50';

      default:
        return '';
    }
  }

  Future<void> selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2010),
      lastDate: DateTime(2030),
    );
    if (picked != null && picked != _selectedDate) {
      setState(() {
        _selectedDate = picked;
      });
    }

    formattedDate = DateFormat('yyyy-MM-dd').format(_selectedDate!);
    debugPrint('selected appointment date ${formattedDate}');
  }

  List<DateTime> selectedDates = [];
  List<String> selectedTimeSlots = [];
  late VentoutProvider ventoutProvider;
  int selectedDayIndex = 0;
  List<Map<String, dynamic>> weekList = [
    {
      'day': 'Sunday',
      'date': 'May 16',
      'slots': 5,
    },
    {
      'day': 'Monday',
      'date': 'May 17',
      'slots': 7,
    },
    {
      'day': 'Tuesday',
      'date': 'May 18',
      'slots': 3,
    },
    {
      'day': 'Wednesday',
      'date': 'May 19',
      'slots': 6,
    },
    {
      'day': 'Thursday',
      'date': 'May 20',
      'slots': 4,
    },
    {
      'day': 'Friday',
      'date': 'May 21',
      'slots': 2,
    },
  ];
  List<String> timeList = [
    '09:00 AM',
    '10:00 AM',
    '11:00 AM',
    '12:00 PM',
    '01:00 PM',
    '02:00 PM',
    '03:00 PM',
    '04:00 PM',
    '05:00 PM',
    '06:00 PM',
  ];

  // void _selectDate(DateTime date) {
  //   setState(() {
  //     if (selectedDates.contains(date)) {
  //       selectedDates.remove(date);
  //     } else {
  //       selectedDates.add(date);
  //     }
  //   });
  // }

  int selectedIndex = 0;
  @override
  void initState() {
    // TODO: implement initState

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return CustomParentWidget(
      child: Consumer2<ConsultProvider, VentoutProvider>(
          builder: (context, consultProvider, ventoutProvider, child) {
        return WillPopScope(
          onWillPop: () async {
            // Handle the Android back button press
            ventoutProvider.onisStartConversationScreenChange(
                false); // Update the bool value
            return true; // Return true to allow the back navigation
          },
          child: Scaffold(
              appBar: AppBar(
                automaticallyImplyLeading: false,
                centerTitle: false,
                backgroundColor: Colors.white,
                leading: CustomInkWell(
                  onTap: () {
                    ventoutProvider.onisConversationScreenChange(false);
                    ventoutProvider.onisStartConversationScreenChange(false);

                    Navigator.pop(context);
                  },
                  child: Image.asset(
                    'assets/icons/arrow_back_02.png',
                    scale: 1.1,
                  ),
                ),
                elevation: 0,
                toolbarHeight: 65,
                title: CustomText(
                  title: "Appointment",
                  fontSize: 18,
                  color: blackColor,
                  fontWeight: FontWeight.w700,
                ),
              ),
              body: SingleChildScrollView(
                child: Column(children: [
                  const SizedBox(
                    height: 20,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 18.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        CustomText(
                          title: 'Select Date',
                          fontSize: 15,
                          color: blackColor,
                          fontWeight: FontWeight.w500,
                        ),
                        const SizedBox(
                          width: 5,
                        ),
                        CustomInkWell(
                          onTap: () {
                            selectDate(context);
                          },
                          child: Icon(
                            Icons.calendar_month,
                            color: blackColor,
                            size: 26,
                          ),
                        )
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  SizedBox(
                    height: 116.0,
                    child: ListView.builder(
                      padding: EdgeInsets.only(left: 18),
                      scrollDirection: Axis.horizontal,
                      itemCount: weekList.length,
                      itemBuilder: (context, index) {
                        final dayData = weekList[index];

                        final bool isSelected = index == selectedDayIndex;

                        return GestureDetector(
                          onTap: () {
                            setState(() {
                              selectedDayIndex = index;
                            });
                          },
                          child: Container(
                            padding: EdgeInsets.symmetric(horizontal: 15),
                            decoration: BoxDecoration(
                              color: isSelected ? kPrimaryColor : Colors.white,
                              border: Border.all(color: mediumGreyColor),
                              borderRadius: BorderRadius.circular(8),
                            ),
                            margin: EdgeInsets.only(right: 13),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                CustomText(
                                  title: dayData['day'],
                                  fontSize: 12,
                                  color: blackColor,
                                  fontWeight: FontWeight.w500,
                                ),
                                SizedBox(height: 8),
                                CustomText(
                                  title: dayData['date'],
                                  fontSize: 17,
                                  fontWeight: FontWeight.bold,
                                  color: blackColor,
                                ),
                                SizedBox(height: 8),
                                CustomText(
                                  title: '${dayData['slots']} Slots Available',
                                  fontSize: 13,
                                  fontWeight: FontWeight.w500,
                                  color: greyColor,
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                  Divider(),
                  const SizedBox(
                    height: 10,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 18.0),
                    child: Row(
                      children: [
                        CustomText(
                          title: 'Select session mode',
                          fontWeight: FontWeight.bold,
                          color: blackColor,
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 9,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 18.0),
                    child: Container(
                      height: 50,
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount:
                            ventoutProvider.isStartConversationScreen ? 1 : 3,
                        itemBuilder: (context, index) {
                          return Container(
                            margin: EdgeInsets.only(right: 8),
                            child: CustomInkWell(
                              onTap: () {
                                consultProvider
                                    .onDoctorsSelectTypeChange(index);
                              },
                              child: Container(
                                width: 75,
                                alignment: Alignment.center,
                                decoration: BoxDecoration(
                                  border: Border.all(
                                    color: Colors.grey,
                                    width: 1,
                                  ),
                                  borderRadius: BorderRadius.circular(4),
                                  color:
                                      consultProvider.doctorsSelectTypeIndex ==
                                              index
                                          ? kPrimaryColor
                                          : Colors.transparent,
                                ),
                                child: Icon(
                                  getIcons(index),
                                  size: 26,
                                  color:
                                      consultProvider.doctorsSelectTypeIndex ==
                                              index
                                          ? whiteColor
                                          : blackColor,
                                ),
                              ),
                            ),
                          );
                        },
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
                        CustomText(
                          title: 'Available Time Slots',
                          fontSize: 15,
                          color: blackColor,
                          fontWeight: FontWeight.w500,
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 4,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 18.0),
                    child: Row(
                      children: [
                        Row(
                          children: [
                            Container(
                              width: 8.0,
                              height: 8.0,
                              decoration: BoxDecoration(
                                color: Colors.grey,
                                shape: BoxShape.circle,
                              ),
                            ),
                            SizedBox(width: 3.0),
                            CustomText(
                              title: 'Unavailable',
                              color: Colors.black,
                              fontSize: 11.0,
                              fontWeight: FontWeight.w700,
                            ),
                          ],
                        ),
                        const SizedBox(
                          width: 18,
                        ),
                        Row(
                          children: [
                            Container(
                              width: 8.0,
                              height: 8.0,
                              decoration: BoxDecoration(
                                color: kPrimaryColor,
                                shape: BoxShape.circle,
                              ),
                            ),
                            SizedBox(width: 3.0),
                            CustomText(
                              title: 'Available',
                              color: Colors.black,
                              fontSize: 11.0,
                              fontWeight: FontWeight.w700,
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 18),
                    alignment: Alignment.centerLeft,
                    child: Wrap(
                      alignment: WrapAlignment.start,
                      children: [
                        ...List.generate(
                            timeList.length,
                            (index) => Container(
                                  margin: EdgeInsets.only(right: 8, bottom: 10),
                                  child: CustomInkWell(
                                    onTap: () {
                                      time = timeList[index];
                                      debugPrint('${time}');
                                      consultProvider
                                          .onavailableTimeSlotChange(index);
                                    },
                                    child: Container(
                                      width: 100,
                                      height: 38,
                                      alignment: Alignment.center,
                                      decoration: BoxDecoration(
                                        border: Border.all(
                                          color: Colors.grey,
                                          width: 1,
                                        ),
                                        borderRadius: BorderRadius.circular(4),
                                        color:
                                            // consultProvider.doctorsSelectTypeIndex ==
                                            consultProvider
                                                        .availableTimeSlotIndex ==
                                                    index
                                                ? kPrimaryColor
                                                : Colors.transparent,
                                      ),
                                      child: Text(
                                        timeList[index],
                                        style: TextStyle(
                                          fontSize: 14.5,
                                          color: textGreyColor2,
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                                    ),
                                  ),
                                ))
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 18.0),
                    child: Row(
                      children: [
                        CustomText(
                          title: 'Select session duration',
                          fontWeight: FontWeight.bold,
                          color: blackColor,
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 18.0),
                    child: Container(
                      height: 70,
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: 2,
                        itemBuilder: (context, index) {
                          return Container(
                            margin: EdgeInsets.only(right: 8),
                            child: CustomInkWell(
                              onTap: () {
                                consultProvider
                                    .onselectSessionDurationChange(index);

                                sessionDuration = getButtonTitle(index);
                              },
                              child: Container(
                                width: 80,
                                alignment: Alignment.center,
                                decoration: BoxDecoration(
                                  border: Border.all(
                                    color: Colors.grey,
                                    width: 1,
                                  ),
                                  borderRadius: BorderRadius.circular(8),
                                  color: consultProvider
                                              .selectSessionDurationIndex ==
                                          index
                                      ? kPrimaryColor
                                      : Colors.transparent,
                                ),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    CustomText(
                                      title: getButtonTitle(index),
                                      fontSize: 18,
                                      color: consultProvider
                                                  .selectSessionDurationIndex ==
                                              index
                                          ? whiteColor
                                          : blackColor,
                                    ),
                                    CustomText(
                                      title: 'min',
                                      fontSize: 13,
                                      color: consultProvider
                                                  .selectSessionDurationIndex ==
                                              index
                                          ? whiteColor
                                          : blackColor,
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  ListView.separated(
                      separatorBuilder: (context, index) => Divider(
                            color: Colors.grey,
                          ),
                      shrinkWrap: true,
                      itemCount: yourList.length,
                      physics: NeverScrollableScrollPhysics(),
                      itemBuilder: (context, index) => Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 18.0, vertical: 6),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    CustomText(
                                      title: 'Get a single session',
                                      color: textGreyColor2,
                                      fontSize: 10.6,
                                    ),
                                    const SizedBox(
                                      height: 6,
                                    ),
                                    CustomText(
                                      title: '1 session',
                                      color: blackColor,
                                      fontSize: 12.8,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ],
                                ),
                                Row(
                                  children: [
                                    CustomText(
                                      title: '₹800',
                                      color: blackColor,
                                      decorationStyle:
                                          TextDecorationStyle.solid,
                                      fontSize: 12.8,
                                      decoration: TextDecoration.lineThrough,
                                      fontWeight: FontWeight.w500,
                                    ),
                                    const SizedBox(
                                      width: 5,
                                    ),
                                    CustomText(
                                      title: '₹400/session',
                                      color: Colors.lightGreen,
                                      fontSize: 12.8,
                                      fontWeight: FontWeight.w500,
                                    ),
                                    const SizedBox(
                                      width: 7,
                                    ),
                                    CircularRadioButton(
                                      isSelected: index == selectedIndex,
                                      width: 15,
                                      height: 15,
                                      onChanged: (bool newValue) {
                                        setState(() {
                                          selectedIndex = index;
                                        });
                                      },
                                    ),
                                  ],
                                )
                              ],
                            ),
                          )),
                  const SizedBox(
                    height: 25,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 18.0),
                    child: SizedBox(
                      width: double.maxFinite,
                      child: ElevatedButton(
                        onPressed: () {
                          // Perform action for the second button
                          consultProvider.updateAppointmentData(
                              price: '400',
                              mode: consultProvider.doctorsSelectTypeIndex == 0
                                  ? 'Video Call'
                                  : consultProvider.doctorsSelectTypeIndex == 1
                                      ? 'Voice Call'
                                      : 'Text Message',
                              duration: sessionDuration ?? getButtonTitle(0),
                              date: formattedDate ??
                                  DateFormat('yyyy-MM-dd')
                                      .format(DateTime.now()),
                              slot: time ?? timeList[0]);
                          Helper.toScreen(
                              context,
                              PaymentConfirmationScreen(
                                appointmentDateTime: DateTime.now(),
                                bookingCountdown: 20,
                                bookingType: 'Video Call',
                                paymentDueAmount: 300,
                                sessionDuration: 52,
                              ));
                        },
                        child: CustomText(
                          title: 'Continue',
                          fontSize: 12,
                          color: Colors.white,
                        ),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: darkBlueColor,
                          foregroundColor: Colors.white,
                          padding: EdgeInsets.symmetric(vertical: 15),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(60),
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                ]),
              )),
        );
      }),
    );
  }
}
