import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wellbe/provider/profile_provider.dart';
import 'package:wellbe/screens/Profile/profile_screen.dart';
import 'package:wellbe/widgets/custom_parent_widget.dart';

import '../../utilites/colors.dart';
import '../../utilites/helper.dart';
import '../../widgets/custom_inkwell_btn.dart';
import '../../widgets/custom_text.dart';

class MyMCIReport extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CustomParentWidget(
      child:
          Consumer<ProfileProvider>(builder: (context, profileProvider, child) {
        return Scaffold(
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
              title: "My MCI Report",
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
                    CustomText(
                      title: "My Stress Score",
                      fontSize: 16,
                      color: blackColor,
                      fontWeight: FontWeight.w600,
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Stack(
                alignment: Alignment.center,
                clipBehavior: Clip.none,
                children: [
                  SliderTheme(
                    data: SliderTheme.of(context).copyWith(
                      thumbShape: CustomThumbShape(),
                    ),
                    child: Slider(
                      value: profileProvider.sliderValue,
                      min: 0.0,
                      max: 100.0,
                      onChanged: (newValue) {
                        profileProvider.onChangeSlider(newValue);
                        // THIS IS THE LOGIC THATS BEEN USED FOR SLIDER VALUE TO MOVE ALONG WITH THUMB
                        // print(
                        //     (MediaQuery.of(context).size.width - 26).toString());
                        // print(((profileProvider.sliderValue / 100.0) *
                        //         (MediaQuery.of(context).size.width - 32))
                        //     .toInt()
                        //     .toString());
                      },
                    ),
                  ),
                  Positioned(
                    left: (profileProvider.sliderValue / 100.0) *
                        (MediaQuery.of(context).size.width - 32),
                    top:
                        -6.0, // Adjust the vertical position of the CustomText widget
                    child: CustomText(
                      fontSize: 13,
                      title: profileProvider.sliderValue.toInt().toString(),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              Stack(
                alignment: Alignment.center,
                children: [
                  Image.asset('assets/icons/stress_score_bg.png'),
                  Column(
                    children: [
                      CustomText(
                        title: '45',
                        fontWeight: FontWeight.w400,
                        color: Colors.white,
                        fontSize: 48,
                      ),
                      CustomText(
                        title: 'Normal',
                        fontWeight: FontWeight.w400,
                        color: Colors.white,
                        fontSize: 14,
                      ),
                    ],
                  )
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 18.0),
                child: Row(
                  children: [
                    CustomText(
                      title: 'Heading 01',
                      fontWeight: FontWeight.w500,
                      fontSize: 14,
                      color: blackColor,
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 18.0),
                child: Row(
                  children: [
                    Container(
                      width: 8,
                      height: 8,
                      decoration: BoxDecoration(
                          shape: BoxShape.circle, color: Colors.amber),
                    ),
                    const SizedBox(
                      width: 3,
                    ),
                    CustomText(
                      title: ' 14 Jan 2022',
                      color: Colors.black,
                      fontSize: 12,
                    ),
                    const SizedBox(
                      width: 30,
                    ),
                    Container(
                      width: 8,
                      height: 8,
                      decoration: BoxDecoration(
                          shape: BoxShape.circle, color: kPrimaryColor),
                    ),
                    const SizedBox(
                      width: 3,
                    ),
                    CustomText(
                      title: ' Normal',
                      color: Colors.black,
                      fontSize: 12,
                    ),
                    const SizedBox(
                      width: 30,
                    ),
                    Container(
                      width: 8,
                      height: 8,
                      decoration: BoxDecoration(
                          shape: BoxShape.circle, color: purpleColor),
                    ),
                    const SizedBox(
                      width: 3,
                    ),
                    CustomText(
                      title: ' Medium',
                      color: Colors.black,
                      fontSize: 12,
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 18.0),
                child: Row(
                  children: [
                    CustomText(
                      title: 'Heading 01',
                      fontWeight: FontWeight.w500,
                      fontSize: 14,
                      color: blackColor,
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 2,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 18.0),
                child: Wrap(
                  children: [
                    CustomText(
                      title:
                          'Lorem ipsum dolor sit amet, consectetur adipiscing elit.',
                      color: Colors.black,
                      fontSize: 12,
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 40,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  GestureDetector(
                      onTap: () {
                        Helper.toScreen(context, ProfileScreen());
                      },
                      child: Container(
                        padding:
                            EdgeInsets.symmetric(horizontal: 33, vertical: 12),
                        child: Text(
                          'Back to Home',
                          style: TextStyle(
                              color: darkBlueColor,
                              fontWeight: FontWeight.w700,
                              fontSize: 14),
                        ),
                        decoration: BoxDecoration(
                            border: Border.all(color: darkBlueColor),
                            borderRadius: BorderRadius.circular(30),
                            color: Colors.white),
                      )),
                  const SizedBox(
                    width: 10,
                  ),
                ],
              ),
            ],
          )),
        );
      }),
    );
  }
}

class CustomThumbShape extends SliderComponentShape {
  static const double _thumbSize = 20.0;

  @override
  Size getPreferredSize(bool isEnabled, bool isDiscrete) {
    return Size(_thumbSize, _thumbSize);
  }

  @override
  void paint(
    PaintingContext context,
    Offset thumbCenter, {
    Animation<double>? activationAnimation,
    Animation<double>? enableAnimation,
    bool? isDiscrete,
    TextPainter? labelPainter,
    RenderBox? parentBox,
    SliderThemeData? sliderTheme,
    TextDirection? textDirection,
    double? value,
    double? textScaleFactor,
    Size? sizeWithOverflow,
  }) {
    final Canvas canvas = context.canvas;

    final thumbRadius = _thumbSize / 2;
    final activeThumbPaint = Paint()..color = sliderTheme!.activeTrackColor!;
    final innerThumbPaint = Paint()..color = Colors.white;

    canvas.drawCircle(thumbCenter, thumbRadius, activeThumbPaint);
    canvas.drawCircle(thumbCenter, thumbRadius * 0.5, innerThumbPaint);
  }
}
