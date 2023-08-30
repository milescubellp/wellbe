import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wellbe/screens/Profile/profile_screen.dart';
import 'package:wellbe/utilites/helper.dart';
import 'package:wellbe/utilites/validator.dart';
import 'package:wellbe/widgets/execute_after_frame_render.dart';

import '../../provider/auth_provider.dart';
import '../../utilites/colors.dart';
import '../../widgets/custom_inkwell_btn.dart';
import '../../widgets/custom_parent_widget.dart';
import '../../widgets/custom_text.dart';

class EditYourProfile extends StatefulWidget {
  @override
  State<EditYourProfile> createState() => _EditYourProfileState();
}

class _EditYourProfileState extends State<EditYourProfile> {
  final formkey = GlobalKey<FormState>();

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
                  title: 'Updated!',
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                  color: blackColor,
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 12),
                Text(
                  'Your profile has been updated\nsuccessfully',
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
                        Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                                builder: (context) => ProfileScreen()));
                      },
                      child: CustomText(
                        title: 'Okay',
                        fontSize: 12,
                        color: Colors.white,
                      ),
                      style: ElevatedButton.styleFrom(
                        padding: EdgeInsets.symmetric(horizontal: 30),
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

  TextEditingController nameController = TextEditingController();

  TextEditingController emailController = TextEditingController();

  TextEditingController phoneNoController = TextEditingController();

  updateProfile(BuildContext context, AuthProvider authProvider) {
    if (formkey.currentState!.validate()) {
      authProvider.updateProfile(
          nameController.text, emailController.text, phoneNoController.text,
          (bool isLogin, String message) {
        if (isLogin) {
          Helper.showSnack(context, message);
          Provider.of<AuthProvider>(context, listen: false)
              .getUserDetails(context);
          Helper.toReplacementScreenSlideLeftToRight(context, ProfileScreen());
        } else {}
      }, context);
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    executeAfterFrameRender(() {
      Provider.of<AuthProvider>(context, listen: false).getUserDetails(context);
    });
    nameController.text = Provider.of<AuthProvider>(context, listen: false)
        .userModel
        .name
        .toString();
    emailController.text = Provider.of<AuthProvider>(context, listen: false)
        .userModel
        .email
        .toString();
    phoneNoController.text = Provider.of<AuthProvider>(context, listen: false)
        .userModel
        .mobile
        .toString();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return CustomParentWidget(
      child: Consumer<AuthProvider>(builder: (context, authProvider, child) {
        return Scaffold(
          extendBodyBehindAppBar: true,
          appBar: AppBar(
            automaticallyImplyLeading: false,
            centerTitle: false,
            backgroundColor: kPrimaryColor,
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
              title: "Edit your profile",
              fontSize: 18,
              color: blackColor,
              fontWeight: FontWeight.w700,
            ),
          ),
          body: Container(
              width: double.maxFinite,
              decoration: BoxDecoration(
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image: AssetImage('assets/icons/slider_bg.png'),
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 18.0),
                child: SingleChildScrollView(
                  child: Form(
                    key: formkey,
                    child: Column(
                      children: [
                        const SizedBox(
                          height: 110,
                        ),
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
                              radius: 40,
                              backgroundImage: AssetImage(
                                'assets/icons/user_03.png',
                              )),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        CustomText(
                          title: '${authProvider.userModel.name}',
                          fontWeight: FontWeight.w700,
                          fontSize: 16,
                          color: blackColor,
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            CustomText(
                              title: 'Share a little bit about yourself',
                              color: greyColor,
                              fontSize: 13,
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 50,
                        ),
                        TextFormField(
                          controller: nameController,
                          validator: firstNameField,
                          decoration: InputDecoration(
                            constraints: BoxConstraints(
                              minHeight: 25.0,
                            ),
                            border: OutlineInputBorder(
                              borderSide:
                                  BorderSide(color: greyColor, width: 2),
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide:
                                  BorderSide(color: greyColor, width: 2),
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                            hintText: 'Name',
                            prefixIcon: Image.asset(
                              'assets/icons/name.png',
                              scale: 1.1,
                            ),
                            hintStyle: TextStyle(
                                fontWeight: FontWeight.w400, color: greyColor),
                            contentPadding: EdgeInsets.symmetric(
                                horizontal: 20.0, vertical: 15),
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        TextFormField(
                          controller: emailController,
                          validator: emailField,
                          decoration: InputDecoration(
                            constraints: BoxConstraints(
                              minHeight: 25.0,
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide:
                                  BorderSide(color: greyColor, width: 2),
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                            border: OutlineInputBorder(
                              borderSide:
                                  BorderSide(color: greyColor, width: 2),
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                            hintText: 'Email Adress',
                            prefixIcon: Image.asset(
                              'assets/icons/email.png',
                              scale: 1.1,
                            ),
                            hintStyle: TextStyle(
                                fontWeight: FontWeight.w400, color: greyColor),
                            contentPadding: EdgeInsets.symmetric(
                                horizontal: 20.0, vertical: 15),
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        TextFormField(
                          controller: phoneNoController,
                          decoration: InputDecoration(
                            constraints: BoxConstraints(
                              minHeight: 25.0,
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide:
                                  BorderSide(color: greyColor, width: 2),
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                            border: OutlineInputBorder(
                              borderSide:
                                  BorderSide(color: greyColor, width: 2),
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                            hintText: 'Phone Number',
                            prefixIcon: Image.asset(
                              'assets/icons/email.png',
                              scale: 1.1,
                            ),
                            hintStyle: TextStyle(
                                fontWeight: FontWeight.w400, color: greyColor),
                            contentPadding: EdgeInsets.symmetric(
                                horizontal: 20.0, vertical: 15),
                          ),
                        ),
                        const SizedBox(
                          height: 60,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            GestureDetector(
                                onTap: () {
                                  Helper.toReplacementScreenSlideLeftToRight(
                                      context, ProfileScreen());
                                },
                                child: Container(
                                  padding: EdgeInsets.symmetric(
                                      horizontal: 33, vertical: 12),
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
                                  updateProfile(context, authProvider);
                                },
                                child: Container(
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
                          ],
                        ),
                        const SizedBox(
                          height: 40,
                        ),
                      ],
                    ),
                  ),
                ),
              )),
        );
      }),
    );
  }
}
