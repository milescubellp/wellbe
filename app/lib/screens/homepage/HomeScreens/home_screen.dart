import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:persistent_bottom_nav_bar_v2/persistent-tab-view.dart';
import 'package:provider/provider.dart';
import 'package:wellbe/models/CustomModels/custom_model.dart';
import 'package:wellbe/provider/MoodProvider/mood_provider.dart';
import 'package:wellbe/provider/homepage_provider.dart';
import 'package:wellbe/provider/mindful_provider.dart';
import 'package:wellbe/screens/homepage/HomeScreens/homepage_screen.dart';
import 'package:wellbe/screens/homepage/Insight/insight_screen.dart';
import 'package:wellbe/screens/homepage/MoodSpace/mood_space.dart';
import 'package:wellbe/screens/homepage/Recomendation/recomendation_screen.dart';
import 'package:wellbe/utilites/colors.dart';
import 'package:wellbe/utilites/helper.dart';
import 'package:wellbe/widgets/custom_inkwell_btn.dart';
import 'package:wellbe/widgets/custom_text.dart';
import 'package:wellbe/widgets/execute_after_frame_render.dart';

import '../../../provider/auth_provider.dart';
import '../../../provider/insight_provider.dart';
import '../../../widgets/custom_cached_network_image.dart';
import '../../Profile/profile_screen.dart';
import '../../set11/ImageMoodSpace/image_mood_space.dart';
import '../Consult/consult.dart';
import 'mood_tracker_screen.dart';
import 'notification_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  PageController _pageController = PageController(
    initialPage: 4,
    viewportFraction: 0.2,
  );
  final ScrollController _scrollController = ScrollController();
  CarouselController buttonCarouselController = CarouselController();
  int _selectedTab = 4;
  final List<Map<String, dynamic>> dataList = [
    {
      'image': 'assets/icons/email.png',
      'title': 'Check your messages notification',
      'subtitle':
          'that there are two new notifications related to the corresponding item.',
    },
    // {
    //   'image': 'assets/icons/star_01.png',
    //   'title': 'Rate and Review your experience',
    //   'subtitle':
    //       'It indicates the average rating received, usually on a scale of 0 to 5.',
    // },
    // {
    //   'image': 'assets/icons/settings.png',
    //   'title': 'App Settings',
    //   'subtitle': 'Go to mobile app settings',
    // },
  ];
  int _currentPage = 0;
  int backPressCounter = 1;
  int backPressTotal = 2;

  Future<bool> onWillPop() {
    int tbIndex =
        Provider.of<HomePageProvider>(context, listen: false).controller!.index;
    if (tbIndex == 0) {
      if (backPressCounter < 2) {
        Fluttertoast.showToast(msg: "Tap Again To Exit ");
        backPressCounter++;
        Future.delayed(const Duration(seconds: 1, milliseconds: 500), () {
          backPressCounter--;
        });
        return Future.value(false);
      } else {
        SystemNavigator.pop();
        return Future.value(true);
      }
    } else {
      Provider.of<HomePageProvider>(context, listen: false)
          .tabNavigate(context, 0);
      return Future.value(false);
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    _scrollController.addListener(_pageListener);
    _pageController.addListener(() {});

    // Provider.of<AuthProvider>(context, listen: false).getUserDetails(context);
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    _pageController.dispose();
    //cameraController.dispose();
  }

  void _pageListener() {
    setState(() {
      _currentPage = _pageController.page!.round();
    });
  }

  void showNotificationDialog(BuildContext context) {
    Container buildTriangleContainer(double containerSize) {
      return Container(
        width: containerSize,
        height: containerSize,
        child: ClipPath(
          clipper: TriangleClipper(),
          child: Container(
            color: whiteColor, // Adjust the color as needed
          ),
        ),
      );
    }

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 13.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const SizedBox(
                height: 70,
              ),
              Stack(
                clipBehavior: Clip.none,
                children: [
                  AlertDialog(
                    insetPadding: EdgeInsets.zero,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12)),
                    title: Row(
                      children: [
                        CustomText(
                            title: 'Notifications',
                            fontWeight: FontWeight.w700,
                            fontSize: 15,
                            color: blackColor),
                        const SizedBox(
                          width: 4,
                        ),
                        Container(
                          width: 50,
                          height: 18,
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(50),
                            color: Colors.red,
                          ),
                          child: CustomText(
                            title: '03 new',
                            fontSize: 11,
                            color: Colors.white,
                          ),
                        )
                      ],
                    ),
                    content: Column(
                      children: [
                        Divider(
                          height: 1,
                          thickness: 1,
                          color: kPrimaryColor,
                        ),
                        Container(
                          // height: 190,
                          height: 50,

                          width: double.maxFinite,
                          child: ListView.separated(
                            shrinkWrap: true,
                            physics: NeverScrollableScrollPhysics(),
                            padding: EdgeInsets.zero,
                            itemCount: dataList.length,
                            separatorBuilder: (context, index) => Divider(
                              height: 1,
                              thickness: 1,
                              color: kPrimaryColor,
                            ),
                            itemBuilder: (context, index) {
                              return ListTile(
                                contentPadding: EdgeInsets.zero,
                                visualDensity: VisualDensity(vertical: -1),
                                minVerticalPadding: 0,
                                onTap: () {
                                  Helper.toScreen(context, NotificationPage());
                                },
                                leading: Container(
                                    width: 39,
                                    height: 39,
                                    decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        color: kPrimaryColor),
                                    child: Image.asset(
                                      dataList[index]['image'],
                                      width: 30,
                                    )),
                                title: CustomText(
                                  title: dataList[index]['title'],
                                  fontWeight: FontWeight.w600,
                                  fontSize: 13,
                                ),
                                subtitle: CustomText(
                                    fontWeight: FontWeight.w500,
                                    color: greyColor,
                                    fontSize: 10,
                                    title: dataList[index]['subtitle']),
                              );
                            },
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            CustomInkWell(
                              onTap: () {
                                //   Helper.toScreen(context, InsightScreen());
                              },
                              child: Row(
                                children: [
                                  CustomText(
                                    title: "View All",
                                    fontSize: 12,
                                    color: blueColor,
                                    fontWeight: FontWeight.w600,
                                  ),
                                  //Space
                                  // SizedBox(width: 4,),
                                  Icon(
                                    Icons.keyboard_arrow_right,
                                    color: blackColor,
                                  ),
                                ],
                              ),
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                  Positioned(
                    right: 65,
                    top: -10,
                    child: Transform.rotate(
                        angle: 103.63, child: buildTriangleContainer(20)),
                  )
                ],
              ),
            ],
          ),
        );
      },
    );
  }

  List images = [
    "assets/images/slide_img1.png",
    "assets/images/slide_img2.png",
    "assets/images/slide_img3.png",
    "assets/images/slide_img4.png"
  ];

  @override
  Widget build(BuildContext context) {
    return Consumer4<HomePageProvider, MoodSpaceProvider, AuthProvider,
            MoodProvider>(
        builder: (context, homePageProvider, moodSpaceProvider, authProvider,
            moodProvider, child) {
      return WillPopScope(
        onWillPop: onWillPop,
        child: Scaffold(
          appBar: AppBar(
            automaticallyImplyLeading: false,
            centerTitle: false,
            elevation: 0,
            toolbarHeight: 65,
            title: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CustomText(
                  title: "Hello, ${authProvider.userModel.name}",
                  fontSize: 18,
                  color: blackColor,
                  fontWeight: FontWeight.w700,
                ),
                //Space
                SizedBox(
                  height: 4,
                ),
                CustomText(
                  title: "A great day to change your mood.",
                  fontSize: 14,
                  color: blackColor,
                  // fontWeight: FontWeight.w700,
                ),
              ],
            ),
            actions: [
              CustomInkWell(
                onTap: () {
                  showNotificationDialog(context);
                },
                child: Image.asset("assets/icons/notification.png"),
              ),
              //Space
              SizedBox(
                width: 8,
              ),
              Row(
                children: [
                  CustomInkWell(
                    onTap: () {
                      pushNewScreen(context,
                          screen: ProfileScreen(), withNavBar: false);
                    },
                    child: Container(
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          //    color: kPrimaryColor
                        ),
                        child: Image.asset(
                          "assets/icons/profile.png",
                        )),
                  ),
                ],
              ),
              //Space
              SizedBox(
                width: 18,
              ),
            ],
          ),
          body: Container(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  //Space
                  SizedBox(
                    height: 10,
                  ),
                  Divider(
                    height: 1,
                    thickness: 1,
                    color: kPrimaryColor,
                    indent: 18,
                    endIndent: 18,
                  ),
                  //
                  //Space
                  SizedBox(
                    height: 10,
                  ),
                  Container(
                    width: double.infinity,
                    padding: EdgeInsets.only(left: 18, right: 10),
                    child: Row(
                      children: [
                        Expanded(
                            child: CustomText(
                          title: "Today",
                          fontSize: 16,
                          color: blackColor,
                          fontWeight: FontWeight.w600,
                        )),
                        CustomInkWell(
                          onTap: () {
                            // pushNewScreen(context, screen: InsightScreen());
                            Provider.of<InsightProvider>(context, listen: false)
                                .onInsightChange(true);
                            debugPrint(Provider.of<InsightProvider>(context,
                                    listen: false)
                                .isInsight
                                .toString());
                            Helper.toScreen(context, InsightScreen());
                          },
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Row(
                              children: [
                                CustomText(
                                  title: "Insight",
                                  fontSize: 15,
                                  color: blueColor,
                                  fontWeight: FontWeight.w600,
                                ),
                                //Space
                                // SizedBox(width: 4,),
                                Icon(
                                  Icons.keyboard_arrow_right,
                                  color: blackColor,
                                )
                              ],
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                  //Space
                  SizedBox(
                    height: 10,
                  ),
                  //Card
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 18),
                    child: Container(
                      width: double.infinity,
                      height: 200,
                      decoration: BoxDecoration(
                          color: kPrimaryColor,
                          borderRadius: BorderRadius.circular(10)),
                      padding:
                          EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          //Space
                          SizedBox(
                            height: 8,
                          ),
                          CustomText(
                            title: "How are you feeling today?",
                            fontSize: 15,
                            color: blackColor,
                            fontWeight: FontWeight.w700,
                          ),
                          //Space
                          SizedBox(
                            height: 3,
                          ),
                          CustomText(
                            title: "10 Jan, 2023",
                            fontSize: 11,
                            color: blackColor,
                            //fontWeight: FontWeight.w700,
                          ),
                          //Space
                          //  SizedBox(height: 5,),
                          _buildExpressionTypeSelector(
                              buttonCarouselController, moodProvider)
                        ],
                      ),
                    ),
                  ),
                  //Space
                  SizedBox(
                    height: 20,
                  ),
                  //Access
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 18),
                    child: CustomInkWell(
                      onTap: () {
                        // Helper.toScreen(context, RecommendationScreen());
                      },
                      child: Container(
                        padding:
                            EdgeInsets.symmetric(horizontal: 15, vertical: 15),
                        decoration: BoxDecoration(
                            color: greyColor.withOpacity(0.2),
                            borderRadius: BorderRadius.circular(10)),
                        child: Row(
                          children: [
                            Expanded(
                                child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                CustomText(
                                  title: "Assess your cognitive health",
                                  fontSize: 16,
                                  color: blackColor,
                                  fontWeight: FontWeight.w700,
                                ),
                                //Space
                                SizedBox(
                                  height: 4,
                                ),
                                CustomText(
                                  title: "Take the MCI Self-Assessment",
                                  fontSize: 12,
                                  color: greyColor,
                                  fontWeight: FontWeight.w700,
                                ),
                                //Space
                                SizedBox(
                                  height: 20,
                                ),
                                Row(
                                  children: [
                                    CustomText(
                                      title: "Take an Assessment",
                                      fontSize: 14,
                                      color: blueColor,
                                      fontWeight: FontWeight.w600,
                                    ),
                                    //Space
                                    SizedBox(
                                      width: 2,
                                    ),
                                    Icon(
                                      Icons.keyboard_arrow_right,
                                      color: greyColor,
                                    )
                                  ],
                                ),
                              ],
                            )),
                            Image.asset("assets/icons/assess.png")
                          ],
                        ),
                      ),
                    ),
                  ),
                  //Space
                  SizedBox(
                    height: 20,
                  ),
                  //Quick Launch
                  Container(
                    width: double.infinity,
                    margin: EdgeInsets.symmetric(horizontal: 18),
                    // padding: EdgeInsets.symmetric(horizontal: 15,vertical: 15),
                    decoration: BoxDecoration(
                        // color: greyColor.withOpacity(0.2),
                        // borderRadius: BorderRadius.circular(10)
                        ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        CustomText(
                          title: "Quick Launch",
                          fontSize: 16,
                          color: blackColor,
                          fontWeight: FontWeight.w700,
                        ),
                        //Space
                        SizedBox(
                          height: 4,
                        ),
                        CustomText(
                          title:
                              "Explore WellBe's grounding techniques for\nbetter mental health",
                          fontSize: 12,
                          color: greyColor,
                          fontWeight: FontWeight.w700,
                        ),
                      ],
                    ),
                  ),
                  //Space
                  SizedBox(
                    height: 20,
                  ),
                  //
                  Container(
                    width: double.infinity,
                    padding: EdgeInsets.symmetric(horizontal: 18),
                    child: SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          CustomInkWell(
                            onTap: () async {
                              homePageProvider.onQuickLaunchChange(0);
                              homePageProvider.tabNavigate(context, 1);
                              await Future.delayed(Duration(milliseconds: 200));
                              moodSpaceProvider.tabNavigate(context, 2);
                              // HERE WAS MOODSPACE
                              // Helper.toScreen(context, ImageMoodSpace());
                            },
                            child: Column(
                              children: [
                                Container(
                                  width: 60,
                                  height: 60,
                                  decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      border: Border.all(
                                          width: 3,
                                          color: homePageProvider
                                                      .quickLaunchSelected ==
                                                  0
                                              ? kPrimaryColor
                                              : Colors.transparent)),
                                  child: Center(
                                    child: Image.asset(
                                        "assets/icons/01_thoughts.png"),
                                  ),
                                ),
                                //Space
                                SizedBox(
                                  height: 4,
                                ),
                                CustomText(
                                  title: "Thoughts",
                                  fontSize: 12,
                                  color: greyColor,
                                )
                              ],
                            ),
                          ),
                          //Space
                          SizedBox(
                            width: 50,
                          ),
                          //
                          CustomInkWell(
                            onTap: () async {
                              homePageProvider.onQuickLaunchChange(1);
                              homePageProvider.tabNavigate(context, 1);
                              await Future.delayed(Duration(milliseconds: 200));
                              moodSpaceProvider.tabNavigate(context, 1);
                            },
                            child: Column(
                              children: [
                                Container(
                                  width: 60,
                                  height: 60,
                                  decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      border: Border.all(
                                          width: 3,
                                          color: homePageProvider
                                                      .quickLaunchSelected ==
                                                  1
                                              ? kPrimaryColor
                                              : Colors.transparent)),
                                  child: Center(
                                    child: Image.asset(
                                        "assets/icons/02_podcast.png"),
                                  ),
                                ),
                                //Space
                                SizedBox(
                                  height: 4,
                                ),
                                CustomText(
                                  title: "Podcast",
                                  fontSize: 12,
                                  color: greyColor,
                                )
                              ],
                            ),
                          ),
                          //Space
                          SizedBox(
                            width: 50,
                          ),
                          CustomInkWell(
                            onTap: () async {
                              homePageProvider.onQuickLaunchChange(2);
                              homePageProvider.tabNavigate(context, 1);
                              await Future.delayed(Duration(milliseconds: 200));
                              moodSpaceProvider.tabNavigate(context, 3);
                            },
                            child: Column(
                              children: [
                                Container(
                                  width: 60,
                                  height: 60,
                                  decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      border: Border.all(
                                          width: 3,
                                          color: homePageProvider
                                                      .quickLaunchSelected ==
                                                  2
                                              ? kPrimaryColor
                                              : Colors.transparent)),
                                  child: Center(
                                    child: Image.asset(
                                        "assets/icons/03_libraries.png"),
                                  ),
                                ),
                                //Space
                                SizedBox(
                                  height: 4,
                                ),
                                CustomText(
                                  title: "Libraries",
                                  fontSize: 12,
                                  color: greyColor,
                                )
                              ],
                            ),
                          ),
                          //Space
                          SizedBox(
                            width: 50,
                          ),
                          CustomInkWell(
                            onTap: () async {
                              homePageProvider.onQuickLaunchChange(3);
                              homePageProvider.tabNavigate(context, 1);
                              await Future.delayed(Duration(milliseconds: 200));
                              moodSpaceProvider.tabNavigate(context, 0);
                            },
                            child: Column(
                              children: [
                                Container(
                                  width: 60,
                                  height: 60,
                                  decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      border: Border.all(
                                          width: 3,
                                          color: homePageProvider
                                                      .quickLaunchSelected ==
                                                  3
                                              ? kPrimaryColor
                                              : Colors.transparent)),
                                  child: Center(
                                    child: Image.asset(
                                        "assets/icons/04_journal.png"),
                                  ),
                                ),
                                //Space
                                SizedBox(
                                  height: 4,
                                ),
                                CustomText(
                                  title: "Journal",
                                  fontSize: 12,
                                  color: greyColor,
                                )
                              ],
                            ),
                          ),
                          //Space
                          SizedBox(
                            width: 50,
                          ),
                          CustomInkWell(
                            onTap: () async {
                              homePageProvider.onQuickLaunchChange(4);
                              homePageProvider.tabNavigate(context, 2);
                              await Future.delayed(Duration(milliseconds: 200));
                              moodSpaceProvider.tabNavigate(context, 1);
                            },
                            child: Column(
                              children: [
                                Container(
                                  width: 60,
                                  height: 60,
                                  decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      border: Border.all(
                                          width: 3,
                                          color: homePageProvider
                                                      .quickLaunchSelected ==
                                                  4
                                              ? kPrimaryColor
                                              : Colors.transparent)),
                                  child: Center(
                                    child: Image.asset(
                                        "assets/icons/05_meditation.png"),
                                  ),
                                ),
                                //Space
                                SizedBox(
                                  height: 4,
                                ),
                                CustomText(
                                  title: "Meditation",
                                  fontSize: 12,
                                  color: greyColor,
                                )
                              ],
                            ),
                          ),
                          //Space
                          SizedBox(
                            width: 50,
                          ),
                          CustomInkWell(
                            onTap: () async {
                              homePageProvider.onQuickLaunchChange(5);
                              homePageProvider.tabNavigate(context, 2);
                              await Future.delayed(Duration(milliseconds: 200));
                              moodSpaceProvider.tabNavigate(context, 2);
                            },
                            child: Column(
                              children: [
                                Container(
                                  width: 60,
                                  height: 60,
                                  decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      border: Border.all(
                                          width: 3,
                                          color: homePageProvider
                                                      .quickLaunchSelected ==
                                                  5
                                              ? kPrimaryColor
                                              : Colors.transparent)),
                                  child: Center(
                                    child: Image.asset(
                                        "assets/icons/06_breathing.png"),
                                  ),
                                ),
                                //Space
                                SizedBox(
                                  height: 4,
                                ),
                                CustomText(
                                  title: "Breathing",
                                  fontSize: 12,
                                  color: greyColor,
                                )
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  //Space
                  SizedBox(
                    height: 20,
                  ),
                  //I
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 18),
                    child: CustomInkWell(
                      onTap: () {
                        homePageProvider.tabNavigate(context, 3);
                      },
                      child: Container(
                        // margin: EdgeInsets.symmetric(horizontal: 18),
                        padding:
                            EdgeInsets.symmetric(horizontal: 15, vertical: 15),
                        decoration: BoxDecoration(
                            color: greyColor.withOpacity(0.2),
                            borderRadius: BorderRadius.circular(10)),
                        child: Row(
                          children: [
                            Expanded(
                                child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                CustomText(
                                  title: "I need someone to talk to?",
                                  fontSize: 16,
                                  color: blackColor,
                                  fontWeight: FontWeight.w700,
                                ),
                                //Space
                                SizedBox(
                                  height: 4,
                                ),
                                CustomText(
                                  title: "Find the right therapist for you.",
                                  fontSize: 12,
                                  color: greyColor,
                                  fontWeight: FontWeight.w700,
                                ),
                                //Space
                                SizedBox(
                                  height: 20,
                                ),
                                Row(
                                  children: [
                                    CustomText(
                                      title: "Book an Appointment",
                                      fontSize: 14,
                                      color: blueColor,
                                      fontWeight: FontWeight.w600,
                                    ),
                                    //Space
                                    SizedBox(
                                      width: 2,
                                    ),
                                    Icon(
                                      Icons.keyboard_arrow_right,
                                      color: greyColor,
                                    )
                                  ],
                                ),
                              ],
                            )),
                            Image.asset("assets/icons/talk.png")
                          ],
                        ),
                      ),
                    ),
                  ),
                  //Space
                  SizedBox(
                    height: 80,
                  ),
                ],
              ),
            ),
          ),
        ),
      );
    });
  }

  //bottom
  Widget _buildExpressionTypeSelector(
      CarouselController carouselController, MoodProvider moodProvider) {
    // final List<String> postTypes = ["Photo","Videos"];

    return Stack(
      alignment: Alignment.center,
      children: [
        Positioned.directional(
          textDirection: Directionality.of(context),
          top: 15,
          start: 0,
          end: 0,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: 65,
                height: 65,
                decoration: BoxDecoration(
                    color: whiteColor, borderRadius: BorderRadius.circular(50)),
              ),
            ],
          ),
        ),
        //
        // Container(
        //   height: 120,
        //   child: PageView.builder(
        //       controller: _pageController,
        //       onPageChanged: (int page) {
        //         setState(() {
        //           _selectedTab = page;
        //         });
        //         debugPrint('Selected Tab:$_selectedTab');
        //       },
        //       itemBuilder: (context, index) {
        //         return Container(
        //           child: CustomInkWell(
        //             onTap: () async {
        //               _pageController!.animateToPage(index,
        //                   duration: Duration(milliseconds: 300),
        //                   curve: Curves.easeInExpo);
        //               debugPrint('Index:$index');
        //               await Future.delayed(Duration(seconds: 1));
        //               Helper.toScreen(
        //                   context,
        //                   MoodTrackerScreen(
        //                     moodType: _selectedTab == 0
        //                         ? "Disgusted"
        //                         : _selectedTab == 1
        //                             ? "Happy"
        //                             : _selectedTab == 2
        //                                 ? "Sad"
        //                                 : _selectedTab == 3
        //                                     ? "Bad"
        //                                     : _selectedTab == 4
        //                                         ? "Fear"
        //                                         : _selectedTab == 5
        //                                             ? "Anger"
        //                                             : "Surprised",
        //                   ));
        //             },
        //             child: Column(
        //               mainAxisAlignment: MainAxisAlignment.center,
        //               children: [
        //                 //Space
        //                 SizedBox(
        //                   height: _selectedTab == index ? 14 : 22,
        //                 ),
        //                 Image.asset(
        //                     "${expressionList[index % expressionList.length].icon}",
        //                     scale: _selectedTab == index ? 1.1 : 1.4),
        //                 //Space
        //                 SizedBox(height: _selectedTab == index ? 24 : 15),
        //                 CustomText(
        //                   title:
        //                       "${expressionList[index % expressionList.length].title}",
        //                   fontSize: 11.5,
        //                   color: _selectedTab == index ? blackColor : greyColor,
        //                   //   fontWeight: FontWeight.w700,
        //                 ),
        //               ],
        //             ),
        //           ),
        //         );
        //       }),
        // ),
        Container(
          height: 120,
          child: CarouselSlider.builder(
            carouselController: carouselController,
            itemCount: moodProvider.getAllMoodsModels.length,
            itemBuilder: (context, index, _) {
              return Container(
                child: CustomInkWell(
                  onTap: () async {
                    debugPrint('${_selectedTab == index}');
                    carouselController.animateToPage(
                      index,
                      duration: Duration(milliseconds: 300),
                      curve: Curves.easeInExpo,
                    );
                    debugPrint('Index: $index');
                    await Future.delayed(Duration(seconds: 1));
                    Helper.toScreen(
                      context,
                      MoodTrackerScreen(
                        getAllMoods: moodProvider.getAllMoodsModels[index],
                        moodType: _selectedTab == 0
                            ? moodProvider.getAllMoodsModels[index].name
                            : _selectedTab == 1
                                ? "Happy"
                                : _selectedTab == 2
                                    ? "Sad"
                                    : _selectedTab == 3
                                        ? "Bad"
                                        : _selectedTab == 4
                                            ? "Fear"
                                            : _selectedTab == 5
                                                ? "Anger"
                                                : "Surprised",
                      ),
                    );
                  },
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      // Space
                      SizedBox(
                        height: _selectedTab == index ? 14 : 22,
                      ),
                      Container(
                        width: _selectedTab == index ? 50 : 35,
                        height: _selectedTab == index ? 50 : 35,
                        child: CustomCachedNetworkImage(
                          width: 50,
                          height: 50,
                          url: "${moodProvider.getAllMoodsModels[index].image}",
                        ),
                      ),
                      // Image.network(
                      //   "${moodProvider.getAllMoodsModels[index % moodProvider.getAllMoodsModels.length].image}",
                      //   scale: _selectedTab == index ? 2.5 : 1.2,
                      // ),
                      // Space
                      SizedBox(height: _selectedTab == index ? 24 : 15),
                      CustomText(
                        title: "${moodProvider.getAllMoodsModels[index].name}",
                        fontSize: 11.5,
                        color: _selectedTab == index ? blackColor : greyColor,
                      ),
                      // CustomText(
                      //   title:
                      //       "${moodProvider.getAllMoodsModels[index % moodProvider.getAllMoodsModels.length].name}",
                      //   fontSize: 11.5,
                      //   color: _selectedTab == index ? blackColor : greyColor,
                      // ),
                    ],
                  ),
                ),
              );
            },
            options: CarouselOptions(
              height: 120,
              initialPage: _selectedTab,
              enableInfiniteScroll: false,
              viewportFraction: 0.24,
              onPageChanged: (int page, _) {
                setState(() {
                  _selectedTab = page;
                });
              },
            ),
          ),
        ),
      ],
    );
  }
}

//TRIANGLE CLIPPER FOR NOTIFCIATION DIALOGBOX
class TriangleClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final path = Path();
    path.lineTo(size.width, 0.0);
    path.lineTo(size.width / 2, size.height);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return false;
  }
}
