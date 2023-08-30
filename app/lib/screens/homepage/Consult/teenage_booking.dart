import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wellbe/provider/consult_provider.dart';
import 'package:wellbe/provider/ventout_provider.dart';
import 'package:wellbe/widgets/custom_parent_widget.dart';
import 'package:wellbe/widgets/custom_textfield.dart';

import '../../../utilites/colors.dart';
import '../../../utilites/helper.dart';
import '../../../widgets/custom_inkwell_btn.dart';
import '../../../widgets/custom_text.dart';
import 'booking confirmed.dart';

class TeenageBooking extends StatefulWidget {
  const TeenageBooking({Key? key}) : super(key: key);

  @override
  State<TeenageBooking> createState() => _TeenageBookingState();
}

class _TeenageBookingState extends State<TeenageBooking> {
  IconData? getIcons(int index) {
    if (Provider.of<VentoutProvider>(context, listen: false)
            .isStartConversationScreen !=
        true) {
      switch (index) {
        case 0:
          return Icons.video_call;
        case 1:
          return Icons.mic_none;
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

  @override
  Widget build(BuildContext context) {
    return CustomParentWidget(
      child: Consumer2<ConsultProvider, VentoutProvider>(
          builder: (context, consultProvider, ventoutProvider, child) {
        return Scaffold(
          appBar: AppBar(
            actions: [
              Padding(
                padding: const EdgeInsets.only(right: 18.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [],
                ),
              ),
            ],
            elevation: 0,
            centerTitle: false,
            automaticallyImplyLeading: false,
            backgroundColor: Colors.white,
            title: CustomText(
              title: "Booking Details",
              fontSize: 17,
              color: blackColor,
              fontWeight: FontWeight.w700,
            ),
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
          ),
          body: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 20,
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 18),
                child: CustomText(
                  title: 'Booking therapy with',
                  fontSize: 12,
                  color: greyColor,
                ),
              ),
              const SizedBox(
                height: 7,
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 18),
                child: CustomText(
                  title: 'Shreya Rana',
                  fontSize: 14,
                  color: Colors.black,
                ),
              ),
              const SizedBox(
                height: 18,
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 18),
                child: CustomText(
                  title: 'Describe the problem you are facing',
                  fontSize: 12,
                  color: greyColor,
                ),
              ),
              const SizedBox(
                height: 5,
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 18),
                child: CustomTextField(maxLines: 5),
              ),
              const SizedBox(
                height: 18,
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 18),
                child: CustomText(
                  title: 'Guardian Name',
                  fontSize: 12,
                  color: greyColor,
                ),
              ),
              const SizedBox(
                height: 5,
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 18),
                child: CustomTextField(),
              ),
              const SizedBox(
                height: 18,
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 18),
                child: CustomText(
                  title: 'Guardian Name',
                  fontSize: 12,
                  color: greyColor,
                ),
              ),
              const SizedBox(
                height: 5,
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 18),
                child: Container(
                  alignment: Alignment.center,
                  width: 70,
                  height: 47,
                  decoration: BoxDecoration(
                      border: Border.all(color: greyColor),
                      borderRadius: BorderRadius.circular(8)),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CustomText(
                        title: '+91',
                        fontSize: 14.5,
                      ),
                      Icon(Icons.arrow_drop_down)
                    ],
                  ),
                ),
              ),
              const SizedBox(
                height: 18,
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 18),
                child: CustomText(
                  title: 'Guardian Email',
                  fontSize: 12,
                  color: greyColor,
                ),
              ),
              const SizedBox(
                height: 5,
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 18),
                child: CustomTextField(),
              ),
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
                            consultProvider.onDoctorsSelectTypeChange(index);
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
                              color: consultProvider.doctorsSelectTypeIndex ==
                                      index
                                  ? kPrimaryColor
                                  : Colors.transparent,
                            ),
                            child: Icon(
                              getIcons(index),
                              size: 22,
                              color: consultProvider.doctorsSelectTypeIndex ==
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
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 18.0),
                child: Row(
                  children: [
                    Expanded(
                      child: SizedBox(
                        child: ElevatedButton(
                          onPressed: () {
                            // Perform action for the second button
                            Navigator.pop(context);
                          },
                          child: CustomText(
                            title: 'Cancel',
                            fontSize: 12,
                            color: darkBlueColor,
                          ),
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.white,
                            foregroundColor: Colors.white,
                            padding: EdgeInsets.symmetric(vertical: 15),
                            shape: RoundedRectangleBorder(
                              side: BorderSide(color: darkBlueColor),
                              borderRadius: BorderRadius.circular(60),
                            ),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Expanded(
                      child: SizedBox(
                        child: ElevatedButton(
                          onPressed: () {
                            // Perform action for the second button
                            Helper.toScreen(context, BookingConfirmed());
                          },
                          child: CustomText(
                            title: 'Confirm Payment',
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
                  ],
                ),
              ),
            ],
          ),
        );
      }),
    );
  }
}
