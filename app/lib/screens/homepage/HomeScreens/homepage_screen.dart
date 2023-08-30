import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:provider/provider.dart';
import 'package:wellbe/provider/consult_provider.dart';
import 'package:wellbe/provider/homepage_provider.dart';
import 'package:wellbe/provider/mindful_provider.dart';
import 'package:wellbe/screens/homepage/MoodSpace/mood_space.dart';
import 'package:wellbe/screens/homepage/MIndFul/mindful_landing_screen.dart';
import 'package:wellbe/screens/set11/ImageMoodSpace/image_mood_space.dart';
import 'package:wellbe/utilites/colors.dart';
import 'package:wellbe/utilites/helper.dart';
import 'package:wellbe/widgets/custom_inkwell_btn.dart';
import 'package:wellbe/widgets/custom_parent_widget.dart';
import 'package:wellbe/widgets/custom_text.dart';

import '../../../provider/keyboard_visibility_provider.dart';
import '../../set11/ImageMindful/image_mindful.dart';
import '../../set11/ImageVentOut/image_vent_out.dart';
import '../Consult/consult.dart';
import '../MIndFul/mindful_screen.dart';
import '../MoodSpace/moodspace_landing_page.dart';
import 'home_screen.dart';
import 'package:persistent_bottom_nav_bar_v2/persistent-tab-view.dart';
import '../VentOut/ventout_screen.dart';

class HomePageScreen extends StatefulWidget {
  int? index;
  HomePageScreen({Key? key, this.index = 0}) : super(key: key);

  @override
  State<HomePageScreen> createState() => _HomePageScreenState();
}

