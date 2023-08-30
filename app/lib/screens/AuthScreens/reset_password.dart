import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:wellbe/screens/AuthScreens/forgot_password.dart';
import 'package:wellbe/screens/AuthScreens/login_screen.dart';
import 'package:wellbe/screens/homepage/HomeScreens/homepage_screen.dart';
import 'package:wellbe/utilites/colors.dart';
import 'package:wellbe/utilites/helper.dart';
import 'package:wellbe/utilites/validator.dart';
import 'package:wellbe/widgets/custom_button.dart';
import 'package:wellbe/widgets/custom_inkwell_btn.dart';
import 'package:wellbe/widgets/custom_parent_widget.dart';
import 'package:wellbe/widgets/custom_text.dart';
import 'package:wellbe/widgets/custom_textfield.dart';

import '../../provider/auth_provider.dart';
import 'signup_screen.dart';

class ResetPassword extends StatefulWidget {
  const ResetPassword({Key? key}) : super(key: key);

  @override
  State<ResetPassword> createState() => _ResetPasswordState();
}

class _ResetPasswordState extends State<ResetPassword> {
  final formKey = GlobalKey<FormState>();

  final password1Controller = TextEditingController();
  final password2Controller = TextEditingController();
  resetPassword(BuildContext context, AuthProvider authProvider) {
    if (formKey.currentState!.validate()) {
      authProvider.resetPassword(
          password1Controller.text.trim(), password2Controller.text.trim(),
          (bool isVerified, String message) {
        if (isVerified) {
          Helper.showSnack(context, message);
          Helper.toRemoveUntiScreen(context, LoginScreen());
        } else {
          Helper.showSnack(context, message);
        }
      }, context);
    }
  }

  @override
  Widget build(BuildContext context) {
    return CustomParentWidget(
      child: Consumer<AuthProvider>(builder: (context, authProvider, child) {
        return Scaffold(
          body: Form(
            key: formKey,
            child: Stack(
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Image.asset(
                      "assets/icons/footer_bg_wave.png",
                      fit: BoxFit.cover,
                      width: double.infinity,
                    ),
                  ],
                ),
                Container(
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        //Space
                        SizedBox(
                          height: 100,
                        ),
                        Center(
                          child: Image.asset(
                            "assets/icons/ic_app.png",
                            scale: 2,
                          ),
                        ),
                        //Space
                        SizedBox(
                          height: 50,
                        ),
                        //
                        CustomText(
                          title: "Create new password",
                          fontSize: 23,
                          color: blackColor,
                          fontWeight: FontWeight.w700,
                          textAlign: TextAlign.center,
                        ),
                        //Space
                        // SizedBox(
                        //   height: 10,
                        // ),
                        //
                        // CustomText(
                        //   title: "Welcome Back to WellBe",
                        //   fontSize: 14,
                        //   color: greyColor,
                        //   //  fontWeight: FontWeight.w700,
                        //   textAlign: TextAlign.center,
                        // ),
                        //Space
                        SizedBox(
                          height: 50,
                        ),
                        //Username / Code
                        Container(
                          padding: const EdgeInsets.symmetric(horizontal: 18),
                          child: CustomTextField(
                            controller: password1Controller,
                            keyboardType: TextInputType.visiblePassword,
                            autofillHints: [AutofillHints.password],
                            textInputAction: TextInputAction.next,
                            isOutlineInputBorder: true,
                            isOutlineInputBorderColor: greyColor,
                            onChanged: (_) {},
                            validation: validatePassword,
                            hintText: "Password",
                            hintFontSize: 13,
                            fieldborderRadius: 7,
                            outlineBottomLeftRadius: 6,
                            outlineTopRightRadius: 6,
                            outlineTopLeftRadius: 6,
                            outlineBottomRightRadius: 6,
                            //onEditingComplete: () => TextInput.finishAutofillContext(),
                            textFieldFillColor: whiteColor,
                            prefixIcon: Image.asset(
                              "assets/icons/password.png",
                              scale: 1.5,
                            ),
                          ),
                        ),
                        //Space
                        SizedBox(
                          height: 12,
                        ),
                        //Password
                        Container(
                          padding: const EdgeInsets.symmetric(horizontal: 18),
                          child: CustomTextField(
                              controller: password2Controller,
                              keyboardType: TextInputType.visiblePassword,
                              autofillHints: [AutofillHints.password],
                              textInputAction: TextInputAction.done,
                              isOutlineInputBorder: true,
                              isOutlineInputBorderColor: greyColor,
                              onChanged: (_) {},
                              validation: (value) {
                                if (value!.isEmpty) {
                                  return 'Invalid password';
                                } else if (value.length < 6) {
                                  return "Password should be between 6-20 characters";
                                } else if (!value
                                    .contains(password1Controller.text)) {
                                  return "New Password and Confirm Password should be same";
                                } else {
                                  return null;
                                }
                              },
                              hintText: "Confirm Password",
                              hintFontSize: 13,
                              fieldborderRadius: 7,
                              outlineBottomLeftRadius: 6,
                              outlineTopRightRadius: 6,
                              outlineTopLeftRadius: 6,
                              outlineBottomRightRadius: 6,
                              onEditingComplete: () =>
                                  TextInput.finishAutofillContext(),
                              textFieldFillColor: whiteColor,
                              prefixIcon: Image.asset(
                                "assets/icons/password.png",
                                scale: 1.5,
                              )),
                        ),
                        //Space
                        SizedBox(
                          height: 5,
                        ),
                        //Forgot Password?
                        Container(
                          alignment: Alignment.centerLeft,
                          padding: EdgeInsets.symmetric(horizontal: 10),
                          child: CustomInkWell(
                            onTap: () {},
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: CustomText(
                                title: " ",
                                fontSize: 12,
                                color: blackColor,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                        ),
                        //Space
                        SizedBox(
                          height: 20,
                        ),
                        //
                        Container(
                          padding: EdgeInsets.symmetric(horizontal: 18),
                          // alignment: Alignment.bottomCenter,
                          child: CustomButton(
                            onPressed: () async {
                              resetPassword(context, authProvider);
                            },
                            btnHeight: 48,
                            btnWidth: double.infinity,
                            btnRadius: 26,
                            title: 'Reset Password',
                            fontWeight: FontWeight.w600,
                            btnColor: darkBlueColor,
                            textColor: whiteColor,
                            fontSize: 17,
                          ),
                        ),
                        //Space
                        SizedBox(
                          height: 5,
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      }),
    );
  }
}
