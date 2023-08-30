import 'package:flutter/material.dart';
import 'package:wellbe/screens/homepage/MIndFul/breathing_card_info.dart';
import 'package:wellbe/widgets/custom_parent_widget.dart';

import '../../../models/CustomModels/custom_model.dart';
import '../../../utilites/colors.dart';
import '../../../utilites/helper.dart';
import '../../../widgets/custom_inkwell_btn.dart';
import '../../../widgets/custom_text.dart';

class ImageBreathing extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CustomParentWidget(
      child: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(
              height: 15,
            ),
            Row(
              children: [
                Expanded(
                  child: CustomText(
                    title: "Discover Wellbe Meditation",
                    color: blackColor,
                    fontSize: 16,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 2,
            ),
            Row(
              children: [
                Expanded(
                  child: CustomText(
                    title: "Harnessing the Power of Breath",
                    color: blackColor,
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 2,
            ),
            Row(
              children: [
                Expanded(
                  child: CustomText(
                    title:
                        "Experience the transformative power of meditation with WellBe urture a calm,a happy heart,and an empowered self,Begin your journey to inner peace and emotional balance today",
                    color: blackColor,
                    fontSize: 12,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            Row(
              children: [
                Expanded(
                  child: CustomText(
                    title: "Select the type",
                    color: blackColor,
                    fontSize: 16.5,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            ListView.builder(
                itemCount: journalList.length,
                shrinkWrap: true,
                physics: ClampingScrollPhysics(),
                itemBuilder: (context, index) {
                  return Container(
                    padding: EdgeInsets.only(bottom: 10),
                    child: CustomInkWell(
                      onTap: () {
                        Helper.toScreen(context, BreathingCardInfo());
                      },
                      child: Container(
                        padding:
                            EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                        decoration: BoxDecoration(
                            color: journalList[index].color,
                            border: Border.all(color: darkGreyColor),
                            borderRadius: BorderRadius.circular(8)),
                        child: Row(
                          children: [
                            Expanded(
                                child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                CustomText(
                                  title:
                                      "Anapane Tecgnique : Embrace\nEquanmity",
                                  fontSize: 15.5,
                                  color: blackColor,
                                  fontWeight: FontWeight.w700,
                                ),
                                //Space
                                SizedBox(
                                  height: 6,
                                ),
                                CustomText(
                                  title:
                                      "Discover a path to Calm Mind and\nReduced Stress",
                                  fontSize: 12,
                                  color: textGreyColor2,
                                  fontWeight: FontWeight.w500,
                                  //fontWeight: FontWeight.w700,
                                ),
                              ],
                            )),
                            //Space
                            SizedBox(
                              width: 12,
                            ),
                            CustomInkWell(
                              onTap: () {},
                              child: Container(
                                  padding: EdgeInsets.all(3),
                                  decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      // border: Border.all(
                                      //     width: 1,
                                      color: darkBlueColor
                                      //  )
                                      ),
                                  child: Icon(
                                    Icons.keyboard_arrow_right_sharp,
                                    color: whiteColor,
                                  )),
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                }),
            const SizedBox(
              height: 80,
            )
          ],
        ),
      ),
    );
  }
}