class _HomePageScreenState extends State<HomePageScreen>
    with SingleTickerProviderStateMixin {
  @override
  void initState() {
    // TODO: implement initState

    Provider.of<HomePageProvider>(context, listen: false).tabFuncation(this);
    wait();
    Provider.of<HomePageProvider>(context, listen: false)
        .tabNavigate(context, widget.index!, isInitial: true);
    // Provider.of<ConsultProvider>(context, listen: false)
    //     .intializePersistentController(0);
    super.initState();
    // Provider.of<ConsultProvider>(context, listen: false)
    //     .changeIndex(widget.index ?? 0);
  }

  Future<void> wait() async {
    await Future.delayed(Duration(milliseconds: 200));
  }

  // @override
  // void dispose() {
  //   Provider.of<ConsultProvider>(context, listen: false)
  //       .persistentController!
  //       .dispose();
  //   super.dispose();
  // }

  // @override
  // void didChangeDependencies() {
  //   super.didChangeDependencies();
  //
  // }
  //CONTROLLING BACKPRESS
  bool _isBackPressed = false;
  Future<bool> _onWillPop() async {
    if (Provider.of<HomePageProvider>(context, listen: false)
            .controller!
            .index !=
        0) {
      Provider.of<HomePageProvider>(context, listen: false)
          .controller!
          .animateTo(0); // Switch to the first tab
      return false; // Prevent app from exiting
    }

    if (_isBackPressed) {
      return true; // Allow app to exit
    } else {
      _isBackPressed = true;
      // ScaffoldMessenger.of(context).showSnackBar(
      //   SnackBar(
      //     content: Text("Press back again to exit"),
      //   ),
      // );
      Fluttertoast.showToast(msg: 'Tap again to exit');
      Future.delayed(Duration(seconds: 2), () {
        _isBackPressed = false;
      });
      return false; // Prevent app from exiting
    }
  }

  final GlobalKey _scaffoldKey = GlobalKey();
  bool? isOther = false;

  @override
  Widget build(BuildContext context) {
    return CustomParentWidget(
      child: Consumer2<HomePageProvider, ConsultProvider>(builder:
          (context, homePageProvider, consultProviderForTabPersisten, child) {
        // debugPrint(consultProviderForTabPersisten.persistentController!.index
        //     .toString());

        return AnnotatedRegion<SystemUiOverlayStyle>(
            value: const SystemUiOverlayStyle(
              statusBarColor: Colors.transparent, // Color for Android
              statusBarIconBrightness: Brightness.dark,
              systemNavigationBarColor: Colors.transparent,
            ),
            sized: false,
            child: Builder(
                key: _scaffoldKey,
                builder: (context) {
                  return WillPopScope(
                    onWillPop: _onWillPop,
                    child: Scaffold(
                      resizeToAvoidBottomInset: false,
                      body: TabBarView(
                        controller: homePageProvider.controller,
                        physics: NeverScrollableScrollPhysics(),
                        children: [
                          HomeScreen(),
                          homePageProvider.isMoodSpaceLandingPage
                              ? MoodSpace()
                              : MoodSpaceLandingPage(),
                          homePageProvider.isMindfulLandingPage
                              ? MindfulScreen()
                              : MindfulLandingPage(),
                          Consult(),
                          VentoutScreen(),
                        ],
                      ),
                      bottomNavigationBar:
                          // homePageProvider.isMoodSpaceLandingPage ||
                          //         homePageProvider.isMindfulLandingPage
                          //     ? null
                          //     :
                          BottomAppBar(
                              elevation: 8,
                              child: bottomWidget(homePageProvider)),
                      floatingActionButton:
                          // homePageProvider
                          //             .isMoodSpaceLandingPage ||
                          //         homePageProvider.isMindfulLandingPage
                          //     ? null
                          //     :
                          Consumer<KeyboardVisibilityProvider>(builder:
                              (context, keyboardVisibiltyProvider, child) {
                        if (keyboardVisibiltyProvider.isKeyboardVisible) {
                          return Container();
                        } else {
                          return Transform.translate(
                            offset: Offset(0, 5),
                            child: CustomInkWell(
                              onTap: () {
                                homePageProvider.isMindfulLandingPage
                                    ? homePageProvider.tabNavigate(context, 2)
                                    : Helper.toRemoveUntiScreen(
                                        context, MindfulLandingPage());
                                // pushNewScreen(context,
                                //     screen: MindfulScreen(), withNavBar: true);
                              },
                              child: Container(
                                decoration:
                                    BoxDecoration(shape: BoxShape.circle),
                                child: Card(
                                  elevation: 5,
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(100)),
                                  child: Image.asset(
                                    'assets/icons/wb_logo_01.png',
                                    width: 58,
                                    height: 58,
                                  ),
                                ),
                              ),
                            ),
                          );
                        }
                      }),
                      floatingActionButtonLocation:
                          FloatingActionButtonLocation.centerDocked,
                    ),
                  );
                }));
      }),
    );
  }

  Widget bottomWidget(HomePageProvider homePageProvider) {
    return Container(
      height: 60,
      decoration: BoxDecoration(
          // border: Border(
          //     top: BorderSide(width: 0.5, color: borderColor.withOpacity(0.5))),
          // color: whiteColor,
          ),
      padding: EdgeInsets.only(left: 5, right: 5, top: 4),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: CustomInkWell(
              onTap: () {
                homePageProvider.tabNavigate(context, 0);
              },
              child: Container(
                  // width: 40,
                  child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    "assets/icons/footer_home.png",
                    scale: 1.4,
                  ),
                  //Space
                  SizedBox(
                    height: 2,
                  ),
                  CustomText(
                    title: "Home",
                    fontSize: 10,
                    color: homePageProvider.controller!.index == 0
                        ? blackColor
                        : greyColor,
                    fontWeight: FontWeight.w700,
                  )
                ],
              )),
            ),
          ),
          Expanded(
            child: CustomInkWell(
              onTap: () {
                homePageProvider.isMoodSpaceLandingPage
                    ? homePageProvider.tabNavigate(context, 1)
                    : Helper.toRemoveUntiScreen(
                        context, MoodSpaceLandingPage());
              },
              child: Container(
                  // width: 40,
                  child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    "assets/icons/footer_mindful.png",
                    scale: 1.1,
                  ),
                  //Space
                  // SizedBox(
                  //   height: 2,
                  // ),
                  CustomText(
                    title: "MoodSpace",
                    fontSize: 10,
                    color: homePageProvider.controller!.index == 1
                        ? blackColor
                        : greyColor,
                    fontWeight: FontWeight.w700,
                  )
                ],
              )),
            ),
          ),
          Expanded(child: SizedBox()
              // CustomInkWell(
              //   onTap: (){
              //     //  homePageProvider.tabNavigate(context,1);
              //    // Helper.toScreen(context, CameraScreen());
              //   },
              //   child:
              //   Container(
              //     // width: 40,
              //       child: Image.asset(
              //         homePageProvider.controller!.index==0?
              //         "assets/icons/ic_add_2.png":
              //         "assets/icons/ic_add_1.png"
              //         ,
              //         scale: 1.8,)
              //   ),
              // ),
              ),
          Expanded(
            child: CustomInkWell(
              onTap: () {
                homePageProvider.tabNavigate(context, 3);
              },
              child: Container(
                  // width: 40,
                  child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    "assets/icons/footer_consult.png",
                    scale: 1.4,
                    color: homePageProvider.controller!.index == 3
                        ? blackColor
                        : greyColor,
                  ),
                  //Space
                  SizedBox(
                    height: 2,
                  ),
                  CustomText(
                    title: "Consult",
                    fontSize: 10,
                    color: homePageProvider.controller!.index == 3
                        ? blackColor
                        : greyColor,
                    fontWeight: FontWeight.w700,
                  )
                ],
              )),
            ),
          ),
          Expanded(
            child: CustomInkWell(
              onTap: () {
                homePageProvider.tabNavigate(context, 4);
              },
              child: Container(
                  // width: 40,
                  child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    "assets/icons/footer_ventout.png",
                    scale: 1.4,
                  ),
                  //Space
                  SizedBox(
                    height: 2,
                  ),
                  CustomText(
                    title: "Ventout",
                    fontSize: 10,
                    color: homePageProvider.controller!.index == 4
                        ? blackColor
                        : greyColor,
                    fontWeight: FontWeight.w700,
                  )
                ],
              )),
            ),
          )
        ],
      ),
    );
  }
}
