import 'dart:async';

import 'package:flutter/material.dart';
import 'package:pin_code_text_field/pin_code_text_field.dart';
import 'package:provider/provider.dart';
import 'package:wellbe/screens/AuthScreens/login_screen.dart';
import 'package:wellbe/screens/AuthScreens/reset_password.dart';
import 'package:wellbe/screens/homepage/HomeScreens/homepage_screen.dart';
import 'package:wellbe/utilites/colors.dart';
import 'package:wellbe/utilites/helper.dart';
import 'package:wellbe/widgets/custom_inkwell_btn.dart';
import 'package:wellbe/widgets/custom_parent_widget.dart';
import 'package:wellbe/widgets/custom_text.dart';

import '../../provider/auth_provider.dart';

class OTPScreen extends StatefulWidget {
  final String phoneNo;
  OTPScreen({Key? key, this.phoneNo = ''}) : super(key: key);

  @override
  State<OTPScreen> createState() => _OTPScreenState();
}

class _OTPScreenState extends State<OTPScreen> {
  var textController = TextEditingController();

  var verificationPin = "";

  Timer? timer1;

  int _start = 59;

  bool? visibleButton = false;
  verifyOtp(BuildContext context, AuthProvider authProvider) {
    authProvider.verifyOtp(widget.phoneNo, verificationPin,
        (bool isLogin, String message) {
      if (isLogin) {
        if (Provider.of<AuthProvider>(context, listen: false).isSignUpPage) {
          Helper.showSnack(context, message);

          Helper.toScreen(context, HomePageScreen());
          Provider.of<AuthProvider>(context, listen: false)
              .onSignUpPageChange(false);
        } else {
          Helper.toScreen(context, ResetPassword());
          Provider.of<AuthProvider>(context, listen: false)
              .onSignUpPageChange(false);
        }
      } else {}
    }, context);
  }

  resendOtp(BuildContext context, AuthProvider authProvider) {
    authProvider.resendOtp(widget.phoneNo, (bool isLogin, String message) {
      if (isLogin) {
        Helper.showSnack(context, message);
        setState(() {
          _start = 59;
          visibleButton = false;
        });
        startTimer();
      } else {
        Helper.showSnack(context, message);
      }
    }, context);
  }

  void startTimer() {
    const oneSec = const Duration(seconds: 1);
    timer1 = new Timer.periodic(oneSec, (Timer timer) {
      setState(
        () {
          if (_start <= 0) {
            //_start = 59;
            timer.cancel();
            visibleButton = true;
            // visibleTimer = false;
          } else {
            _start = _start - 1;
          }
        },
      );
    });
  }

  @override
  void initState() {
    super.initState();
    startTimer();
    textController = TextEditingController();
    // Helper.toScreen(context, HomePageScreen());
  }

  @override
  void setState(VoidCallback fn) {
    if (!mounted) return;
    super.setState(fn);
  }

  @override
  Widget build(BuildContext context) {
    return CustomParentWidget(
      child: Consumer<AuthProvider>(builder: (context, authProvider, child) {
        return Scaffold(
          body: SingleChildScrollView(
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
                  title: "Verify with OTP",
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
                  title: "The 4 digit OTP has been sent to your\n"
                      "registered email and phone number",
                  fontSize: 14,
                  color: greyColor,
                  //  fontWeight: FontWeight.w700,
                  textAlign: TextAlign.center,
                ),
                //Space
                SizedBox(
                  height: 50,
                ),
                //
                //otp fields
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 18),
                  child: PinCodeTextField(
                    autofocus: true,
                    controller: textController,
                    hideCharacter: false,
                    highlight: false,
                    highlightColor: greyColor.withOpacity(0.5),
                    defaultBorderColor: greyColor.withOpacity(0.5),
                    highlightPinBoxColor: kPrimaryColor,
                    hasTextBorderColor: greyColor.withOpacity(0.5),
                    // highlightPinBoxColor: Colors.orange,
                    maxLength: 4,

                    onDone: (text) {
                      verificationPin = text;
                      verifyOtp(context, authProvider);
                    },
                    pinBoxWidth: 50,
                    pinBoxHeight: 60,
                    hasUnderline: false,

                    wrapAlignment: WrapAlignment.spaceAround,
                    pinBoxDecoration:
                        ProvidedPinBoxDecoration.defaultPinBoxDecoration,
                    pinTextStyle: TextStyle(fontSize: 22.0, color: blackColor),
                    pinBoxRadius: 10,
                    pinBoxOuterPadding: EdgeInsets.symmetric(horizontal: 8),
                    pinTextAnimatedSwitcherTransition:
                        ProvidedPinBoxTextAnimation.scalingTransition,
                    maskCharacter: '',
                    //   pinBoxColor: kPrimaryColor,
                    pinTextAnimatedSwitcherDuration:
                        Duration(milliseconds: 300),
//                    highlightAnimation: true,
                    highlightAnimationBeginColor: darkBlueColor,
                    highlightAnimationEndColor: darkBlueColor,
                    keyboardType: TextInputType.number,
                  ),
                ),
                SizedBox(
                  height: 50,
                ),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 8),
                  width: double.infinity,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CustomText(
                        title: "Didn't get OTP? ",
                        fontSize: 12,
                        color: greyColor,
                        textAlign: TextAlign.center,
                        //  fontWeight: FontWeight.w700,
                      ),
                      visibleButton == false
                          ? Container(
                              padding: EdgeInsets.symmetric(horizontal: 10),
                              alignment: Alignment.center,
                              child: Text(
                                "Resend $_start" + "s",
                                style: TextStyle(
                                    color: blackColor,
                                    fontSize: 11,
                                    fontFamily: 'medium'),
                              ),
                            )
                          : CustomInkWell(
                              onTap: () {
                                resendOtp(context, authProvider);

                                //    resendOTP(context, authProvider);
                              },
                              child: Padding(
                                padding: const EdgeInsets.all(10.0),
                                child: CustomText(
                                  title: "Resend",
                                  fontSize: 14,
                                  color: blackColor,
                                  //   decoration: TextDecoration.underline,
                                ),
                              ),
                            ),
                    ],
                  ),
                ),
                //Space
                SizedBox(
                  height: 7,
                ),
                Divider(
                  height: 1,
                  thickness: 0.5,
                  color: greyColor,
                  indent: 18,
                  endIndent: 18,
                ),
                //Space
                SizedBox(
                  height: 7,
                ),
                //Already a Member? Login
                Container(
                  alignment: Alignment.center,
                  padding: EdgeInsets.symmetric(horizontal: 10),
                  child: CustomInkWell(
                    onTap: () {
                      Helper.toScreen(context, LoginScreen());
                    },
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          CustomText(
                            title: "Already a Member?  ",
                            fontSize: 12,
                            color: greyColor,
                            textAlign: TextAlign.center,
                            //  fontWeight: FontWeight.w700,
                          ),
                          CustomText(
                            title: "Login",
                            fontSize: 14,
                            color: blackColor,
                            fontWeight: FontWeight.w500,
                            //   decoration: TextDecoration.underline,
                          ),
                        ],
                      ),
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
