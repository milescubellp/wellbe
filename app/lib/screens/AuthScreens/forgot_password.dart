import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:wellbe/screens/AuthScreens/otp_screen.dart';
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

class ForgotPassword extends StatefulWidget {
  const ForgotPassword({Key? key}) : super(key: key);

  @override
  State<ForgotPassword> createState() => _ForgotPasswordState();
}

class _ForgotPasswordState extends State<ForgotPassword> {
  final formKey = GlobalKey<FormState>();

  final phoneNumberController = TextEditingController();
  forgotPassword(BuildContext context, AuthProvider authProvider) {
    if (formKey.currentState!.validate()) {
      authProvider.forgotPassword(phoneNumberController.text,
          (bool isVerified, String message) {
        if (isVerified) {
          Helper.toRemoveUntiScreen(
              context,
              OTPScreen(
                phoneNo: phoneNumberController.text,
              ));
          Helper.showSnack(context, message);
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
                          title: "Forgot your password?",
                          fontSize: 23,
                          color: blackColor,
                          fontWeight: FontWeight.w700,
                          textAlign: TextAlign.center,
                        ),
                        //Space
                        SizedBox(
                          height: 10,
                        ),
                        //
                        CustomText(
                          title: "Please make sure to write correct email!",
                          fontSize: 14,
                          color: greyColor,
                          //  fontWeight: FontWeight.w700,
                          textAlign: TextAlign.center,
                        ),
                        //Space
                        SizedBox(
                          height: 50,
                        ),
                        //Username / Code
                        Container(
                          padding: const EdgeInsets.symmetric(horizontal: 18),
                          child: CustomTextField(
                            controller: phoneNumberController,
                            keyboardType: TextInputType.number,
                            autofillHints: [AutofillHints.telephoneNumber],
                            textInputAction: TextInputAction.next,
                            isOutlineInputBorder: true,
                            isOutlineInputBorderColor: greyColor,
                            onChanged: (_) {},
                            validation: phoneField,
                            hintText: "Phone number",
                            hintFontSize: 13,
                            fieldborderRadius: 7,
                            outlineBottomLeftRadius: 6,
                            outlineTopRightRadius: 6,
                            outlineTopLeftRadius: 6,
                            outlineBottomRightRadius: 6,
                            //onEditingComplete: () => TextInput.finishAutofillContext(),
                            textFieldFillColor: whiteColor,
                            prefixIcon: Image.asset(
                              "assets/icons/phone.png",
                              scale: 1.5,
                            ),
                          ),
                        ),
                        //Space
                        SizedBox(
                          height: 12,
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
                                title: "",
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
                              forgotPassword(context, authProvider);
                            },
                            btnHeight: 48,
                            btnWidth: double.infinity,
                            btnRadius: 26,
                            title: 'Confirm',
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
