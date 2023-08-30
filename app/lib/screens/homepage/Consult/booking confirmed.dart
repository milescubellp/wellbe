import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:persistent_bottom_nav_bar_v2/persistent-tab-view.dart';

import 'package:provider/provider.dart';
import 'package:wellbe/provider/ventout_provider.dart';
import 'package:wellbe/screens/homepage/Consult/doctor_appointment.dart';
import 'package:wellbe/screens/homepage/HomeScreens/home_screen.dart';
import 'package:wellbe/screens/homepage/HomeScreens/homepage_screen.dart';
import 'package:wellbe/screens/homepage/VentOut/chat_screen.dart';
import 'package:wellbe/widgets/custom_loader.dart';
import 'package:wellbe/widgets/custom_parent_widget.dart';

import '../../../provider/DoctorUserProvider/doctor_user_provider.dart';
import '../../../provider/consult_provider.dart';
import '../../../utilites/colors.dart';
import '../../../utilites/helper.dart';
import '../../../widgets/custom_inkwell_btn.dart';
import '../../../widgets/custom_text.dart';

class BookingConfirmed extends StatefulWidget {
  String? screenName;
  BookingConfirmed({this.screenName});
  @override
  State<BookingConfirmed> createState() => _BookingConfirmedState();
}

class _BookingConfirmedState extends State<BookingConfirmed> {
  @override
  void initState() {
    // TODO: implement initState
    Provider.of<DoctorUserProvider>(context, listen: false)
        .getAppointment((status) {}, context);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return CustomParentWidget(
      child: Consumer3<ConsultProvider, VentoutProvider, DoctorUserProvider>(
          builder: (context, consultProvider, ventoutProvider,
              doctorUserProvider, child) {
        return Scaffold(
          appBar: AppBar(
            automaticallyImplyLeading: false,
            elevation: 0,
            backgroundColor: Color(0xFFdaedd9),
          ),
          body: doctorUserProvider.getAppointmentModels.length != 0
              ? SingleChildScrollView(
                  child: Column(children: [
                    Container(
                      width: double.maxFinite,
                      decoration: BoxDecoration(
                          color: Color(0xFFdaedd9),
                          borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(25),
                            bottomRight: Radius.circular(25),
                          )),
                      child: Column(
                        children: [
                          const SizedBox(
                            height: 20,
                          ),
                          Image.asset(
                            'assets/icons/successful_popup.png',
                            width: 85, // Replace with your image asset path
                            height: 85,
                          ),
                          SizedBox(height: 16),
                          CustomText(
                            title: 'Booking Confirmed',
                            fontSize: 18,
                            fontWeight: FontWeight.w700,
                            color: blackColor,
                            textAlign: TextAlign.center,
                          ),
                          SizedBox(height: 12),
                          Text(
                            'Confirmation message has been sent\nto your registered details',
                            style: TextStyle(
                                fontSize: 12,
                                color: blackColor,
                                fontWeight: FontWeight.w500),
                            textAlign: TextAlign.center,
                          ),
                          SizedBox(height: 100),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 25,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 18.0),
                      child: Column(
                        children: [
                          Row(
                            children: [
                              CustomText(
                                title: 'Appointments Details',
                                fontWeight: FontWeight.bold,
                                color: blackColor,
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          ListView.builder(
                            itemCount:
                                doctorUserProvider.getAppointmentModels.length,
                            physics: NeverScrollableScrollPhysics(),
                            shrinkWrap: true,
                            itemBuilder: (context, index) {
                              final doctorUser = doctorUserProvider
                                  .getAppointmentModels[index];
                              return Container(
                                padding: EdgeInsets.symmetric(
                                    horizontal: 8, vertical: 10),
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
                                          borderRadius:
                                              BorderRadius.circular(8),
                                          image: DecorationImage(
                                              fit: BoxFit.cover,
                                              image: AssetImage(
                                                  "assets/icons/slider_01.png"))),
                                      clipBehavior: Clip.hardEdge,
                                    ),
                                    //Space
                                    SizedBox(
                                      width: 17,
                                    ),
                                    //
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                CustomText(
                                                  title: "Dr James William",
                                                  fontSize: 13,
                                                  color: blackColor,
                                                  fontWeight: FontWeight.w700,
                                                ),
                                              ],
                                            ),
                                            const SizedBox(
                                              width: 20,
                                            ),
                                            Row(
                                              children: [
                                                CustomText(
                                                  title: "Booking Id :",
                                                  fontSize: 9,
                                                  color: blackColor,
                                                  fontWeight: FontWeight.w700,
                                                ),
                                                const SizedBox(
                                                  width: 4,
                                                ),
                                                CustomText(
                                                  title: "${doctorUser.id}",
                                                  fontSize: 11,
                                                  color: textGreyColor2,
                                                  fontWeight: FontWeight.w700,
                                                ),
                                              ],
                                            ),
                                          ],
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
                                              title:
                                                  "${doctorUser.sessionMode}",
                                              fontSize: 11,
                                              color: textGreyColor2,
                                              fontWeight: FontWeight.w700,
                                            ),
                                          ],
                                        ),
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
                                              title:
                                                  "${DateFormat('yyyy-MM-dd').format(DateTime.parse(doctorUser.appointmentDate!))}",
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
                                              title: "${doctorUser.timeSlot}",
                                              fontSize: 11,
                                              color: textGreyColor2,
                                              fontWeight: FontWeight.w700,
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              );
                            },
                          ),
                          SizedBox(
                            height: 130,
                          ),
                          SizedBox(
                            height: 45,
                            width: double.maxFinite,
                            child: ElevatedButton(
                              onPressed: () {
                                // Perform action for the second button
                                ventoutProvider.isConversationScreen
                                    ? Helper.toScreen(context, ChatScreen())
                                    : Helper.toScreen(
                                        context, DoctorAppointment());
                              },
                              child: CustomText(
                                  title: 'Done',
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
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
                          SizedBox(
                            height: 10,
                          ),
                          SizedBox(
                            height: 45,
                            width: double.maxFinite,
                            child: ElevatedButton(
                              onPressed: () {
                                // Perform action for the first button
                                // Helper.toRemoveUntiScreen(context, HomePageScreen());
                                // Navigator.popAndPushNamed(context, '/homeScreen');
                                ventoutProvider
                                    .onisStartConversationScreenChange(false);
                                Helper.toScreen(
                                    context,
                                    HomePageScreen(
                                      index: 3,
                                    ));
                                // Navigator.of(context)
                                //     .popUntil(ModalRoute.withName("/"));
                              },
                              child: CustomText(
                                  title: 'Go to Homepage',
                                  color: blueColor,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 12),
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.transparent,
                                foregroundColor: Colors.white,
                                elevation: 0,
                                padding: EdgeInsets.symmetric(
                                    vertical: 2, horizontal: 14),
                                shape: RoundedRectangleBorder(
                                  side: BorderSide(width: 2, color: blueColor),
                                  borderRadius: BorderRadius.circular(60),
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 25,
                          ),
                        ],
                      ),
                    ),
                  ]),
                )
              : CustomLoader(),
        );
      }),
    );
  }
}
