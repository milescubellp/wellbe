import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:wellbe/screens/AuthScreens/forgot_password.dart';
import 'package:wellbe/screens/homepage/HomeScreens/homepage_screen.dart';
import 'package:wellbe/utilites/colors.dart';
import 'package:wellbe/utilites/helper.dart';
import 'package:wellbe/utilites/validator.dart';
import 'package:wellbe/widgets/custom_button.dart';
import 'package:wellbe/widgets/custom_inkwell_btn.dart';
import 'package:wellbe/widgets/custom_loader.dart';
import 'package:wellbe/widgets/custom_parent_widget.dart';
import 'package:wellbe/widgets/custom_text.dart';
import 'package:wellbe/widgets/custom_textfield.dart';

import '../../provider/auth_provider.dart';
import 'signup_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final formKey = GlobalKey<FormState>();

  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  login(BuildContext context, AuthProvider authProvider) async {
    if (formKey.currentState!.validate()) {
      authProvider
          .login(emailController.text.trim(), passwordController.text.trim(),
              (bool isLogin, String message) async {
        if (isLogin) {
          Helper.showSnack(context, message);
          Helper.toRemoveUntiScreen(context, HomePageScreen());
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
                          title: "Login to your account",
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
                          title: "Welcome Back to WellBe",
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
                            controller: emailController,
                            keyboardType: TextInputType.emailAddress,
                            autofillHints: [AutofillHints.email],
                            textInputAction: TextInputAction.next,
                            isOutlineInputBorder: true,
                            isOutlineInputBorderColor: greyColor,
                            onChanged: (_) {},
                            validation: firstNameField,
                            hintText: "youremail@gmail.com",
                            hintFontSize: 13,
                            fieldborderRadius: 7,
                            outlineBottomLeftRadius: 6,
                            outlineTopRightRadius: 6,
                            outlineTopLeftRadius: 6,
                            outlineBottomRightRadius: 6,

                            //onEditingComplete: () => TextInput.finishAutofillContext(),
                            textFieldFillColor: whiteColor,
                            prefixIcon: Image.asset(
                              "assets/icons/email.png",
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
                              controller: passwordController,
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
                            onTap: () {
                              Helper.toScreen(context, ForgotPassword());
                            },
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: CustomText(
                                title: "Forgot Password?",
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
                        Stack(
                          alignment: Alignment.center,
                          children: [
                            Container(
                              padding: EdgeInsets.symmetric(horizontal: 18),
                              // alignment: Alignment.bottomCenter,
                              child: CustomButton(
                                onPressed: () async {
                                  if (!authProvider.isLoading)
                                    login(context, authProvider);
                                },
                                btnHeight: 48,
                                btnWidth: double.infinity,
                                btnRadius: 26,
                                title: 'Login',
                                fontWeight: FontWeight.w600,
                                btnColor: darkBlueColor,
                                textColor: whiteColor,
                                fontSize: 17,
                              ),
                            ),
                          ],
                        ),
                        //Space
                        SizedBox(
                          height: 5,
                        ),
                        //Don't have an account? Sign up
                        Container(
                          alignment: Alignment.centerLeft,
                          padding: EdgeInsets.symmetric(horizontal: 10),
                          child: CustomInkWell(
                            onTap: () {
                              Helper.toScreen(context, SignupScreen());
                            },
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  CustomText(
                                    title: "Don't have an account? ",
                                    fontSize: 12,
                                    color: greyColor,
                                    //  fontWeight: FontWeight.w700,
                                  ),
                                  CustomText(
                                    title: "Sign up",
                                    fontSize: 12,
                                    color: blackColor,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ],
                              ),
                            ),
                          ),
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
