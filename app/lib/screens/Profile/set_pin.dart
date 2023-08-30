import 'package:flutter/material.dart';
import 'package:wellbe/widgets/custom_parent_widget.dart';

import '../../utilites/colors.dart';
import '../../utilites/helper.dart';
import '../../widgets/custom_inkwell_btn.dart';
import '../../widgets/custom_text.dart';

class SetPin extends StatelessWidget {
  void _openSuccessfulDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return Container(
          child: Dialog(
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
                    title: 'Password Changed',
                    fontSize: 20,
                    fontWeight: FontWeight.w600,
                    color: blackColor,
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: 12),
                  Text(
                    'Your password has been updated\nsuccessfully',
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
                      Expanded(
                        child: GestureDetector(
                            onTap: () {},
                            child: Container(
                              alignment: Alignment.center,
                              padding: EdgeInsets.symmetric(vertical: 8),
                              child: Text(
                                'Login Again',
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
                      ),
                      const SizedBox(
                        width: 6,
                      ),
                      Expanded(
                        child: ElevatedButton(
                          onPressed: () {
                            // Perform action for the second button
                            // Helper.toScreen(context, ProfileScreen());
                          },
                          child: CustomText(
                            title: 'Stay Login',
                            fontSize: 14,
                            color: Colors.white,
                          ),
                          style: ElevatedButton.styleFrom(
                            // padding: EdgeInsets.symmetric(horizontal: 30),
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
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    bool isChecked = false;
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
            title: "Settings",
            fontSize: 18,
            color: blackColor,
            fontWeight: FontWeight.w700,
          ),
        ),
        body: SingleChildScrollView(
            child: Form(
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
                'assets/icons/set_PIN.png',
                width: 90,
              ),
              const SizedBox(
                height: 6,
              ),
              CustomText(
                title: 'Set Pin',
                fontWeight: FontWeight.w700,
                fontSize: 19,
              ),
              const SizedBox(
                height: 3,
              ),
              CustomText(
                textAlign: TextAlign.center,
                title:
                    'Your new pin must be different from\npreviously used password',
                fontWeight: FontWeight.w500,
                fontSize: 12,
                color: greyColor,
              ),
              const SizedBox(
                height: 30,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 18.0),
                child: Column(
                  children: [
                    Row(
                      children: [
                        CustomText(
                          title: 'Enter your PIN',
                          fontSize: 13,
                          fontWeight: FontWeight.w500,
                          color: textGreyColor,
                        )
                      ],
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Container(
                          margin: EdgeInsets.only(right: 7),
                          width: 45,
                          height: 45,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(5),
                            border:
                                Border.all(color: mediumGreyColor, width: 1),
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(right: 7),
                          width: 45,
                          height: 45,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(5),
                            border:
                                Border.all(color: mediumGreyColor, width: 1),
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(right: 7),
                          width: 45,
                          height: 45,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(5),
                            border:
                                Border.all(color: mediumGreyColor, width: 1),
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(right: 7),
                          width: 45,
                          height: 45,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(5),
                            border:
                                Border.all(color: mediumGreyColor, width: 1),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 18.0),
                child: Column(
                  children: [
                    Row(
                      children: [
                        CustomText(
                          title: 'Confirm your PIN',
                          fontSize: 13,
                          fontWeight: FontWeight.w500,
                          color: textGreyColor,
                        )
                      ],
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Container(
                          margin: EdgeInsets.only(right: 7),
                          width: 45,
                          height: 45,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(5),
                            border:
                                Border.all(color: mediumGreyColor, width: 1),
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(right: 7),
                          width: 45,
                          height: 45,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(5),
                            border:
                                Border.all(color: mediumGreyColor, width: 1),
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(right: 7),
                          width: 45,
                          height: 45,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(5),
                            border:
                                Border.all(color: mediumGreyColor, width: 1),
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(right: 7),
                          width: 45,
                          height: 45,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(5),
                            border:
                                Border.all(color: mediumGreyColor, width: 1),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25.0),
                child: Row(
                  children: [
                    Container(
                      width: 5,
                      height: 5,
                      child: Checkbox(
                        materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                        visualDensity: VisualDensity(horizontal: -4),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(
                              5.0), // Customize border radius
                          side: BorderSide(
                            width: 0.5, // Customize border width
                            color: lightGrey, // Customize border color
                          ),
                        ),
                        value: isChecked,
                        onChanged: (value) {},
                      ),
                    ),
                    const SizedBox(
                      width: 12,
                    ),
                    CustomText(
                      title: 'Remember Me',
                      fontSize: 12,
                      fontWeight: FontWeight.w500,
                      color: textGreyColor,
                    )
                  ],
                ),
              ),
              const SizedBox(
                height: 60,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  GestureDetector(
                      onTap: () {},
                      child: Container(
                        padding:
                            EdgeInsets.symmetric(horizontal: 33, vertical: 12),
                        child: Text(
                          'Cancel',
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
                  GestureDetector(
                      onTap: () {
                        _openSuccessfulDialog(context);
                      },
                      child: Container(
                        padding:
                            EdgeInsets.symmetric(horizontal: 37, vertical: 12),
                        child: Text(
                          'Update',
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w500,
                              fontSize: 14),
                        ),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(30),
                            color: darkBlueColor),
                      )),
                ],
              ),
              const SizedBox(
                height: 40,
              ),
            ],
          ),
        )),
      ),
    );
  }
}
