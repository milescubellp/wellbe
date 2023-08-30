import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wellbe/widgets/error_text_widget.dart';

import '../../../models/CustomModels/custom_model.dart';
import '../../../provider/ThoughtProvider/thought_provider.dart';
import '../../../utilites/colors.dart';
import '../../../utilites/helper.dart';
import '../../../widgets/custom_inkwell_btn.dart';
import '../../../widgets/custom_loader.dart';
import '../../../widgets/custom_text.dart';

import 'activity_details.dart';

class MyActivities extends StatefulWidget {
  const MyActivities({Key? key}) : super(key: key);

  @override
  State<MyActivities> createState() => _MyActivitiesState();
}

class _MyActivitiesState extends State<MyActivities> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Provider.of<ThoughtProvider>(context, listen: false)
        .getUserThoughts((status) {}, context);
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<ThoughtProvider>(
        builder: (context, thoughtProvider, child) {
      return Column(
        children: [
          SizedBox(
            height: 20,
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
                      title: "Lets get it back on track with a brief exercise",
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
          thoughtProvider.isLoading
              ? Center(
                  child: CustomLoader(),
                )
              : !thoughtProvider.isLoading &&
                      thoughtProvider.getUserThoughtModel.length == 0
                  ? Center(
                      child: ErrorTextWidget(),
                    )
                  : Expanded(
                      child: ListView.builder(
                          padding: const EdgeInsets.symmetric(horizontal: 18.0),
                          itemCount: thoughtProvider.getUserThoughtModel.length,
                          shrinkWrap: true,
                          physics: ClampingScrollPhysics(),
                          itemBuilder: (context, index) {
                            final getUserThought =
                                thoughtProvider.getUserThoughtModel[index];
                            return Container(
                              padding: EdgeInsets.only(bottom: 10),
                              child: CustomInkWell(
                                onTap: () {
                                  Helper.toScreen(
                                      context,
                                      ActivityDetails(
                                        url: getUserThought
                                            .thoughtdetails![0].audioVideo
                                            .toString(),
                                        description: getUserThought
                                            .thoughtdetails![0].description
                                            .toString(),
                                        title: getUserThought
                                            .thoughtdetails![0].title
                                            .toString(),
                                        fileType: getUserThought
                                            .thoughtdetails![0].fileType
                                            .toString(),
                                      ));
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
                                                    "${meditationList[0].img}"))),
                                        clipBehavior: Clip.hardEdge,
                                      ),
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
                                          CustomText(
                                            title:
                                                "${getUserThought.thoughtdetails![0].title}",
                                            fontSize: 14.5,
                                            color: blackColor,
                                            fontWeight: FontWeight.w600,
                                          ),
                                          //Space
                                          SizedBox(
                                            height: 6,
                                          ),
                                          Container(
                                            width: 50,
                                            height: 19,
                                            decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(50),
                                              color: kPrimaryColor,
                                            ),
                                            child: Center(
                                              child: Text(
                                                'Hello',
                                                style: TextStyle(
                                                    fontSize: 13,
                                                    color: blueColor,
                                                    fontWeight:
                                                        FontWeight.w500),
                                              ),
                                            ),
                                          ),

                                          //Space
                                          SizedBox(
                                            height: 6,
                                          ),
                                          CustomText(
                                            title:
                                                "${index + 1 * (2 + index)} Sessions | 1 hr 15 min",
                                            fontSize: 12,
                                            color: greyColor,
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
                    ),
        ],
      );
    });
  }
}
