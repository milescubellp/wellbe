import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wellbe/provider/auth_provider.dart';
import 'package:wellbe/provider/profile_provider.dart';
import 'package:wellbe/repo/auth_repo.dart';
import 'package:wellbe/screens/AuthScreens/login_screen.dart';
import 'package:wellbe/screens/Profile/my_m_c_i_report.dart';
import 'package:wellbe/screens/Profile/my_session.dart';
import 'package:wellbe/screens/Profile/set_pin.dart';
import 'package:wellbe/screens/Profile/setting_screen.dart';
import 'package:wellbe/screens/Profile/subscription.dart';
import 'package:wellbe/screens/homepage/Consult/doctor_appointment.dart';
import 'package:wellbe/utilites/helper.dart';

import '../../utilites/colors.dart';
import '../../widgets/custom_inkwell_btn.dart';
import '../../widgets/custom_parent_widget.dart';
import '../../widgets/custom_text.dart';
import '../homepage/HomeScreens/homepage_screen.dart';
import 'edit_your_profile.dart';

class ProfileScreen extends StatefulWidget {
  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  logout(BuildContext context, AuthProvider authProvider) {
    authProvider.logout((isLogOut, String message) {
      if (isLogOut) {
        Helper.showSnack(context, message);
        Helper.toRemoveUntiScreen(context, LoginScreen());
      } else {
        Helper.showSnack(context, message);
      }
    }, context);
  }

