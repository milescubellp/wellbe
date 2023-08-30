import 'package:flutter/material.dart';

import '../../../../models/CustomModels/custom_model.dart';
import '../../../../utilites/colors.dart';
import '../../../../utilites/helper.dart';
import '../../../../widgets/custom_inkwell_btn.dart';
import '../../../../widgets/custom_text.dart';
import '../all_recommended.dart';
import '../podcasts_details.dart';

class AllGenreTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: journalList.length,
        shrinkWrap: true,
        physics: ClampingScrollPhysics(),
        itemBuilder: (context, index) {
          return Container(
            padding: EdgeInsets.only(bottom: 10),
            child: CustomInkWell(
              onTap: () {
                // Helper.toScreen(context, AllRecommended());
              },
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                decoration: BoxDecoration(
                    color: extraLightGreyColor,
                    borderRadius: BorderRadius.circular(8)),
                child: Row(
                  children: [
                    Stack(
                      alignment: Alignment.center,
                      children: [
                        Container(
                          width: 80,
                          height: 80,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8),
                              image: DecorationImage(
                                  fit: BoxFit.cover,
                                  image:
                                      AssetImage("assets/icons/image_01.png"))),
                          clipBehavior: Clip.hardEdge,
                        ),
                        Icon(
                          Icons.play_arrow_rounded,
                          color: Colors.white,
                          size: 30,
                        )
                      ],
                    ),
                    //Space
                    SizedBox(
                      width: 12,
                    ),
                    //
                    Expanded(
                        child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            CustomText(
                              title: "Heading ${index + 1}",
                              fontSize: 12.5,
                              color: blackColor,
                              fontWeight: FontWeight.w700,
                            ),
                            CustomText(
                              title: "6 min",
                              fontSize: 12.5,
                              color: greyColor,
                              fontWeight: FontWeight.w500,
                            ),
                          ],
                        ),
                        //Space
                        SizedBox(
                          height: 6,
                        ),
                        CustomText(
                          title: "It is a logn established fact\nthat a reader",
                          fontSize: 12,
                          color: textGreyColor2,
                          //fontWeight: FontWeight.w700,
                        ),
                      ],
                    )),
                    //Space
                    SizedBox(
                      width: 12,
                    ),
                  ],
                ),
              ),
            ),
          );
        });
  }
}
