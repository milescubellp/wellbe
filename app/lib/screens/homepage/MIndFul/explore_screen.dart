import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wellbe/screens/homepage/MIndFul/mindful_quick_medidtation.dart';

import 'package:wellbe/widgets/custom_parent_widget.dart';

import '../../../models/CustomModels/custom_model.dart';
import '../../../utilites/colors.dart';
import '../../../utilites/helper.dart';
import '../../../widgets/custom_inkwell_btn.dart';
import '../../../widgets/custom_text.dart';
import '../QuickMeditation/quick_meditation_screen.dart';

class ExploreScreen extends StatelessWidget {
  const ExploreScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomParentWidget(
      child: Consumer(builder: (context, mediationProvider, child) {
        return Scaffold(
          appBar: AppBar(
            elevation: 0,
            centerTitle: false,
            automaticallyImplyLeading: false,
            backgroundColor: kPrimaryColor,
            title: CustomText(
              title: "Transforming Anger",
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
            //Space
          ),
          body: SingleChildScrollView(
              child: Column(
            children: [
              Container(
                height: 370,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                    color: kPrimaryColor,
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(25),
                      bottomRight: Radius.circular(25),
                    )),
                padding:
                    EdgeInsets.only(left: 13, right: 13, top: 10, bottom: 25),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    //IMAGE
                    Container(
                      //  width: double.infinity,
                      height: 230,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          image: DecorationImage(
                              fit: BoxFit.cover,
                              image: AssetImage("assets/icons/image_01.png"))),
                      alignment: Alignment.center,
                      child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const SizedBox(
                              height: 40,
                            ),
                            Image.asset(
                              'assets/icons/video.png',
                              width: 70,
                              fit: BoxFit.cover,
                            ),
                            const SizedBox(
                              height: 40,
                            ),
                            Image.asset('assets/icons/video_player_01.png'),
                          ]),
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            CustomText(
                              title: "Channeling Anger",
                              fontSize: 15.5,
                              color: blackColor,
                              fontWeight: FontWeight.w700,
                            ),
                            const SizedBox(
                              height: 2,
                            ),
                            CustomText(
                              title: "Episode 01",
                              fontSize: 12,
                              color: greyColor,
                              fontWeight: FontWeight.w700,
                            ),
                          ],
                        ),
                        RichText(
                          text: TextSpan(
                            style: TextStyle(color: blackColor),
                            children: <TextSpan>[
                              TextSpan(
                                text: '01',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18.0,
                                ),
                              ),
                              TextSpan(text: '/04'),
                            ],
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 8,
                    ),

                    Row(
                      children: [
                        // Expanded(
                        //   child: CustomText(
                        //     title: "Breathing Technique",
                        //     fontSize: 12,
                        //     color: blackColor,
                        //     fontWeight: FontWeight.w700,
                        //   ),
                        // ),
                        RichText(
                            text: TextSpan(children: [
                          TextSpan(
                              children: [
                                TextSpan(
                                    text: 'Breathing Technique :',
                                    style: TextStyle(
                                      fontSize: 12,
                                      color: blackColor,
                                      fontWeight: FontWeight.w700,
                                    )),
                                TextSpan(
                                    text:
                                        '  It is a long established fact that\na reader will be distracted by the readable content of a\npage when looking at its layout',
                                    style: TextStyle(
                                      fontSize: 11,
                                      color: textGreyColor2,
                                      fontWeight: FontWeight.w700,
                                    ))
                              ],
                              style: TextStyle(
                                  color: textGreyColor2,
                                  fontSize: 12,
                                  fontWeight: FontWeight.w500)),
                        ]))
                      ],
                    ),
                  ],
                ),
              ),
              //Space

              const SizedBox(
                height: 25,
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
                                Helper.toScreen(
                                    context, MindfulQuickMeditationScreen());
                              },
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
                                              title: "Channeling Anger",
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
                                              title: "Episode 01",
                                              fontSize: 12,
                                              fontWeight: FontWeight.w500,
                                              color: greyColor,
                                              //fontWeight: FontWeight.w700,
                                            ),
                                          ],
                                        ),

                                        Row(
                                          children: [
                                            Expanded(
                                              child: ClipRRect(
                                                borderRadius:
                                                    BorderRadius.circular(30),
                                                child: LinearProgressIndicator(
                                                  value: 0.4,
                                                  color: index == 0
                                                      ? kPrimaryColor
                                                      : greyColor,
                                                  minHeight: 5,
                                                  backgroundColor: Colors.white,
                                                ),
                                              ),
                                            ),
                                            SizedBox(width: 30),
                                            index == 0
                                                ? Icon(Icons.check_circle,
                                                    size: 30,
                                                    color: kPrimaryColor)
                                                : Icon(Icons.play_circle,
                                                    size: 30, color: greyColor),
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
                      height: 80,
                    ),
                  ],
                ),
              ),
            ],
          )),
        );
      }),
    );
  }
}
