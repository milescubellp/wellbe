import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:wellbe/provider/homepage_provider.dart';
import 'package:wellbe/provider/mindful_provider.dart';
import 'package:wellbe/screens/homepage/MIndFul/mindful_screen.dart';
import 'package:wellbe/screens/set11/ImageMindful/image_mindful.dart';
import 'package:wellbe/utilites/helper.dart';
import 'package:wellbe/widgets/custom_parent_widget.dart';

import '../../../utilites/colors.dart';
import '../../../widgets/custom_inkwell_btn.dart';
import '../../../widgets/custom_text.dart';
import '../../../widgets/custom_textfield.dart';
import '../HomeScreens/homepage_screen.dart';

class MindfulLandingPage extends StatelessWidget {
  const MindfulLandingPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomParentWidget(
      child: Consumer2<MoodSpaceProvider, HomePageProvider>(
          builder: (context, mindfulProvider, homePageProvider, child) {
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
              leading: CustomInkWell(
                onTap: () {
                  Helper.toScreen(
                      context,
                      HomePageScreen(
                        index: 0,
                      ));
                },
                child: Icon(
                  Icons.arrow_back,
                  color: Colors.white,
                ),
              ),
              systemOverlayStyle: SystemUiOverlayStyle(
                statusBarColor: Colors.transparent,
              ),
              elevation: 0,
              backgroundColor: Colors.transparent,
              title: CustomText(
                title: "Mindful",
                fontSize: 18,
                color: whiteColor,
                fontWeight: FontWeight.w700,
              ),
              automaticallyImplyLeading: false,
            ),
            body: Stack(
              alignment: Alignment.bottomCenter,
              children: [
                ClipRRect(
                  child: Image(
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height,
                    image: AssetImage(
                      'assets/images/slide_img1.png',
                    ),
                    fit: BoxFit.cover,
                  ),
                ),
                Container(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height,
                  decoration: BoxDecoration(
                    color: Colors.black.withOpacity(0.5),
                  ),
                ),
                Positioned(
                  bottom: 70,
                  child: Column(
                    children: [
                      CustomText(
                        title: 'Discover WellBe Mindful',
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 19,
                        textAlign: TextAlign.center,
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      CustomText(
                        title:
                            'If you use this site regularly and would like to help\nkeep on the internet,please consider\ndonating a small sum',
                        color: Colors.white,
                        textAlign: TextAlign.center,
                        fontWeight: FontWeight.w500,
                        fontSize: 11,
                      ),
                      const SizedBox(
                        height: 17,
                      ),
                      CustomInkWell(
                        onTap: () async {
                          homePageProvider.changedLandingPage(true);
                          // await Future.delayed(Duration(milliseconds: 200));
                          Helper.toRemoveUntiScreen(
                              context,
                              HomePageScreen(
                                index: 2,
                              ));
                        },
                        child: Container(
                          width: 40,
                          height: 40,
                          decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: Color(0xFF44454c).withOpacity(0.7)),
                          child: Icon(
                            Icons.arrow_forward,
                            color: Colors.white,
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                    ],
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
