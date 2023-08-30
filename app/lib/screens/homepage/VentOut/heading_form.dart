import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wellbe/provider/ventout_provider.dart';
import 'package:wellbe/screens/homepage/VentOut/ventout_screen.dart';

import '../../../utilites/colors.dart';
import '../../../utilites/helper.dart';
import '../../../widgets/custom_inkwell_btn.dart';
import '../../../widgets/custom_parent_widget.dart';
import '../../../widgets/custom_text.dart';
import 'edit_your_post.dart';

class HeadingForm extends StatelessWidget {
  void _openDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return Dialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          child: Container(
            padding: EdgeInsets.all(20),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Container(
                  // 'assets/icons/delete_popup.png',
                  width: 70, // Replace with your image asset path
                  height: 70,
                ),
                SizedBox(height: 16),
                CustomText(
                  title: 'Hey Wait!',
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                  color: blackColor,
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 12),
                Text(
                  'Are you sure do you want to delete\nthis comment?',
                  style: TextStyle(
                      fontSize: 12,
                      color: textGreyColor2,
                      fontWeight: FontWeight.w700),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 16),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Expanded(
                      child: ElevatedButton(
                        onPressed: () {
                          // Perform action for the first button
                          Navigator.pop(context);
                          _openSuccessfulDialog(context);
                          // Helper.toScreen(context, DoctorDetails());
                        },
                        child: CustomText(
                            title: 'Yes, Delete',
                            color: blueColor,
                            fontWeight: FontWeight.bold,
                            fontSize: 12),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.transparent,
                          foregroundColor: Colors.white,
                          elevation: 0,
                          padding:
                              EdgeInsets.symmetric(vertical: 2, horizontal: 7),
                          shape: RoundedRectangleBorder(
                            side: BorderSide(width: 2, color: blueColor),
                            borderRadius: BorderRadius.circular(60),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 4,
                    ),
                    Expanded(
                      child: ElevatedButton(
                        onPressed: () {
                          // Perform action for the second button
                          // Helper.toReplacementScreenSlideLeftToRight(
                          //     context, MoodSpace());
                          Navigator.pop(context);
                        },
                        child: CustomText(
                          title: "No,I don't",
                          fontSize: 12,
                          color: Colors.white,
                        ),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: darkBlueColor,
                          foregroundColor: Colors.white,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(60),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  void _openDisabledDialog(
      BuildContext context, VentoutProvider ventoutProvider) async {
    final result = showDialog(
      context: context,
      builder: (BuildContext context) {
        return Consumer<VentoutProvider>(
            builder: (context, ventoutProvider, child) {
          return Dialog(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
            ),
            child: Container(
              padding: EdgeInsets.all(16),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Image.asset(
                    'assets/icons/successful_popup.png',
                    width: 70, // Replace with your image asset path
                    height: 70,
                  ),
                  SizedBox(height: 16),
                  CustomText(
                    title: ventoutProvider.isDisabled
                        ? 'Enabled Done'
                        : 'Disabled Done!',
                    fontSize: 20,
                    fontWeight: FontWeight.w600,
                    color: blackColor,
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: 12),
                  Text(
                    ventoutProvider.isDisabled
                        ? ' Comment has been enabled successfully'
                        : ' Comment has been disbled successfully',
                    style: TextStyle(
                        fontSize: 12,
                        color: textGreyColor2,
                        fontWeight: FontWeight.w700),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: 16),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(
                        width: 60,
                        child: ElevatedButton(
                          onPressed: () async {
                            Navigator.pop(context);
                          },
                          child: CustomText(
                            title: 'ok',
                            fontSize: 12,
                            color: Colors.white,
                          ),
                          style: ElevatedButton.styleFrom(
                            backgroundColor: darkBlueColor,
                            foregroundColor: Colors.white,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(60),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          );
        });
      },
    );
    await result;
    await Future.delayed(Duration(milliseconds: 20));

    if (ventoutProvider.isDisabled == true) {
      ventoutProvider.onDisabledChange(false);
    } else {
      ventoutProvider.onDisabledChange(true);
    }
  }

  void _openSuccessfulDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return Dialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          child: Container(
            padding: EdgeInsets.all(20),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Image.asset(
                  'assets/icons/successful_popup.png',
                  width: 70, // Replace with your image asset path
                  height: 70,
                ),
                SizedBox(height: 16),
                CustomText(
                  title: 'Your Comment\n has been deleted',
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                  color: blackColor,
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 12),
                Text(
                  'Your comment has been deleted',
                  style: TextStyle(
                      fontSize: 12,
                      color: textGreyColor2,
                      fontWeight: FontWeight.w700),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 16),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ElevatedButton(
                      onPressed: () {
                        // Perform action for the second button
                        Navigator.pop(context);
                      },
                      child: CustomText(
                        title: 'Okay',
                        fontSize: 12,
                        color: Colors.white,
                      ),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: darkBlueColor,
                        foregroundColor: Colors.white,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(60),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return CustomParentWidget(
      child:
          Consumer<VentoutProvider>(builder: (context, ventoutProvider, child) {
        return Scaffold(
          appBar: AppBar(
            elevation: 0,
            centerTitle: false,
            automaticallyImplyLeading: false,
            backgroundColor: Colors.white,
            title: CustomText(
              title: "Heading Form 01",
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
          body: ListView.builder(
              itemCount: 4,
              itemBuilder: (context, index) => Column(children: [
                    Container(
                      padding: EdgeInsets.fromLTRB(17, 10, 0, 10),
                      margin: EdgeInsets.only(bottom: 14),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(13),
                        color: kPrimaryColor.withOpacity(0.5),
                      ),
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                Container(
                                  padding: EdgeInsets.all(3),
                                  decoration: BoxDecoration(
                                      color: Colors.white,
                                      shape: BoxShape.circle,
                                      boxShadow: [
                                        BoxShadow(
                                            spreadRadius: 4,
                                            blurRadius: 1,
                                            color: lightGrey,
                                            offset: Offset(1, 1))
                                      ]),
                                  child: CircleAvatar(
                                      radius: 18,
                                      backgroundImage: AssetImage(
                                        'assets/icons/user_03.png',
                                      )),
                                ),
                                const SizedBox(
                                  width: 9,
                                ),
                                Row(
                                  children: [
                                    CustomText(
                                      title: 'You',
                                      fontWeight: FontWeight.w600,
                                      color: blackColor,
                                      fontSize: 12.5,
                                    ),
                                    CustomText(
                                      title: ' | 1 min ago',
                                      fontWeight: FontWeight.w500,
                                      color: textGreyColor,
                                      fontSize: 12.5,
                                    ),
                                  ],
                                ),
                                const Spacer(),
                                PopupMenuButton<String>(
                                  padding: EdgeInsets.zero,
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(13)),
                                  icon: Icon(
                                    Icons.more_vert,
                                    color: textGreyColor2,
                                    size: 22,
                                  ),
                                  itemBuilder: (BuildContext context) =>
                                      <PopupMenuEntry<String>>[
                                    PopupMenuItem<String>(
                                      height: 20,
                                      onTap: null,
                                      value: 'edit',
                                      child: CustomText(
                                          title: 'Edit',
                                          fontSize: 13,
                                          fontWeight: FontWeight.normal),
                                    ),
                                    PopupMenuItem<String>(
                                      height: 20,
                                      value: 'delete',
                                      child: CustomText(
                                          title: 'Delete',
                                          fontSize: 13,
                                          fontWeight: FontWeight.normal),
                                    ),
                                    PopupMenuItem<String>(
                                      value: 'disable',
                                      height: 20,
                                      child: CustomText(
                                          title: Provider.of<VentoutProvider>(
                                                      context,
                                                      listen: false)
                                                  .isDisabled
                                              ? 'Enable Comment'
                                              : 'Disable Comment',
                                          fontSize: 13,
                                          fontWeight: FontWeight.normal),
                                    ),
                                    // PopupMenuItem<String>(
                                    //   value: 'report',
                                    //   child: Text('Report'),
                                    // ),
                                  ],
                                  onSelected: (String value) {
                                    // Handle selected option here
                                    if (value == 'edit') {
                                      Helper.toScreen(context, EditYourPost());
                                    } else if (value == 'delete') {
                                      _openDialog(context);
                                    } else if (value == 'disable') {
                                      _openDisabledDialog(
                                          context, ventoutProvider);
                                    }
                                    print('Selected option: $value');
                                  },
                                )
                              ],
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            CustomText(
                              title: 'Forum Discussion 01',
                              fontWeight: FontWeight.w700,
                              color: blackColor,
                              fontSize: 14.6,
                            ),
                            const SizedBox(
                              height: 5,
                            ),
                            Row(
                              children: [
                                Expanded(
                                  child: CustomText(
                                    title:
                                        "Mental health issues are common and can greatly affect individuals' lives.Conditions like depression and anxiety can cause significant distress.",
                                    color: blackColor,
                                    fontSize: 11,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(
                              height: 4,
                            ),
                            Row(
                              children: [
                                Image.asset('assets/icons/like_01.png'),
                                const SizedBox(
                                  width: 3,
                                ),
                                CustomText(
                                  title: '124 |',
                                  fontWeight: FontWeight.w500,
                                  color: greyColor,
                                  fontSize: 12,
                                ),
                                const SizedBox(
                                  width: 4,
                                ),
                                CustomText(
                                  title: 'Reply',
                                  fontWeight: FontWeight.w500,
                                  color: greyColor,
                                  fontSize: 12,
                                ),
                              ],
                            ),
                            const SizedBox(
                              height: 15,
                            ),
                            Divider(
                              height: 1,
                              thickness: 2,
                              color: kPrimaryColor,
                              endIndent: 18,
                            ),
                            const SizedBox(
                              height: 15,
                            ),
                            CustomText(
                              title: 'All Comments (24)',
                              fontWeight: FontWeight.w700,
                              color: blackColor,
                              fontSize: 12,
                            ),
                            const SizedBox(
                              height: 7,
                            ),
                            Row(
                              children: [
                                Column(
                                  children: [
                                    Container(
                                      padding: EdgeInsets.all(3),
                                      decoration: BoxDecoration(
                                          color: Colors.white,
                                          shape: BoxShape.circle,
                                          boxShadow: [
                                            BoxShadow(
                                                spreadRadius: 4,
                                                blurRadius: 1,
                                                color: lightGrey,
                                                offset: Offset(1, 1))
                                          ]),
                                      child: CircleAvatar(
                                          radius: 14,
                                          backgroundImage: AssetImage(
                                            'assets/icons/user_03.png',
                                          )),
                                    ),
                                    const SizedBox(
                                      height: 70,
                                    )
                                  ],
                                ),
                                const SizedBox(
                                  width: 9,
                                ),
                                Expanded(
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Row(
                                            children: [
                                              CustomText(
                                                title: 'You',
                                                fontWeight: FontWeight.w600,
                                                color: blackColor,
                                                fontSize: 11,
                                              ),
                                              CustomText(
                                                title: ' | 1 hour ago',
                                                fontWeight: FontWeight.w500,
                                                color: textGreyColor,
                                                fontSize: 11,
                                              ),
                                            ],
                                          ),
                                          SizedBox(
                                            width: 240,
                                            child: Row(
                                              children: [
                                                Expanded(
                                                  child: CustomText(
                                                    title:
                                                        "Mental health issues are common and can greatly affect individuals' lives.Conditions like depression and anxiety can cause significant distress.",
                                                    color: blackColor,
                                                    fontSize: 10,
                                                    fontWeight: FontWeight.w500,
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                          const SizedBox(
                                            height: 4,
                                          ),
                                          Row(
                                            children: [
                                              Image.asset(
                                                'assets/icons/like_01.png',
                                                width: 13,
                                              ),
                                              const SizedBox(
                                                width: 3,
                                              ),
                                              CustomText(
                                                title: '124 |',
                                                fontWeight: FontWeight.w500,
                                                color: greyColor,
                                                fontSize: 11,
                                              ),
                                              const SizedBox(
                                                width: 4,
                                              ),
                                              CustomText(
                                                title: 'Reply',
                                                fontWeight: FontWeight.w500,
                                                color: greyColor,
                                                fontSize: 11,
                                              ),
                                              const SizedBox(
                                                width: 4,
                                              ),
                                              CustomText(
                                                title: '| Delete',
                                                fontWeight: FontWeight.w500,
                                                color: greyColor,
                                                fontSize: 11,
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                      Column(
                                        children: [
                                          PopupMenuButton<String>(
                                            padding: EdgeInsets.zero,
                                            shape: RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(13)),
                                            icon: Icon(
                                              Icons.more_vert,
                                              color: textGreyColor2,
                                              size: 22,
                                            ),
                                            itemBuilder:
                                                (BuildContext context) =>
                                                    <PopupMenuEntry<String>>[
                                              PopupMenuItem<String>(
                                                height: 22,
                                                onTap: null,
                                                value: 'Report',
                                                child: CustomText(
                                                    title: 'Report',
                                                    fontSize: 13,
                                                    fontWeight:
                                                        FontWeight.normal),
                                              ),
                                              PopupMenuItem<String>(
                                                height: 24,
                                                onTap: null,
                                                value: 'delete comment',
                                                child: CustomText(
                                                    title: 'Delete comment',
                                                    fontSize: 13,
                                                    fontWeight:
                                                        FontWeight.normal),
                                              ),

                                              // PopupMenuItem<String>(
                                              //   value: 'report',
                                              //   child: Text('Report'),
                                              // ),
                                            ],
                                            onSelected: (String value) {
                                              // Handle selected option here
                                              if (value == 'report') {
                                                // Helper.toScreen(
                                                //     context, EditYourPost());
                                              }
                                              if (value == 'delete comment') {
                                                _openDialog(context);
                                              }
                                              print('Selected option: $value');
                                            },
                                          ),
                                          const SizedBox(
                                            height: 70,
                                          )
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ]),
                    )
                  ])),
          bottomNavigationBar: Container(
            height: 100.0,
            decoration: BoxDecoration(
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.5),
                  spreadRadius: 2,
                  blurRadius: 5,
                  offset: Offset(0, 3),
                ),
              ],
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 18.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TextField(
                    decoration: InputDecoration(
                      constraints: BoxConstraints(
                        minHeight: 30.0,
                      ),
                      border: OutlineInputBorder(
                        borderSide: BorderSide(color: greyColor, width: 2),
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      hintText: 'Start writing your comments',
                      suffixIcon: CustomInkWell(
                        onTap: () {},
                        child: Image.asset(
                          'assets/icons/post_02.png',
                          scale: 1.1,
                        ),
                      ),
                      hintStyle: TextStyle(
                          fontWeight: FontWeight.w500, color: greyColor),
                      contentPadding:
                          EdgeInsets.symmetric(horizontal: 20.0, vertical: 15),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      }),
    );
  }
}
