import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wellbe/widgets/custom_parent_widget.dart';

import '../../provider/auth_provider.dart';
import '../../utilites/colors.dart';
import '../../utilites/helper.dart';
import '../../widgets/custom_inkwell_btn.dart';
import '../../widgets/custom_text.dart';

class SettingScreen extends StatelessWidget {
  final formKey = GlobalKey<FormState>();
  final oldPasswordController = TextEditingController();
  final newPasswordController = TextEditingController();

  final confirmPasswordController = TextEditingController();

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

  resetPassword(BuildContext context, AuthProvider authProvider) {
    if (formKey.currentState!.validate()) {
      authProvider.resetPassword(newPasswordController.text.trim(),
          confirmPasswordController.text.trim(),
          (bool isVerified, String message) {
        if (isVerified) {
          Helper.showSnack(context, message);
          Navigator.pop(context);
        } else {
          Helper.showSnack(context, message);
        }
      }, context);
    }
  }

  @override
  Widget build(BuildContext context) {
    bool isChecked = false;
    return CustomParentWidget(
      child: Consumer<AuthProvider>(builder: (context, authProvider, child) {
        return Scaffold(
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
            key: formKey,
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
                  'assets/icons/create_password.png',
                  width: 90,
                ),
                const SizedBox(
                  height: 6,
                ),
                CustomText(
                  title: 'Create New Password',
                  fontWeight: FontWeight.w700,
                  fontSize: 19,
                ),
                const SizedBox(
                  height: 3,
                ),
                CustomText(
                  textAlign: TextAlign.center,
                  title:
                      'Your new password must be different from\npreviously used password',
                  fontWeight: FontWeight.w500,
                  fontSize: 12,
                  color: greyColor,
                ),
                const SizedBox(
                  height: 30,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 18.0),
                  child: TextFormField(
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Password is required';
                      } else if (value.length < 6) {
                        return 'Password must be greater than 5 characters';
                      }
                      return null;
                    },
                    controller: oldPasswordController,
                    decoration: InputDecoration(
                      errorStyle: TextStyle(
                          fontWeight: FontWeight.w500, color: textGreyColor),
                      constraints: BoxConstraints(
                        minHeight: 25.0,
                      ),
                      border: OutlineInputBorder(
                        borderSide: BorderSide(color: greyColor, width: 2),
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: greyColor, width: 2),
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      hintText: 'Old Password',
                      suffixIcon: Icon(
                        Icons.visibility_outlined,
                        color: greyColor,
                      ),
                      hintStyle: TextStyle(
                          fontWeight: FontWeight.w400, color: greyColor),
                      contentPadding:
                          EdgeInsets.symmetric(horizontal: 20.0, vertical: 15),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 18.0),
                  child: TextFormField(
                    controller: newPasswordController,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Password is required';
                      } else if (value.length < 6) {
                        return 'Password must be greater than 5 characters';
                      }
                      return null;
                    },
                    decoration: InputDecoration(
                      constraints: BoxConstraints(
                        minHeight: 25.0,
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: greyColor, width: 2),
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      border: OutlineInputBorder(
                        borderSide: BorderSide(color: greyColor, width: 2),
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      hintText: 'New Password',
                      suffixIcon: Icon(
                        Icons.visibility_off_outlined,
                        color: greyColor,
                      ),
                      hintStyle: TextStyle(
                          fontWeight: FontWeight.w400, color: greyColor),
                      contentPadding:
                          EdgeInsets.symmetric(horizontal: 20.0, vertical: 15),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 18.0),
                  child: TextFormField(
                    controller: confirmPasswordController,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Password is required';
                      } else if (value.length < 6) {
                        return 'Password must be greater than 5 characters';
                      } else if (!value.contains(newPasswordController.text)) {
                        return 'New password and Confirm password should be same';
                      }
                      return null;
                    },
                    decoration: InputDecoration(
                      constraints: BoxConstraints(
                        minHeight: 25.0,
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: greyColor, width: 2),
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      border: OutlineInputBorder(
                        borderSide: BorderSide(color: greyColor, width: 2),
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      hintText: 'Confirm Password',
                      suffixIcon: Icon(
                        Icons.visibility_off_outlined,
                        color: greyColor,
                      ),
                      hintStyle: TextStyle(
                          fontWeight: FontWeight.w400, color: greyColor),
                      contentPadding:
                          EdgeInsets.symmetric(horizontal: 20.0, vertical: 15),
                    ),
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
                          materialTapTargetSize:
                              MaterialTapTargetSize.shrinkWrap,
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
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 18.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      // GestureDetector(
                      //     onTap: () {},
                      //     child: Container(
                      //       padding:
                      //           EdgeInsets.symmetric(horizontal: 33, vertical: 12),
                      //       child: Text(
                      //         'Cancel',
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
                      // const SizedBox(
                      //   width: 10,
                      // ),
                      Expanded(
                        child: GestureDetector(
                            onTap: () {
                              // _openSuccessfulDialog(context);
                              resetPassword(context, authProvider);
                            },
                            child: Container(
                              alignment: Alignment.center,
                              padding: EdgeInsets.symmetric(
                                  horizontal: 37, vertical: 12),
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
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 40,
                ),
              ],
            ),
          )),
        );
      }),
    );
  }
}
