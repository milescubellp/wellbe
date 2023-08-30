import 'package:flutter/material.dart';
import 'package:wellbe/widgets/custom_parent_widget.dart';

import '../../models/CustomModels/custom_model.dart';
import '../../utilites/colors.dart';
import '../../widgets/custom_inkwell_btn.dart';
import '../../widgets/custom_text.dart';

class MySession extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CustomParentWidget(
      child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          centerTitle: false,
          backgroundColor: Colors.white,
          leading: CustomInkWell(
            onTap: () {
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
            title: "My Sessions",
            fontSize: 18,
            color: blackColor,
            fontWeight: FontWeight.w700,
          ),
        ),
        body: SingleChildScrollView(
            child: Column(
          children: [
            SizedBox(
              height: 10,
            ),
            Divider(
              height: 1,
              thickness: 1,
              color: kPrimaryColor,
              indent: 18,
              endIndent: 18,
            ),
            const SizedBox(
              height: 15,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 18.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CustomText(
                        title: "My Activity",
                        fontSize: 16,
                        color: blackColor,
                        fontWeight: FontWeight.w600,
                      ),
                      const SizedBox(
                        height: 1.5,
                      ),
                      CustomText(
                        title:
                            "Lets get it back on track with a brief exercise",
                        fontSize: 12,
                        color: textGreyColor2,
                        fontWeight: FontWeight.w600,
                      ),
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 18.0),
              child: Column(
                children: [
                  //CARD
                  ListView.builder(
                      itemCount: 3,
                      shrinkWrap: true,
                      padding: EdgeInsets.only(bottom: 10),
                      physics: ClampingScrollPhysics(),
                      itemBuilder: (context, index) {
                        return Container(
                          padding: EdgeInsets.only(bottom: 10),
                          child: CustomInkWell(
                            onTap: () {
                              // Helper.toScreen(context, QuickMeditationScreen());
                            },
                            child: Container(
                              padding: EdgeInsets.symmetric(
                                  horizontal: 10, vertical: 10),
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  border: Border.all(color: mediumGreyColor),
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
                                      child: Center(
                                        child: Image.asset(
                                          "assets/icons/video_big.png",
                                          width: 30,
                                        ),
                                      )),
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
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          CustomText(
                                            title: "Work out ${index + 1}",
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
                                      Row(
                                        children: [
                                          CustomText(
                                            title: "Day 01 | 1hr 15 min",
                                            fontSize: 12,
                                            fontWeight: FontWeight.w500,
                                            color: greyColor,
                                            //fontWeight: FontWeight.w700,
                                          ),
                                        ],
                                      ),
                                      SizedBox(
                                        height: 10,
                                      ),
                                      SizedBox(
                                        height: 10,
                                        child: Row(
                                          children: [
                                            Expanded(
                                              child: ClipRRect(
                                                borderRadius:
                                                    BorderRadius.circular(30),
                                                child: LinearProgressIndicator(
                                                  value: 0.4,
                                                  color: index == 0
                                                      ? kPrimaryColor
                                                      : mediumGreyColor,
                                                  minHeight: 5,
                                                  backgroundColor: lightGrey,
                                                ),
                                              ),
                                            ),
                                            SizedBox(width: 10),
                                            index == 0
                                                ? Icon(Icons.check_circle,
                                                    size: 30,
                                                    color: kPrimaryColor)
                                                : Icon(Icons.play_circle,
                                                    size: 30,
                                                    color: mediumGreyColor),
                                          ],
                                        ),
                                      ),
                                      Row(
                                        children: [
                                          CustomText(
                                            title: "4",
                                            fontSize: 15,
                                            fontWeight: FontWeight.w500,
                                            color: greyColor,
                                            //fontWeight: FontWeight.w700,
                                          ),
                                          CustomText(
                                            title: "/4 Sessions",
                                            fontSize: 12,
                                            fontWeight: FontWeight.w500,
                                            color: greyColor,
                                            //fontWeight: FontWeight.w700,
                                          ),
                                        ],
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
                      }),
                  const SizedBox(
                    height: 13,
                  ),
                ],
              ),
            ),
          ],
        )),
      ),
    );
  }
}
