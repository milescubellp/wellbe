import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wellbe/provider/mindful_provider.dart';
import 'package:wellbe/widgets/custom_parent_widget.dart';

import '../../../utilites/colors.dart';
import '../../../utilites/helper.dart';
import '../../../widgets/custom_inkwell_btn.dart';
import '../../../widgets/custom_text.dart';
import 'academic_audio.dart';
import 'academic_info_input.dart';

class AcademicScreen extends StatelessWidget {
  const AcademicScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomParentWidget(
      child: Consumer<MoodSpaceProvider>(
          builder: (context, moodSpaceProvider, child) {
        return Scaffold(
          appBar: AppBar(
            elevation: 0,
            centerTitle: false,
            automaticallyImplyLeading: false,
            backgroundColor: kPrimaryColor,
            title: CustomText(
              title: "Academic 01",
              fontSize: 17,
              color: blackColor,
              fontWeight: FontWeight.w700,
            ),
            actions: [
              CustomInkWell(
                onTap: () {
                  if (moodSpaceProvider.isThoughtPage)
                    moodSpaceProvider.onSelectedIndexChange(0);
                  Navigator.pop(context);
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
              )
            ],
          ),
          body: SingleChildScrollView(
            child: Column(children: [
              Container(
                height: 400,
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
                    Stack(
                      alignment: Alignment.center,
                      children: [
                        Container(
                          height: 230,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              image: DecorationImage(
                                  fit: BoxFit.cover,
                                  image:
                                      AssetImage("assets/icons/image_01.png"))),
                          clipBehavior: Clip.hardEdge,
                        ),
                        Image.asset('assets/icons/video_big.png'),
                      ],
                    ),
                    const SizedBox(
                      height: 15,
                    ),

                    //DESCRIPTION
                    Image.asset('assets/images/videoplaylengthline.png'),
                    const SizedBox(
                      height: 25,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.shuffle,
                          color: blackColor,
                          size: 19,
                        ),
                        const SizedBox(
                          width: 20,
                        ),
                        Icon(
                          Icons.fast_rewind,
                          color: blackColor,
                        ),
                        const SizedBox(
                          width: 20,
                        ),
                        Container(
                          width: 45,
                          height: 45,
                          decoration: BoxDecoration(
                              shape: BoxShape.circle, color: blackColor),
                          child: Icon(
                            Icons.play_arrow_rounded,
                            color: Colors.white,
                            size: 30,
                          ),
                        ),
                        const SizedBox(
                          width: 20,
                        ),
                        Icon(
                          Icons.fast_forward,
                          color: blackColor,
                        ),
                        const SizedBox(
                          width: 20,
                        ),
                        Icon(
                          Icons.loop,
                          color: blackColor,
                          size: 19,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              //Space

              const SizedBox(
                height: 18,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 18.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            CustomText(
                                title: 'By Benjamin',
                                fontWeight: FontWeight.w600,
                                fontSize: 12.0,
                                color: textGreyColor2),
                            SizedBox(width: 10.0),
                            CustomText(
                                title: '6 min',
                                color: greyColor,
                                fontWeight: FontWeight.w500,
                                fontSize: 12),
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
                              TextSpan(text: '/03'),
                            ],
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    CustomText(
                      title: "Academic 01",
                      fontSize: 14,
                      color: blackColor,
                      fontWeight: FontWeight.w700,
                    ),
                    const SizedBox(
                      height: 2,
                    ),
                    CustomText(
                      title:
                          "I don't feel as brilliant as the others\nkids in my class",
                      fontSize: 14,
                      color: blackColor,
                      fontWeight: FontWeight.w700,
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: CustomText(
                            title:
                                "Various version has evolved over the years,sometimes humour and using content like",
                            fontSize: 12,
                            color: textGreyColor2,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 30,
                    ),

                    //BUTTON
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        GestureDetector(
                            onTap: () {
                              if (moodSpaceProvider.isThoughtPage) {
                                moodSpaceProvider.onSelectedIndexChange(0);
                                Navigator.pop(context);
                              } else {
                                Helper.toScreen(context, AcademicAudioScreen());
                              }
                            },
                            child: Container(
                              padding: EdgeInsets.symmetric(
                                  horizontal: 37, vertical: 12),
                              child: Text(
                                moodSpaceProvider.isThoughtPage
                                    ? 'Done'
                                    : 'Next',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.w500,
                                    fontSize: 14),
                              ),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(30),
                                  color: darkBlueColor),
                            )),
                      ],
                    ),
                    const SizedBox(
                      height: 80,
                    ),
                  ],
                ),
              )
            ]),
          ),
        );
      }),
    );
  }
}
