import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../provider/ventout_provider.dart';
import '../../../utilites/colors.dart';
import '../../../utilites/helper.dart';
import '../../../widgets/custom_inkwell_btn.dart';
import '../../../widgets/custom_parent_widget.dart';
import '../../../widgets/custom_text.dart';
import 'connecting_expert.dart';

class TalkToExpertTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CustomParentWidget(
      child:
          Consumer<VentoutProvider>(builder: (context, ventoutProvider, child) {
        return SingleChildScrollView(
          child: Column(children: [
            Column(
              children: [
                // Padding(
                //   padding: const EdgeInsets.symmetric(horizontal: 40.0),
                //   child: ClipRRect(
                //     borderRadius: BorderRadius.circular(15),
                //     child: Image.asset(
                //       'assets/images/slide_img2.png',
                //       width: double.maxFinite,
                //       height: 290,
                //       fit: BoxFit.cover,
                //     ),
                //   ),
                // ),
                const SizedBox(
                  height: 40,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 40.0),
                  child: CustomText(
                      title: 'Talk to Experts',
                      fontWeight: FontWeight.w800,
                      textAlign: TextAlign.center,
                      fontSize: 15),
                ),
                const SizedBox(
                  height: 10,
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: CustomText(
                      title:
                          "Stil Confused?Dont't worry\nNext Few Questions You will help you to learn more\nabout your mental health",
                      fontWeight: FontWeight.w400,
                      textAlign: TextAlign.center,
                      fontSize: 11),
                ),
                const SizedBox(
                  height: 10,
                ),
                //BUTTON
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 40.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      GestureDetector(
                        onTap: () {
                          ventoutProvider.onScreenChange(true);
                        },
                        child: Container(
                          padding: EdgeInsets.symmetric(
                              horizontal: 42, vertical: 12),
                          child: Text(
                            'Chat Now',
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
                ),
                const SizedBox(
                  height: 20,
                ),
              ],
            ),
          ]),
        );
      }),
    );
  }
}