  @override
  void initState() {
    // TODO: implement initState
    Provider.of<AuthProvider>(context, listen: false).getUserDetails(context);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return CustomParentWidget(
      child: Consumer2<ProfileProvider, AuthProvider>(
          builder: (context, profileProvider, authProvider, child) {
        return WillPopScope(
          onWillPop: () async {
            Helper.toScreen(
                context,
                HomePageScreen(
                  index: 0,
                ));
            return true;
          },
          child: Scaffold(
            extendBodyBehindAppBar: true,
            appBar: AppBar(
              automaticallyImplyLeading: false,
              centerTitle: false,
              backgroundColor: kPrimaryColor,
              leading: CustomInkWell(
                onTap: () {
                  Helper.toScreen(
                      context,
                      HomePageScreen(
                        index: 0,
                      ));
                },
                child: Image.asset(
                  'assets/icons/arrow_back_02.png',
                  scale: 1.1,
                ),
              ),
              elevation: 0,
              toolbarHeight: 65,
              title: CustomText(
                title: "Account",
                fontSize: 18,
                color: blackColor,
                fontWeight: FontWeight.w700,
              ),
            ),
            body: Stack(
              children: [
                Container(
                  width: double.maxFinite,
                  height: double.maxFinite,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      fit: BoxFit.cover,
                      image: AssetImage('assets/icons/slider_bg.png'),
                    ),
                  ),
                ),
                SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 18.0),
                    child: Column(
                      children: [
                        const SizedBox(
                          height: 120,
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
                            Container(
                              width: 12,
                              height: 12,
                              decoration: BoxDecoration(
                                  shape: BoxShape.circle, color: Colors.amber),
                            ),
                            CustomText(
                              title: ' Type : ${authProvider.userModel.role}',
                              color: greyColor,
                              fontSize: 13,
                            ),
                            const SizedBox(
                              width: 5,
                            ),
                            Container(
                              width: 12,
                              height: 12,
                              decoration: BoxDecoration(
                                  shape: BoxShape.circle, color: kPrimaryColor),
                            ),
                            CustomText(
                              title: ' Jan : 14 Jan 2022',
                              color: greyColor,
                              fontSize: 13,
                            )
                          ],
                        ),
                        const SizedBox(
                          height: 50,
                        ),
                        Divider(
                          height: 1,
                          thickness: 1,
                          color: kPrimaryColor,
                        ),
                        CustomInkWell(
                          onTap: () {
                            Helper.toScreen(context, EditYourProfile());
                          },
                          child: Padding(
                            padding: const EdgeInsets.symmetric(vertical: 8.0),
                            child: Row(
                              children: [
                                Image.asset('assets/icons/name.png'),
                                const SizedBox(
                                  width: 10,
                                ),
                                CustomText(
                                  title: 'Edit Profile',
                                  fontWeight: FontWeight.w500,
                                  color: textGreyColor2,
                                ),
                                Spacer(),
                                Image.asset(
                                  'assets/icons/ic_arrow_f.png',
                                  color: Colors.black,
                                  width: 13,
                                ),
                              ],
                            ),
                          ),
                        ),
                        Divider(
                          height: 1,
                          thickness: 1,
                          color: kPrimaryColor,
                        ),
                        CustomInkWell(
                          onTap: () {
                            profileProvider.onProfilePageChanged(true);
                            Helper.toScreen(context, DoctorAppointment());
                          },
                          child: Padding(
                            padding: const EdgeInsets.symmetric(vertical: 8.0),
                            child: Row(
                              children: [
                                Image.asset('assets/icons/appointments.png'),
                                const SizedBox(
                                  width: 10,
                                ),
                                CustomText(
                                  title: 'My Appointments',
                                  fontWeight: FontWeight.w500,
                                  color: textGreyColor2,
                                ),
                                Spacer(),
                                Image.asset(
                                  'assets/icons/ic_arrow_f.png',
                                  color: Colors.black,
                                  width: 13,
                                ),
                              ],
                            ),
                          ),
                        ),
                        Divider(
                          height: 1,
                          thickness: 1,
                          color: kPrimaryColor,
                        ),
                        CustomInkWell(
                          onTap: () {
                            Helper.toScreen(context, MySession());
                          },
                          child: Padding(
                            padding: const EdgeInsets.symmetric(vertical: 8.0),
                            child: Row(
                              children: [
                                Image.asset('assets/icons/appointments.png'),
                                const SizedBox(
                                  width: 10,
                                ),
                                CustomText(
                                  title: 'My Sessions',
                                  fontWeight: FontWeight.w500,
                                  color: textGreyColor2,
                                ),
                                Spacer(),
                                Image.asset(
                                  'assets/icons/ic_arrow_f.png',
                                  color: Colors.black,
                                  width: 13,
                                ),
                              ],
                            ),
                          ),
                        ),
                        Divider(
                          height: 1,
                          thickness: 1,
                          color: kPrimaryColor,
                        ),
                        CustomInkWell(
                          onTap: () {
                            Helper.toScreen(context, MyMCIReport());
                          },
                          child: Padding(
                            padding: const EdgeInsets.symmetric(vertical: 8.0),
                            child: Row(
                              children: [
                                Image.asset('assets/icons/MCI_report.png'),
                                const SizedBox(
                                  width: 10,
                                ),
                                CustomText(
                                  title: 'My MCI Report',
                                  fontWeight: FontWeight.w500,
                                  color: textGreyColor2,
                                ),
                                Spacer(),
                                Image.asset(
                                  'assets/icons/ic_arrow_f.png',
                                  color: Colors.black,
                                  width: 13,
                                ),
                              ],
                            ),
                          ),
                        ),
                        Divider(
                          height: 1,
                          thickness: 1,
                          color: kPrimaryColor,
                        ),
                        // CustomInkWell(
                        //   onTap: () {
                        //     Helper.toScreen(context, SettingScreen());
                        //   },
                        //   child: Padding(
                        //     padding: const EdgeInsets.symmetric(vertical: 8.0),
                        //     child: Row(
                        //       children: [
                        //         Image.asset('assets/icons/settings.png'),
                        //         const SizedBox(
                        //           width: 10,
                        //         ),
                        //         CustomText(
                        //           title: 'Settings',
                        //           fontWeight: FontWeight.w500,
                        //           color: textGreyColor2,
                        //         ),
                        //         Spacer(),
                        //         Image.asset(
                        //           'assets/icons/ic_arrow_f.png',
                        //           color: Colors.black,
                        //           width: 13,
                        //         ),
                        //       ],
                        //     ),
                        //   ),
                        // ),
                        ListTileTheme(
                          minVerticalPadding: 0,
                          dense: true,
                          horizontalTitleGap: -4,
                          child: ExpansionTile(
                            tilePadding: EdgeInsets.zero,
                            clipBehavior: Clip.hardEdge,
                            leading: Image.asset('assets/icons/settings.png'),
                            trailing: Image.asset(
                              'assets/icons/ic_arrow_f.png',
                              color: Colors.black,
                              width: 13,
                            ),
                            expandedAlignment: Alignment.centerLeft,
                            title: CustomText(
                              title: 'Settings',
                              fontWeight: FontWeight.w500,
                              color: textGreyColor2,
                            ),
                            children: [
                              ListTile(
                                visualDensity: VisualDensity(vertical: -4),
                                onTap: () {
                                  Helper.toScreen(context, SettingScreen());
                                },
                                leading: Image.asset(
                                  'assets/icons/settings.png',
                                  color: Colors.white,
                                ),
                                title: CustomText(
                                  title: 'Change Password',
                                  fontWeight: FontWeight.w500,
                                  color: textGreyColor2,
                                  fontSize: 12,
                                ),
                                minVerticalPadding: 0,
                                contentPadding: EdgeInsets.zero,
                              ),
                              ListTile(
                                visualDensity: VisualDensity(vertical: -4),
                                onTap: () {
                                  Helper.toScreen(context, SetPin());
                                },
                                leading: Image.asset(
                                  'assets/icons/settings.png',
                                  color: Colors.white,
                                ),
                                title: CustomText(
                                  title: 'Set Pin',
                                  fontWeight: FontWeight.w500,
                                  color: textGreyColor2,
                                  fontSize: 12,
                                ),
                                minVerticalPadding: 0,
                                contentPadding: EdgeInsets.zero,
                              )
                            ],
                          ),
                        ),
                        Divider(
                          height: 1,
                          thickness: 1,
                          color: kPrimaryColor,
                        ),
                        CustomInkWell(
                          onTap: () {
                            Helper.toScreen(context, Subscription());
                          },
                          child: Padding(
                            padding: const EdgeInsets.symmetric(vertical: 8.0),
                            child: Row(
                              children: [
                                Image.asset('assets/icons/subscription.png'),
                                const SizedBox(
                                  width: 10,
                                ),
                                CustomText(
                                  title: 'My Subscription',
                                  fontWeight: FontWeight.w500,
                                  color: textGreyColor2,
                                ),
                                Spacer(),
                                Image.asset(
                                  'assets/icons/ic_arrow_f.png',
                                  color: Colors.black,
                                  width: 13,
                                ),
                              ],
                            ),
                          ),
                        ),
                        Divider(
                          height: 1,
                          thickness: 1,
                          color: kPrimaryColor,
                        ),
                        const SizedBox(
                          height: 30,
                        ),
                        GestureDetector(
                            onTap: () {
                              // logout(context, authProvider);
                              Provider.of<AuthProvider>(context, listen: false)
                                  .clear();
                              Helper.toRemoveUntiScreen(context, LoginScreen());
                            },
                            child: Container(
                              padding: EdgeInsets.symmetric(
                                  horizontal: 33, vertical: 12),
                              child: Text(
                                'Log Out',
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
