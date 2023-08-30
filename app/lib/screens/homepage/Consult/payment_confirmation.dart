import 'package:flutter/material.dart';
import 'package:pin_code_text_field/pin_code_text_field.dart';
import 'package:provider/provider.dart';
import 'package:wellbe/provider/auth_provider.dart';
import 'package:wellbe/provider/consult_provider.dart';
import 'package:wellbe/screens/homepage/Consult/teenage_booking.dart';
import 'package:wellbe/utilites/validator.dart';
import 'package:wellbe/widgets/custom_textfield.dart';

import '../../../provider/DoctorUserProvider/doctor_user_provider.dart';
import '../../../utilites/colors.dart';
import '../../../utilites/helper.dart';
import '../../../utilites/time.dart';
import '../../../widgets/custom_inkwell_btn.dart';
import '../../../widgets/custom_text.dart';
import 'booking confirmed.dart';

class PaymentConfirmationScreen extends StatelessWidget {
  final int? bookingCountdown;
  final String? bookingType;
  final int? sessionDuration;
  final DateTime? appointmentDateTime;
  final double? paymentDueAmount;
  TextEditingController clientName = TextEditingController();
  TextEditingController textController = TextEditingController();
  TextEditingController guardianName = TextEditingController();
  TextEditingController guardianNumber = TextEditingController();
  TextEditingController guardianEmail = TextEditingController();
  // TextEditingController clientsDetails = TextEditingController();

  TextEditingController clientsNumber = TextEditingController();
  final formKey = GlobalKey<FormState>();

  var verificationPin = "";

  PaymentConfirmationScreen({
    this.bookingCountdown,
    this.bookingType,
    this.sessionDuration,
    this.appointmentDateTime,
    this.paymentDueAmount,
  });

  addAppointment(BuildContext context, DoctorUserProvider doctorUserProvider,
      ConsultProvider consultProvider) {
    if (formKey.currentState!.validate()) {
      if (Provider.of<AuthProvider>(context, listen: false).isVerified) {
        doctorUserProvider.addAppointment(
            Provider.of<AuthProvider>(context, listen: false).getUserID(),
            consultProvider.doctorId.toString(),
            consultProvider.appointmentDate,
            consultProvider.sessionMode,
            consultProvider.timeSlot,
            consultProvider.sessionDuration,
            consultProvider.sessionPrice,
            clientName.text,
            clientsNumber.text,
            consultProvider.showTextField ? '1' : '0',
            guardianName.text,
            guardianEmail.text,
            guardianNumber.text, (bool status, String message) {
          if (status) {
            Helper.toScreen(context, BookingConfirmed());

            clientName.clear();
            clientsNumber.clear();
            guardianNumber.clear();
            guardianEmail.clear();
            guardianName.clear();
            consultProvider.onVerifiedChange(val: false);
          } else {
            Helper.showSnack(context, message);
          }
        }, context);
      } else {
        Helper.showSnack(context, 'Please verify your number',
            color: textRedColor);
      }
    }
  }

  verifyOtp(BuildContext context, AuthProvider authProvider) {
    authProvider.verifyOtp(clientsNumber.text, verificationPin,
        (bool isLogin, String message) {
      if (isLogin) {
        Helper.showSnack(context, 'verification was successfull');
        authProvider.verifyNumber(true);
      } else {
        Helper.showSnack(context, 'verification failed');
        authProvider.verifyNumber(false);
      }
    }, context);
  }

  resendOtp(BuildContext context, AuthProvider authProvider) {
    authProvider.resendOtp(clientsNumber.text, (bool isLogin, String message) {
      if (isLogin) {
        Helper.showSnack(context, 'Otp has been send on this number.');
      } else {
        Helper.showSnack(context, 'Error in sending otp');
      }
    }, context);
  }

