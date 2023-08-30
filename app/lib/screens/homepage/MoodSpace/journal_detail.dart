import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wellbe/provider/meditation_provider.dart';
import 'package:wellbe/utilites/colors.dart';
import 'package:wellbe/utilites/helper.dart';
import 'package:wellbe/widgets/custom_inkwell_btn.dart';
import 'package:wellbe/widgets/custom_parent_widget.dart';
import 'package:wellbe/widgets/custom_text.dart';

import 'edit_journal_detail.dart';

class JournalDetail extends StatefulWidget {
  const JournalDetail({Key? key}) : super(key: key);

  @override
  State<JournalDetail> createState() => _JournalDetailState();
}

class _JournalDetailState extends State<JournalDetail> {
  bool isEdit = false;
  @override
  Widget build(BuildContext context) {
    return CustomParentWidget(
      child: Consumer<MeditationProvider>(
          builder: (context, meditationProvider, child) {
        return Scaffold(
          appBar: AppBar(
            elevation: 0,
            centerTitle: false,
            automaticallyImplyLeading: false,
            backgroundColor: kPrimaryColor,
            title: CustomText(
              title: "Five minute Journal 02",
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
          body: SingleChildScrollView(
            child: Column(
              children: [
                //Box
                Container(
                  height: 310,
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                      color: kPrimaryColor,
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(25),
                        bottomRight: Radius.circular(25),
                      )),
                  padding:
                      EdgeInsets.only(left: 18, right: 18, top: 10, bottom: 25),
                  child: Container(
                    //  width: double.infinity,
                    height: 250,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        image: DecorationImage(
                            fit: BoxFit.cover,
                            image:
                                AssetImage("assets/icons/image_02_zoom.png"))),
                  ),
                ),
                //Space
                SizedBox(
                  height: 20,
                ),
                //
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 18),
                  child: Row(
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            CustomText(
                              title: "12 Apr 2023",
                              fontSize: 11,
                              color: greyColor,
                            ),
                            //Space
                            SizedBox(
                              height: 5,
                            ),
                            CustomText(
                              title: "Five Minute Journal 02",
                              fontSize: 15,
                              color: blackColor,
                              fontWeight: FontWeight.w700,
                            )
                          ],
                        ),
                      ),
                      CustomInkWell(
                        onTap: () {
                          Helper.toScreen(context, EditJournalDetail());
                        },
                        child: Container(
                            padding: EdgeInsets.all(8),
                            decoration: BoxDecoration(
                                color: darkBlueColor, shape: BoxShape.circle),
                            child: Icon(
                              Icons.mode_edit_outlined,
                              color: whiteColor,
                            )),
                      )
                    ],
                  ),
                ),
                //Space
                SizedBox(
                  height: 20,
                ),
                //
                Container(
                  width: double.infinity,
                  padding: EdgeInsets.symmetric(horizontal: 18),
                  child: CustomText(
                    title:
                        "It is a long established fact that a reader will be "
                        "and the distracted by the readable content of a page when looking "
                        "at its by layout. The point of using is that it a normal distribution "
                        "of letters, as opposed to using content here, content here, making it look "
                        "like readable English. Many desktop the a publishing packages and web page editors "
                        "now as their default model text, and a search for will be uncover "
                        "many web sites still in their infancy.\n\nVarious versions have evolved over the years, sometimes by "
                        "accident, sometimes on purpose and to injected humour and using content the like.",
                    fontSize: 13,
                    color: blackColor,
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
              ],
            ),
          ),
        );
      }),
    );
  }
}
