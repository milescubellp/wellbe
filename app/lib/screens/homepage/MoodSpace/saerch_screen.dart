import 'package:flutter/material.dart';
import 'package:wellbe/screens/homepage/MoodSpace/podcasts_details.dart';
import 'package:wellbe/widgets/custom_parent_widget.dart';

import '../../../models/CustomModels/custom_model.dart';
import '../../../utilites/colors.dart';
import '../../../utilites/helper.dart';
import '../../../widgets/custom_inkwell_btn.dart';
import '../../../widgets/custom_text.dart';
import '../../../widgets/custom_textfield.dart';

class SearchScreen extends StatefulWidget {
  String? screenName;
  SearchScreen({this.screenName});
  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  FocusNode _textFieldFocusNode = FocusNode();

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _textFieldFocusNode.requestFocus();
    });
  }

  @override
  Widget build(BuildContext context) {
    return CustomParentWidget(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: CustomInkWell(
          child: SafeArea(
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(
                    height: 20,
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 18.0),
                    child: Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: CustomInkWell(
                              onTap: () {
                                Navigator.pop(context);
                              },
                              child: Icon(Icons.arrow_back_ios)),
                        ),
                        if (widget.screenName != null)
                          Expanded(
                            child: CustomTextField(
                              onTap: () {},
                              //controller: emailController,
                              focusNode: _textFieldFocusNode,
                              keyboardType: TextInputType.text,
                              //textInputAction: TextInputAction.done,
                              isOutlineInputBorder: true,
                              isOutlineInputBorderColor: greyColor,
                              onChanged: (_) {},
                              hintText: "Search your query",
                              hintWeight: FontWeight.w700,
                              hintTextColor: greyColor,
                              hintFontSize: 15,
                              fieldborderRadius: 7,
                              outlineBottomLeftRadius: 30,
                              outlineTopRightRadius: 30,
                              outlineTopLeftRadius: 30,
                              outlineBottomRightRadius: 30,
                              contentPaddingBottom: 0,
                              contentPaddingLeft: 30,
                              contentPaddingRight: 30,
                              isFilled: true,
                              textFieldFillColor: Colors.white.withOpacity(0.2),
                              suffixIcon: Image.asset(
                                "assets/icons/search.png",
                                color: greyColor,
                              ),
                            ),
                          ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  if (widget.screenName != null)
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 18.0),
                      child: CustomText(
                        title: "Top Searches",
                        fontSize: 16,
                        color: blackColor,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  const SizedBox(
                    height: 10,
                  ),
                  if (widget.screenName != null)
                    Container(
                      height: 100,
                      child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: journalList.length,
                          padding: EdgeInsets.symmetric(horizontal: 18.0),
                          shrinkWrap: true,
                          physics: ClampingScrollPhysics(),
                          itemBuilder: (context, index) {
                            return Container(
                              width: MediaQuery.of(context).size.width * 0.9,
                              child: CustomInkWell(
                                onTap: () {
                                  // pushNewScreen(context,
                                  // screen: PodcastsDetails(), withNavBar: false);
                                  Helper.toScreen(
                                      context,
                                      PodcastsDetails(
                                        index: 2,
                                      ));
                                },
                                child: Container(
                                  padding: EdgeInsets.symmetric(
                                      horizontal: 10, vertical: 10),
                                  margin: EdgeInsets.only(right: 10),
                                  decoration: BoxDecoration(
                                      color: extraLightGreyColor,
                                      borderRadius: BorderRadius.circular(8)),
                                  child: Row(
                                    children: [
                                      Stack(
                                        alignment: Alignment.center,
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
                                                        "assets/icons/image_01.png"))),
                                            clipBehavior: Clip.hardEdge,
                                          ),
                                          Icon(
                                            Icons.play_arrow_rounded,
                                            color: Colors.white,
                                            size: 30,
                                          )
                                        ],
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
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                CustomText(
                                                  title:
                                                      "Quick Meditation 2023\nMeditate with me",
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
                                            CustomText(
                                              title:
                                                  "By Benjamin - 03 Episodes",
                                              fontSize: 12,
                                              color: textGreyColor2,
                                              //fontWeight: FontWeight.w700,
                                            ),
                                          ],
                                        ),
                                      ),
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
                    ),
                  Padding(
                    padding: const EdgeInsets.all(18.0),
                    child: CustomText(
                      title: "Search Results",
                      fontSize: 16,
                      color: blackColor,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  ListView.builder(
                      itemCount: journalList.length,
                      padding: EdgeInsets.symmetric(horizontal: 18.0),
                      shrinkWrap: true,
                      physics: ClampingScrollPhysics(),
                      itemBuilder: (context, index) {
                        return Container(
                          padding: EdgeInsets.only(bottom: 10),
                          child: CustomInkWell(
                            onTap: () {
                              // pushNewScreen(context,
                              // screen: PodcastsDetails(), withNavBar: false);
                              Helper.toScreen(
                                  context,
                                  PodcastsDetails(
                                    index: 3,
                                  ));
                            },
                            child: Container(
                              padding: EdgeInsets.symmetric(
                                  horizontal: 10, vertical: 10),
                              decoration: BoxDecoration(
                                  color: extraLightGreyColor,
                                  borderRadius: BorderRadius.circular(8)),
                              child: Row(
                                children: [
                                  Stack(
                                    alignment: Alignment.center,
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
                                                    "assets/icons/image_01.png"))),
                                        clipBehavior: Clip.hardEdge,
                                      ),
                                      Icon(
                                        Icons.play_arrow_rounded,
                                        color: Colors.white,
                                        size: 30,
                                      )
                                    ],
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
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          CustomText(
                                            title:
                                                "Quick Meditation 2023\nMeditate with me",
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
                                      CustomText(
                                        title: "By Benjamin - 03 Episodes",
                                        fontSize: 12,
                                        color: textGreyColor2,
                                        //fontWeight: FontWeight.w700,
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
                      })
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
