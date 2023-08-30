import 'package:flutter/material.dart';
import 'package:wellbe/utilites/helper.dart';
import 'package:wellbe/widgets/custom_parent_widget.dart';

import '../../../utilites/colors.dart';
import '../../../widgets/custom_inkwell_btn.dart';
import '../../../widgets/custom_text.dart';

import 'breath_in.dart';

class BreathingCardInfo extends StatelessWidget {
  const BreathingCardInfo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomParentWidget(
      child: Scaffold(
        appBar: AppBar(
          elevation: 0,
          centerTitle: false,
          automaticallyImplyLeading: false,
          backgroundColor: Colors.white,
          title: CustomText(
            title: "Anapana Technique",
            fontSize: 17,
            color: blackColor,
            fontWeight: FontWeight.w700,
          ),
          actions: [
            CustomInkWell(
              onTap: () {
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
        body: Column(children: [
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
            height: 50,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 40.0),
            child: Column(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(15),
                  child: Image.asset(
                    'assets/images/slide_img2.png',
                    width: double.maxFinite,
                    height: 290,
                    fit: BoxFit.cover,
                  ),
                ),
                const SizedBox(
                  height: 40,
                ),
                CustomText(
                    title: 'Anapana Technique\nEmbrace Equanimity',
                    fontWeight: FontWeight.w800,
                    textAlign: TextAlign.center,
                    fontSize: 15),
                const SizedBox(
                  height: 10,
                ),
                CustomText(
                    title:
                        'Discover the path to a calm mind\nand Reduced Stress',
                    fontWeight: FontWeight.w400,
                    textAlign: TextAlign.center,
                    fontSize: 11),
                const SizedBox(
                  height: 30,
                ),
                //BUTTON
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    GestureDetector(
                      onTap: () {
                        Helper.toScreen(context, BreathIn());
                      },
                      child: Container(
                        padding:
                            EdgeInsets.symmetric(horizontal: 42, vertical: 12),
                        child: Text(
                          'Start',
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w500,
                              fontSize: 14),
                        ),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(30),
                            color: darkBlueColor),
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 50,
                ),
              ],
            ),
          ),
        ]),
      ),
    );
  }
}
