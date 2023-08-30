import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:wellbe/provider/auth_provider.dart';
import 'package:wellbe/utilites/colors.dart';
import 'package:wellbe/utilites/helper.dart';
import 'package:wellbe/utilites/validator.dart';
import 'package:wellbe/widgets/custom_button.dart';
import 'package:wellbe/widgets/custom_inkwell_btn.dart';
import 'package:wellbe/widgets/custom_parent_widget.dart';
import 'package:wellbe/widgets/custom_text.dart';
import 'package:wellbe/widgets/custom_textfield.dart';

import '../../widgets/custom_loader.dart';
import 'otp_screen.dart';

class SignupScreen extends StatefulWidget {
  SignupScreen({Key? key}) : super(key: key);

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  final formKey = GlobalKey<FormState>();

  final emailController = TextEditingController();
  final nameController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();

  final codeController = TextEditingController();
  final phoneNoController = TextEditingController();
  registerUser(BuildContext context, AuthProvider authProvider) async {
    if (formKey.currentState!.validate()) {
      authProvider.registerUser(
          nameController.text.toString().trim(),
          emailController.text.toString().trim(),
          passwordController.text.toString().trim(),
          confirmPasswordController.text.toString().trim(),
          codeController.text.toString().trim(),
          'customer',
          phoneNoController.text.toString().trim(),
          (bool isLogin, String message) async {
        if (isLogin) {
          Helper.toRemoveUntiScreen(
              context,
              OTPScreen(
                phoneNo: phoneNoController.text,
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
          body: SingleChildScrollView(
            child: Form(
              key: formKey,
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
                    title: "Register",
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
                    title: "Create your WellBe account?",
                    fontSize: 14,
                    color: greyColor,
                    //  fontWeight: FontWeight.w700,
                    textAlign: TextAlign.center,
                  ),
                  //Space
                  SizedBox(
                    height: 50,
                  ),
                  //Name
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 18),
                    child: CustomTextField(
                        controller: nameController,
                        keyboardType: TextInputType.name,
                        autofillHints: [AutofillHints.name],
                        textInputAction: TextInputAction.next,
                        isOutlineInputBorder: true,
                        isOutlineInputBorderColor: greyColor,
                        onChanged: (_) {},
                        validation: firstNameField,
                        hintText: "Name",
                        hintFontSize: 13,
                        fieldborderRadius: 7,
                        outlineBottomLeftRadius: 6,
                        outlineTopRightRadius: 6,
                        outlineTopLeftRadius: 6,
                        outlineBottomRightRadius: 6,
                        // onEditingComplete: () => TextInput.finishAutofillContext(),
                        textFieldFillColor: whiteColor,
                        prefixIcon: Image.asset(
                          "assets/icons/name.png",
                          scale: 1.5,
                        )),
                  ),
                  SizedBox(
                    height: 12,
                  ),
                  //Email Address
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 18),
                    child: CustomTextField(
                        controller: codeController,
                        keyboardType: TextInputType.number,
                        textInputAction: TextInputAction.next,
                        isOutlineInputBorder: true,
                        isOutlineInputBorderColor: greyColor,
                        onChanged: (_) {},
                        // validation: validation,
                        hintText: "Code",
                        hintFontSize: 13,
                        fieldborderRadius: 7,
                        outlineBottomLeftRadius: 6,
                        outlineTopRightRadius: 6,
                        outlineTopLeftRadius: 6,
                        inputFormatter: 6,
                        outlineBottomRightRadius: 6,
                        // onEditingComplete: () => TextInput.finishAutofillContext(),
                        textFieldFillColor: whiteColor,
                        prefixIcon: Icon(Icons.pin_outlined)),
                  ),
                  //Space
                  SizedBox(
                    height: 12,
                  ),
                  //Email Address
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 18),
                    child: CustomTextField(
                        controller: emailController,
                        keyboardType: TextInputType.emailAddress,
                        autofillHints: [AutofillHints.email],
                        textInputAction: TextInputAction.next,
                        isOutlineInputBorder: true,
                        isOutlineInputBorderColor: greyColor,
                        onChanged: (_) {},
                        validation: emailField,
                        hintText: "Email Address",
                        hintFontSize: 13,
                        fieldborderRadius: 7,
                        outlineBottomLeftRadius: 6,
                        outlineTopRightRadius: 6,
                        outlineTopLeftRadius: 6,
                        outlineBottomRightRadius: 6,
                        // onEditingComplete: () => TextInput.finishAutofillContext(),
                        textFieldFillColor: whiteColor,
                        prefixIcon: Image.asset(
                          "assets/icons/email.png",
                          scale: 1.5,
                        )),
                  ),
                  //Space
                  SizedBox(
                    height: 12,
                  ),
                  //Phone Number
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 18),
                    child: CustomTextField(
                        controller: phoneNoController,
                        keyboardType: TextInputType.phone,
                        autofillHints: [AutofillHints.telephoneNumber],
                        textInputAction: TextInputAction.next,
                        isOutlineInputBorder: true,
                        isOutlineInputBorderColor: greyColor,
                        onChanged: (_) {},
                        validation: phoneField,
                        hintText: "Phone Number",
                        hintFontSize: 13,
                        fieldborderRadius: 7,
                        outlineBottomLeftRadius: 6,
                        outlineTopRightRadius: 6,
                        outlineTopLeftRadius: 6,
                        outlineBottomRightRadius: 6,
                        textFieldFillColor: whiteColor,
                        prefixIcon: Image.asset(
                          "assets/icons/phone.png",
                          scale: 1.5,
                        )),
                  ),
                  SizedBox(
                    height: 12,
                  ),
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 18),
                    child: CustomTextField(
                        controller: confirmPasswordController,
                        keyboardType: TextInputType.visiblePassword,
                        autofillHints: [AutofillHints.password],
                        textInputAction: TextInputAction.done,
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
                        textFieldFillColor: whiteColor,
                        prefixIcon: Image.asset(
                          "assets/icons/password.png",
                          scale: 1.5,
                        )),
                  ),
                  //Space
                  SizedBox(
                    height: 12,
                  ),
                  //Create Password
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 18),
                    child: CustomTextField(
                        controller: passwordController,
                        keyboardType: TextInputType.visiblePassword,
                        autofillHints: [AutofillHints.password],
                        textInputAction: TextInputAction.done,
                        isOutlineInputBorder: true,
                        isOutlineInputBorderColor: greyColor,
                        onChanged: (_) {},
                        validation: validateRepeatPassword,
                        hintText: "Confirm Password",
                        hintFontSize: 13,
                        fieldborderRadius: 7,
                        outlineBottomLeftRadius: 6,
                        outlineTopRightRadius: 6,
                        outlineTopLeftRadius: 6,
                        outlineBottomRightRadius: 6,
                        textFieldFillColor: whiteColor,
                        prefixIcon: Image.asset(
                          "assets/icons/password.png",
                          scale: 1.5,
                        )),
                  ),
                  //Space
                  SizedBox(
                    height: 30,
                  ),
                  //
                  Stack(
                    alignment: Alignment.center,
                    children: [
                      Container(
                        padding: EdgeInsets.symmetric(horizontal: 18),
                        // alignment: Alignment.bottomCenter,
                        child: CustomButton(
                          onPressed: () async {
                            Provider.of<AuthProvider>(context, listen: false)
                                .onSignUpPageChange(true);
                            if (!authProvider.isLoading)
                              registerUser(context, authProvider);
                          },
                          btnHeight: 48,
                          btnWidth: double.infinity,
                          btnRadius: 26,
                          title: 'Generate OTP',
                          fontWeight: FontWeight.w600,
                          btnColor: darkBlueColor,
                          textColor: whiteColor,
                          fontSize: 17,
                        ),
                      ),
                      // if (authProvider.isLoading)
                      //   Positioned(child: CustomLoader())
                    ],
                  ),
                  //Space
                  SizedBox(
                    height: 7,
                  ),
                  //Don't have an account? Sign up
                  Container(
                    alignment: Alignment.center,
                    padding: EdgeInsets.symmetric(horizontal: 10),
                    child: CustomInkWell(
                      onTap: () {},
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: CustomText(
                          title: "By entering the above details, you are\n"
                              "agreeing to our terms of use and privacy policy.",
                          fontSize: 12,
                          color: greyColor,
                          textAlign: TextAlign.center,
                          //  fontWeight: FontWeight.w700,
                        ),
                      ),
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