  @override
  Widget build(BuildContext context) {
    return Consumer3<ConsultProvider, DoctorUserProvider, AuthProvider>(builder:
        (context, consultProvider, doctorUserProvider, authProvider, child) {
      return Scaffold(
        appBar: AppBar(
          elevation: 0,
          centerTitle: false,
          automaticallyImplyLeading: false,
          backgroundColor: Colors.white,
          title: CustomText(
            title: "Confirmation",
            fontSize: 17,
            color: blackColor,
            fontWeight: FontWeight.w700,
          ),
          leading: CustomInkWell(
            onTap: () {
              Navigator.pop(context);
              consultProvider.onVerifiedChange(val: false);
            },
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Image.asset(
                "assets/icons/arrow_back_02.png",
                scale: 1.1,
              ),
            ),
          ),
        ),
        body: SingleChildScrollView(
          child: Form(
            key: formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const SizedBox(
                  height: 10,
                ),
                Container(
                  width: double.maxFinite,
                  alignment: Alignment.center,
                  padding: EdgeInsets.all(12.0),
                  decoration: BoxDecoration(
                    color: kPrimaryColor.withOpacity(0.6),
                  ),
                  child: CustomText(
                    title: 'Please complete the booking in 09:37',
                    fontSize: 11,
                  ),
                ),
                const SizedBox(
                  height: 60,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 18.0),
                  child: Container(
                    width: double.maxFinite,
                    alignment: Alignment.center,
                    padding:
                        EdgeInsets.symmetric(horizontal: 14.0, vertical: 12),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      color: kPrimaryColor.withOpacity(0.6),
                    ),
                    child: Row(
                      children: [
                        consultProvider.sessionMode.contains('Video Call')
                            ? Icon(
                                Icons.video_call_outlined,
                                size: 50,
                              )
                            : consultProvider.sessionMode.contains('Voice Call')
                                ? Icon(
                                    Icons.mic_rounded,
                                    size: 50,
                                  )
                                : Icon(
                                    Icons.chat,
                                    size: 50,
                                  ),
                        const SizedBox(
                          width: 10,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            CustomText(
                              title: '${consultProvider.appointmentDate}',
                              fontSize: 11,
                            ),
                            const SizedBox(
                              height: 7,
                            ),
                            CustomText(
                              title:
                                  '${removeAmPmFromTime(consultProvider.timeSlot)} | ${consultProvider.sessionDuration} mins',
                              fontSize: 11,
                              fontWeight: FontWeight.w500,
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 18.0),
                  child: CustomTextField(
                    hintText: 'Have a coupon code?',
                    isUnderlineInputBorder: true,
                    isOutlineInputBorder: false,
                    hintTextColor: Colors.grey.withOpacity(0.5),
                    suffixIconConstraints: BoxConstraints(
                      maxHeight: 50,
                    ),
                    suffixIcon: Container(
                        width: 20,
                        height: 20,
                        decoration: BoxDecoration(
                            shape: BoxShape.circle, color: kPrimaryColor),
                        child: Icon(
                          Icons.arrow_forward_ios,
                          color: Colors.black,
                          size: 12,
                        )),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                const SizedBox(
                  height: 12,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 18.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      CustomText(
                        title: 'Amount payable',
                        color: Colors.black,
                        fontSize: 10.7,
                        fontWeight: FontWeight.w500,
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 12,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 18.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      CustomText(
                        title: 'Price for 1 session',
                        color: textGreyColor2,
                        fontSize: 10.2,
                      ),
                      Row(
                        children: [
                          // CustomText(
                          //   title: '₹800',
                          //   color: blackColor,
                          //   decorationStyle: TextDecorationStyle.solid,
                          //   fontSize: 12.8,
                          //   decoration: TextDecoration.lineThrough,
                          //   fontWeight: FontWeight.w500,
                          // ),

                          CustomText(
                            title: '₹400.00',
                            color: Colors.lightGreen,
                            fontSize: 11,
                            fontWeight: FontWeight.w500,
                          ),
                          const SizedBox(
                            width: 7,
                          ),
                        ],
                      )
                    ],
                  ),
                ),
                const SizedBox(
                  height: 12,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 18.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      CustomText(
                        title: 'Final  amount',
                        color: Colors.black,
                        fontSize: 10.7,
                      ),
                      Row(
                        children: [
                          CustomText(
                            title: '₹800.00',
                            color: blackColor,
                            fontSize: 12,
                            fontWeight: FontWeight.w500,
                          ),
                          SizedBox(
                            width: 7,
                          )
                        ],
                      )
                    ],
                  ),
                ),
                const SizedBox(
                  height: 18,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 18.0),
                  child: Divider(
                    color: lightGreyColor,
                    thickness: 2,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 18.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      SizedBox(
                        child: Checkbox(
                          visualDensity:
                              VisualDensity(horizontal: -4, vertical: -4),
                          value: consultProvider.showTextField,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(3)),
                          onChanged: consultProvider.handleRadioValueChanged,
                        ),
                      ),
                      CustomText(
                        title: 'Under 18',
                        fontSize: 12,
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Visibility(
                  visible: consultProvider.showTextField,
                  maintainSize: false,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 18),
                        child: CustomText(
                          title: 'Guardian Name',
                          fontSize: 12,
                          color: greyColor,
                        ),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 18),
                        child: SizedBox(
                            // height: 50,
                            child: CustomTextField(
                          controller: guardianName,
                          validation: (val) {
                            if (val!.isEmpty) {
                              return 'this field cannot be empty';
                            }
                          },
                        )),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 18),
                        child: CustomText(
                          title: 'Guardian Number',
                          fontSize: 12,
                          color: greyColor,
                        ),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 18.0),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              alignment: Alignment.center,
                              width: 40,
                              height: 40,
                              decoration: BoxDecoration(
                                  border: Border.all(color: greyColor),
                                  borderRadius: BorderRadius.circular(8)),
                              child: CustomText(
                                title: '+91',
                                fontSize: 14.5,
                              ),
                            ),
                            const SizedBox(
                              width: 4,
                            ),
                            Expanded(
                              child: SizedBox(
                                // height: 40,
                                child: CustomTextField(
                                  hintTextColor: mediumGreyColor,
                                  controller: guardianNumber,
                                  validation: validateMobile,
                                  hintText: 'mobile',
                                  fontSize: 13,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 8,
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 18),
                        child: CustomText(
                          title: 'Guardian Email',
                          fontSize: 12,
                          color: greyColor,
                        ),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 18),
                        child: SizedBox(
                            // height: 50,
                            child: CustomTextField(
                          controller: guardianEmail,
                          validation: emailField,
                        )),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 18,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 18.0),
                  child: CustomText(
                    title: 'Client details:',
                    color: Colors.black,
                    fontSize: 11,
                  ),
                ),
                const SizedBox(
                  height: 4,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 18.0),
                  child: SizedBox(
                    // height: 50,
                    child: CustomTextField(
                      hintText: 'Shyam',
                      fieldborderColor: Colors.grey.withOpacity(0.3),
                      hintFontSize: 12,
                      controller: clientName,
                      validation: (val) {
                        if (val!.isEmpty) {
                          return 'this field cannot be empty';
                        } else {
                          return null;
                        }
                      },
                      hintTextColor: greyColor.withOpacity(0.3),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 18.0),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        alignment: Alignment.center,
                        width: 45,
                        height: 45,
                        decoration: BoxDecoration(
                            border: Border.all(color: greyColor),
                            borderRadius: BorderRadius.circular(8)),
                        child: CustomText(
                          title: '+91',
                          fontSize: 14.5,
                        ),
                      ),
                      const SizedBox(
                        width: 4,
                      ),
                      Expanded(
                        child: SizedBox(
                          // height: 40,
                          child: CustomTextField(
                            hintTextColor: mediumGreyColor,
                            hintText: 'mobile',
                            fontSize: 13,
                            validation: validateMobile,
                            controller: clientsNumber,
                            suffixIcon: Padding(
                              padding: const EdgeInsets.only(right: 10.0),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  authProvider.isVerified
                                      ? CustomText(
                                          title: 'Verified',
                                        )
                                      : CustomInkWell(
                                          onTap: () {
                                            consultProvider.onVerifiedChange();
                                            if (consultProvider.isVerfied)
                                              resendOtp(
                                                  context,
                                                  Provider.of<AuthProvider>(
                                                      context,
                                                      listen: false));
                                          },
                                          child: CustomText(
                                            title: 'Verify',
                                          ),
                                        ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 15.0),
                //otp fields
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Visibility(
                      maintainAnimation: false,
                      maintainState: false,
                      maintainSize: false,
                      visible: consultProvider.isVerfied,
                      child: Container(
                        padding: EdgeInsets.symmetric(horizontal: 18),
                        child: PinCodeTextField(
                          autofocus: false,
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
                          pinBoxHeight: 45,
                          hasUnderline: false,

                          wrapAlignment: WrapAlignment.spaceAround,
                          pinBoxDecoration:
                              ProvidedPinBoxDecoration.defaultPinBoxDecoration,
                          pinTextStyle:
                              TextStyle(fontSize: 22.0, color: blackColor),
                          pinBoxRadius: 10,
                          pinBoxOuterPadding:
                              EdgeInsets.symmetric(horizontal: 8),
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
                    ),
                  ],
                ),
                SizedBox(height: 32.0),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 18.0),
                  child: SizedBox(
                    width: double.maxFinite,
                    child: ElevatedButton(
                      onPressed: () {
                        // Perform action for the second button

                        addAppointment(
                            context, doctorUserProvider, consultProvider);
                      },
                      child: CustomText(
                        title: 'Confirm Payment',
                        fontSize: 12,
                        color: Colors.white,
                      ),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: darkBlueColor,
                        foregroundColor: Colors.white,
                        padding: EdgeInsets.symmetric(vertical: 15),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(60),
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 25,
                ),
              ],
            ),
          ),
        ),
      );
    });
  }
}
