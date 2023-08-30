import 'package:flutter/material.dart';
import 'package:persistent_bottom_nav_bar_v2/persistent-tab-view.dart';
import 'package:provider/provider.dart';
import 'package:wellbe/provider/ventout_provider.dart';
import 'package:wellbe/screens/homepage/Consult/appointment.dart';

import '../../../models/CustomModels/custom_model.dart';
import '../../../utilites/colors.dart';
import '../../../utilites/helper.dart';
import '../../../utilites/helper.dart';
import '../../../widgets/custom_inkwell_btn.dart';
import '../../../widgets/custom_text.dart';
import 'chat_screen.dart';

class ConnectingExpert extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<VentoutProvider>(
        builder: (context, ventoutProvider, child) {
      return Column(
        children: [
          const SizedBox(
            height: 15,
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 18.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      CustomText(
                        title: 'Connecting Experts',
                        fontWeight: FontWeight.w700,
                        fontSize: 13.3,
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  Expanded(
                    child: ListView.builder(
                        itemCount: journalList.length,
                        shrinkWrap: true,
                        physics: ClampingScrollPhysics(),
                        itemBuilder: (context, index) {
                          return Container(
                            padding: EdgeInsets.only(bottom: 10),
                            child: CustomInkWell(
                              onTap: () {},
                              child: Container(
                                padding: EdgeInsets.symmetric(
                                    horizontal: 10, vertical: 10),
                                decoration: BoxDecoration(
                                    color: Color(0xFFe2f2ff),
                                    border: Border.all(color: darkGreyColor),
                                    borderRadius: BorderRadius.circular(8)),
                                child: Row(
                                  children: [
                                    Container(
                                      width: 80,
                                      height: 80,
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(8),
                                          image: DecorationImage(
                                              fit: BoxFit.cover,
                                              image: AssetImage(
                                                  "${meditationList[index].img}"))),
                                      clipBehavior: Clip.hardEdge,
                                    ),
                                    //Space
                                    SizedBox(
                                      width: 12,
                                    ),
                                    //
                                    Expanded(
                                        child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        CustomText(
                                          title: "Dr James William",
                                          fontSize: 14.5,
                                          color: blackColor,
                                          fontWeight: FontWeight.w600,
                                        ),

                                        //Space
                                        SizedBox(
                                          height: 6,
                                        ),
                                        Row(
                                          children: [
                                            CustomText(
                                              title:
                                                  "Cardiologist | 10 yrs exp |",
                                              fontSize: 11,
                                              color: greyColor,
                                              fontWeight: FontWeight.w700,
                                              //fontWeight: FontWeight.w700,
                                            ),
                                            Icon(
                                              Icons.star,
                                              color: Colors.yellow,
                                              size: 16,
                                            ),
                                            CustomText(
                                              title: " 4.3",
                                              fontSize: 11,
                                              color: blackColor,
                                              fontWeight: FontWeight.w500,
                                              //fontWeight: FontWeight.w700,
                                            ),
                                          ],
                                        ),
                                        //Space
                                        SizedBox(
                                          height: 10,
                                        ),
                                        Row(
                                          children: [
                                            SizedBox(
                                              height: 24.7,
                                              child: ElevatedButton(
                                                onPressed: () {
                                                  // Perform action for the second button
                                                  ventoutProvider
                                                      .onisStartConversationScreenChange(
                                                          true);
                                                  ventoutProvider
                                                      .onisConversationScreenChange(
                                                          true);
                                                  debugPrint(ventoutProvider
                                                      .isConversationScreen
                                                      .toString());
                                                  Helper.toScreen(context,
                                                      AppointmentScreen());
                                                },
                                                child: CustomText(
                                                    title: 'Start Conversation',
                                                    color: Colors.white,
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: 12),
                                                style: ElevatedButton.styleFrom(
                                                  backgroundColor: index == 2 &&
                                                          ventoutProvider
                                                              .isBooked
                                                      ? Colors.green
                                                      : darkBlueColor,
                                                  foregroundColor: Colors.white,
                                                  shape: RoundedRectangleBorder(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            60),
                                                  ),
                                                ),
                                              ),
                                            ),
                                            SizedBox(
                                              width: 4,
                                            ),
                                            if (index == 2 &&
                                                ventoutProvider.isBooked)
                                              Expanded(
                                                child: SizedBox(
                                                  height: 24.7,
                                                  child: ElevatedButton(
                                                    onPressed: () {
                                                      // Perform action for the second button
                                                      // ventoutProvider
                                                      //     .onisStartConversationScreenChange(
                                                      //     true);
                                                      // ventoutProvider
                                                      //     .onisConversationScreenChange(
                                                      //     true);
                                                      // debugPrint(ventoutProvider
                                                      //     .isConversationScreen
                                                      //     .toString());
                                                      // Helper.toScreen(context,
                                                      //     AppointmentScreen());
                                                    },
                                                    child: CustomText(
                                                        title: 'at 5pm',
                                                        color: darkBlueColor,
                                                        fontWeight:
                                                            FontWeight.bold,
                                                        fontSize: 8),
                                                    style: ElevatedButton
                                                        .styleFrom(
                                                      elevation: 0,
                                                      backgroundColor:
                                                          Colors.transparent,
                                                      foregroundColor:
                                                          darkBlueColor,
                                                      shape:
                                                          RoundedRectangleBorder(
                                                        side: BorderSide(
                                                            color:
                                                                darkBlueColor),
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(60),
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                          ],
                                        ),
                                      ],
                                    )),
                                  ],
                                ),
                              ),
                            ),
                          );
                        }),
                  ),
                ],
              ),
            ),
          )
        ],
      );
    });
  }
}
