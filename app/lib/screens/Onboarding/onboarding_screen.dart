import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:wellbe/widgets/custom_parent_widget.dart';

import 'slider_view.dart';
class OnboardingScreen extends StatefulWidget {
   OnboardingScreen({Key? key}) : super(key: key);

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
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
          body: SliderView(),
        ),
      ),
    );
  }
}
