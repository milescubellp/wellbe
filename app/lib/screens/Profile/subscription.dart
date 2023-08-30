import 'package:flutter/material.dart';
import 'package:wellbe/screens/Profile/profile_screen.dart';
import 'package:wellbe/screens/homepage/HomeScreens/homepage_screen.dart';
import 'package:wellbe/utilites/helper.dart';
import 'package:wellbe/widgets/custom_parent_widget.dart';

import '../../utilites/colors.dart';
import '../../widgets/custom_inkwell_btn.dart';
import '../../widgets/custom_text.dart';

class Subscription extends StatelessWidget {
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
          title: "Subscription",
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
            height: 37,
          ),
          Image.asset(
            'assets/icons/subscription_zoom.png',
            width: 90,
          ),
          const SizedBox(
            height: 6,
          ),
          CustomText(
            title: 'Hi Amelia',
            fontWeight: FontWeight.w700,
            fontSize: 19,
          ),
          const SizedBox(
            height: 3,
          ),
          CustomText(
            textAlign: TextAlign.center,
            title: 'Thank you for purchasing our\nsubscription',
            fontWeight: FontWeight.w500,
            fontSize: 12,
            color: greyColor,
          ),
          const SizedBox(
            height: 30,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 18.0),
            child: Row(
              children: [
                CustomText(
                  title: 'Order Details',
                  fontWeight: FontWeight.w500,
                  fontSize: 16,
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 15,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 18.0),
            child: Row(
              children: [
                Container(
                  width: 10,
                  height: 10,
                  decoration:
                      BoxDecoration(shape: BoxShape.circle, color: greenColor),
                ),
                const SizedBox(
                  width: 5,
                ),
                CustomText(
                  title: ' Date of Purchase: 20 Feb 2023',
                  color: textGreyColor2,
                  fontSize: 13,
                  fontWeight: FontWeight.w500,
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 15,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 18.0),
            child: Row(
              children: [
                Container(
                  width: 10,
                  height: 10,
                  decoration:
                      BoxDecoration(shape: BoxShape.circle, color: greenColor),
                ),
                const SizedBox(
                  width: 5,
                ),
                CustomText(
                  title: ' Amount Paid: 1499/-',
                  color: textGreyColor2,
                  fontSize: 13,
                  fontWeight: FontWeight.w500,
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 15,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 18.0),
            child: Row(
              children: [
                Container(
                  width: 10,
                  height: 10,
                  decoration:
                      BoxDecoration(shape: BoxShape.circle, color: greenColor),
                ),
                const SizedBox(
                  width: 5,
                ),
                CustomText(
                  title: ' Renew on: 20 Feb 2024',
                  color: textGreyColor2,
                  fontSize: 13,
                  fontWeight: FontWeight.w500,
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 15,
          ),
          Stack(
            clipBehavior: Clip.none,
            alignment: Alignment.bottomCenter,
            children: [
              Container(
                  margin: EdgeInsets.symmetric(horizontal: 16),
                  padding: EdgeInsets.symmetric(horizontal: 16, vertical: 19),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(color: greyColor)),
                  child: Stack(
                    children: [
                      CustomText(
                        title:
                            'We hope you are enjoying the premium experience.\nThanks for your supporting WellBe,your\ncontribution is a big deal to our company\n\nHappy invoicing\n\nTem WellBe',
                        color: textGreyColor2,
                        fontSize: 13,
                        fontWeight: FontWeight.w600,
                      ),
                    ],
                  )),
              Positioned(
                bottom: -30,
                child: Image.asset(
                  'assets/icons/wb_logo_01.png',
                  width: 60,
                ),
              )
            ],
          ),
          const SizedBox(
            height: 55,
          ),
          // GestureDetector(
          //     onTap: () {
          //       Navigator.pop(context);
          //       Helper.toScreen(
          //           context,
          //           HomePageScreen(
          //             index: 0,
          //           ));
          //     },
          //     child: Container(
          //       padding: EdgeInsets.symmetric(horizontal: 33, vertical: 12),
          //       child: Text(
          //         'Back to Home',
          //         style: TextStyle(
          //             color: darkBlueColor,
          //             fontWeight: FontWeight.w700,
          //             fontSize: 14),
          //       ),
          //       decoration: BoxDecoration(
          //           border: Border.all(color: darkBlueColor),
          //           borderRadius: BorderRadius.circular(30),
          //           color: Colors.white),
          //     )),    // GestureDetector(
          //     onTap: () {
          //       Navigator.pop(context);
          //       Helper.toScreen(
          //           context,
          //           HomePageScreen(
          //             index: 0,
          //           ));
          //     },
          //     child: Container(
          //       padding: EdgeInsets.symmetric(horizontal: 33, vertical: 12),
          //       child: Text(
          //         'Back to Home',
          //         style: TextStyle(
          //             color: darkBlueColor,
          //             fontWeight: FontWeight.w700,
          //             fontSize: 14),
          //       ),
          //       decoration: BoxDecoration(
          //           border: Border.all(color: darkBlueColor),
          //           borderRadius: BorderRadius.circular(30),
          //           color: Colors.white),
          //     )),
          const SizedBox(
            height: 15,
          ),
        ],
      )),
    ));
  }
}
