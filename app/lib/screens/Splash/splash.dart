import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:uuid/uuid.dart';
import 'package:wellbe/provider/MoodProvider/mood_provider.dart';
import 'package:wellbe/provider/auth_provider.dart';
import 'package:wellbe/screens/Onboarding/onboarding_screen.dart';
import 'package:wellbe/utilites/helper.dart';
import 'package:wellbe/widgets/custom_parent_widget.dart';

import '../homepage/HomeScreens/homepage_screen.dart';

class Splash extends StatefulWidget {
  const Splash({Key? key}) : super(key: key);

  @override
  _SplashState createState() => _SplashState();
}

class _SplashState extends State<Splash> with SingleTickerProviderStateMixin {
  AnimationController? controller;
  Animation<Offset>? offset;

  bool isLoading = false;

  void init() async {
    try {
      // setState(() {
      //   isLoading = true;
      // });

      Future.delayed(const Duration(seconds: 2), () async {
        if (Provider.of<AuthProvider>(context, listen: false)
            .getUserToken()
            .isEmpty) {
          Helper.toRemoveUntiScreen(context, OnboardingScreen());
        } else {
          await Provider.of<AuthProvider>(context, listen: false)
              .getUserDetails(context);
          await Provider.of<MoodProvider>(context, listen: false)
              .getAllMoods((status) {}, context);
          Helper.toRemoveUntiScreen(context, HomePageScreen());
        }
      });
    } catch (e) {
      SharedPreferences.setMockInitialValues({});
    }
  }

  @override
  void initState() {
    super.initState();
    // controller =
    //     AnimationController(vsync: this, duration: Duration(seconds: 2));
    //
    // offset = Tween<Offset>(begin: Offset.zero, end: Offset(0.0, -1.0))
    //     .animate(controller!);
    // controller!.forward();
    // controller!.repeat(reverse: true);
    // setState(() {
    //
    // });
    init();
  }

  @override
  // void dispose() {
  //  // controller!.dispose();
  //   super.dispose();
  //
  // }
  @override
  Widget build(BuildContext context) {
    return CustomParentWidget(
      child: AnnotatedRegion<SystemUiOverlayStyle>(
          value: const SystemUiOverlayStyle(
            statusBarColor: Colors.transparent, // Color for Android
            statusBarIconBrightness: Brightness.dark,
            systemNavigationBarColor: Colors.transparent,
          ),
          sized: false,
          child: Scaffold(
              // backgroundColor: Color(0xFFfd425b),
              body: Container(
            width: double.infinity,
            height: double.infinity,
            decoration: BoxDecoration(
                image: DecorationImage(
                    fit: BoxFit.cover,
                    image: AssetImage("assets/images/splash.png"))),
          ))),
    );
  }
}
