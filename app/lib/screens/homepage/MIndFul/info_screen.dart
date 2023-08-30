import 'package:flutter/material.dart';
import 'package:wellbe/widgets/custom_parent_widget.dart';

import '../../../utilites/colors.dart';
import '../../../widgets/custom_inkwell_btn.dart';
import '../../../widgets/custom_text.dart';

class InfoScreen extends StatelessWidget {
  List<String> technique = [
    'Focus you attention on the breath specifically at\nthe nostrils,to stay present in the moment',
    'If your mind starts to wander,gently bring it\nback to the natural flow of breath',
    'You can also observe the temperature of your\nbreath to refine your focus'
  ];
  List<String> steps = [
    'Breathe in naturally trough your nose,without\ncontrolling or extending your breath',
    'Breathe out naturally trough your nose,\nfollowing the natural flow of your breath',
    'Take your time to breathe in naturally,without\nrushing or holding your breath',
    'Breathe out the air naturally,allowing for both\nshort and long breaths.',
    'Breathe in naturally,allowing for both\nshort and long breaths',
    'Breathe in naturally and effortlessly,letting the\nbreath come naturally to you',
    'Breathe out naturally,maintaining a normal\npace'
  ];
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
          title: "Anapana Technique\nEmbrace Equanimity",
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
          ),
        ],
      ),
      body: SingleChildScrollView(
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
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
        SizedBox(
          height: 15,
        ),
        Padding(
          padding: const EdgeInsets.only(left: 18.0),
          child: CustomText(
            title: 'Discover The Path to a Calm Mind\nand Reduced Stress',
            fontWeight: FontWeight.w500,
            fontSize: 13,
          ),
        ),
        SizedBox(
          height: 15,
        ),
        Padding(
          padding: const EdgeInsets.only(left: 18.0),
          child: CustomText(
            title: 'Technique',
            fontWeight: FontWeight.bold,
            fontSize: 13,
          ),
        ),
        SizedBox(
          height: 15,
        ),
        ListView.builder(
            shrinkWrap: true,
            padding: const EdgeInsets.only(left: 18.0),
            itemCount: technique.length,
            itemBuilder: (context, index) => Container(
                  margin: EdgeInsets.only(bottom: 12),
                  child: Row(
                    children: [
                      const SizedBox(
                        width: 6,
                      ),
                      Container(
                        width: 12,
                        height: 12,
                        decoration: BoxDecoration(
                            shape: BoxShape.circle, color: kPrimaryColor),
                      ),
                      const SizedBox(
                        width: 16,
                      ),
                      CustomText(
                        title: technique[index],
                        fontSize: 11.8,
                      )
                    ],
                  ),
                )),
        SizedBox(
          height: 15,
        ),
        Padding(
          padding: const EdgeInsets.only(left: 18.0),
          child: CustomText(
            title: 'Steps',
            fontWeight: FontWeight.bold,
            fontSize: 13,
          ),
        ),
        SizedBox(
          height: 15,
        ),
        ListView.builder(
            padding: const EdgeInsets.only(left: 18.0),
            shrinkWrap: true,
            itemCount: steps.length,
            itemBuilder: (context, index) => Container(
                  margin: EdgeInsets.only(bottom: 12),
                  child: Row(
                    children: [
                      Container(
                          width: 25,
                          height: 25,
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                              shape: BoxShape.circle, color: kPrimaryColor),
                          child: CustomText(
                            title: '${index + 1}',
                            color: blueColor,
                            fontSize: 18,
                          )),
                      const SizedBox(
                        width: 10,
                      ),
                      CustomText(
                        title: steps[index],
                        fontSize: 11.8,
                      )
                    ],
                  ),
                ))
      ])),
    ));
  }
}
