import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wellbe/provider/meditation_provider.dart';
import 'package:wellbe/utilites/colors.dart';
import 'package:wellbe/widgets/custom_button.dart';
import 'package:wellbe/widgets/custom_inkwell_btn.dart';
import 'package:wellbe/widgets/custom_parent_widget.dart';
import 'package:wellbe/widgets/custom_textfield.dart';

import '../../../utilites/helper.dart';
import '../../../widgets/custom_text.dart';
import '../HomeScreens/homepage_screen.dart';

class EditJournalDetail extends StatefulWidget {
  const EditJournalDetail({Key? key}) : super(key: key);

  @override
  State<EditJournalDetail> createState() => _EditJournalDetailState();
}

class _EditJournalDetailState extends State<EditJournalDetail> {
  TextEditingController detailController = TextEditingController();
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
            width: MediaQuery.of(context).size.width,
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
                  title: 'Saved Successfully',
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                  color: blackColor,
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 12),
                Text(
                  'Your journal has been Saved Successfully',
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
                    CustomButton(
                      onPressed: () {
                        // Perform action for the second button
                        // Helper.toRemoveUntiScreen(context, HeadingForm());
                        Navigator.pop(context);
                        Navigator.pop(context);
                      },
                      fontSize: 12,
                      textColor: Colors.white,
                      title: 'Okay',
                      btnHeight: 40,
                      btnWidth: 90,
                      btnColor: darkBlueColor,
                      btnRadius: 60,
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
  void initState() {
    // TODO: implement initState
    super.initState();
    detailController.text =
        "It is a long established fact that a reader will be "
        "and the distracted by the readable content of a page when looking "
        "at its by layout. The point of using is that it a normal distribution "
        "of letters, as opposed to using content here, content here, making it look "
        "like readable English. Many desktop the a publishing packages and web page editors "
        "now as their default model text, and a search for will be uncover "
        "many web sites still in their infancy.\n\nVarious versions have evolved over the years, sometimes by "
        "accident, sometimes on purpose and to injected humour and using content the like.";
  }

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
              title: "Edit Details",
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
                //Title
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 18),
                  alignment: Alignment.centerLeft,
                  child: CustomText(
                    title: "Title",
                    fontSize: 15,
                    color: blackColor,
                  ),
                ),
                //Space
                SizedBox(
                  height: 2,
                ),
                //
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 18),
                  child: CustomTextField(
                    //controller: emailController,
                    keyboardType: TextInputType.text,
                    //textInputAction: TextInputAction.done,
                    isOutlineInputBorder: true,
                    isOutlineInputBorderColor: greyColor,
                    onChanged: (_) {},
                    hintText: "Five Minute Journal 02",
                    hintFontSize: 13,
                    fieldborderRadius: 7,
                    outlineBottomLeftRadius: 6,
                    outlineTopRightRadius: 6,
                    outlineTopLeftRadius: 6,
                    outlineBottomRightRadius: 6,
                    textFieldFillColor: whiteColor,
                  ),
                ),
                //Space
                SizedBox(
                  height: 20,
                ),
                //
                //Details
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 18),
                  alignment: Alignment.centerLeft,
                  child: CustomText(
                    title: "Details",
                    fontSize: 15,
                    color: blackColor,
                  ),
                ),
                //Space
                SizedBox(
                  height: 2,
                ),
                //
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 18),
                  child: CustomTextField(
                    controller: detailController,
                    keyboardType: TextInputType.text,
                    //textInputAction: TextInputAction.done,
                    isOutlineInputBorder: true,
                    isOutlineInputBorderColor: greyColor,
                    onChanged: (_) {},
                    maxLines: 13,
                    hintText: "",
                    hintFontSize: 13,
                    fieldborderRadius: 7,
                    outlineBottomLeftRadius: 6,
                    outlineTopRightRadius: 6,
                    outlineTopLeftRadius: 6,
                    outlineBottomRightRadius: 6,
                    textFieldFillColor: whiteColor,
                  ),
                ),
                //Space
                SizedBox(
                  height: 20,
                ),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 18),
                  // alignment: Alignment.bottomCenter,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CustomButton(
                        onPressed: () async {
                          //  Helper.toScreen(context, HomePageScreen());
                          Navigator.pop(context);
                        },
                        btnHeight: 48,
                        btnWidth: 140,
                        btnRadius: 26,
                        title: 'Cancel',
                        fontWeight: FontWeight.w600,
                        btnColor: Colors.transparent,
                        btnBorderWidth: 2,
                        btnBorderColor: darkBlueColor,
                        textColor: darkBlueColor,
                        fontSize: 17,
                      ),
                      //Space
                      SizedBox(
                        width: 15,
                      ),
                      CustomButton(
                        onPressed: () async {
                          //Helper.toScreen(context, MyJournalScreen());
                          _openSuccessfulDialog(context);
                        },
                        btnHeight: 48,
                        btnWidth: 140,
                        btnRadius: 26,
                        title: 'Save',
                        fontWeight: FontWeight.w600,
                        btnColor: darkBlueColor,
                        textColor: whiteColor,
                        fontSize: 17,
                      ),
                    ],
                  ),
                ),
                //Space
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
