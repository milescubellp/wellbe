import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wellbe/models/CustomModels/custom_model.dart';
import 'package:wellbe/provider/mindful_provider.dart';
import 'package:wellbe/screens/homepage/MoodSpace/saerch_screen.dart';

import 'package:wellbe/utilites/colors.dart';
import 'package:wellbe/utilites/helper.dart';
import 'package:wellbe/widgets/custom_inkwell_btn.dart';
import 'package:wellbe/widgets/custom_text.dart';
import 'package:wellbe/widgets/custom_textfield.dart';

import 'LibrariesGenreTab/art_tab.dart';
import 'LibrariesGenreTab/meditation_tab.dart';
import 'LibrariesGenreTab/music_tab.dart';
import 'LibrariesGenreTab/video_tab.dart';
import 'LibrariesGenreTab/yoga_tab.dart';

import 'all_recommended.dart';

class LibrariesTab extends StatelessWidget {
  LibrariesTab({Key? key}) : super(key: key);
  int selectedIndex = 1;

  String getButtonTitle(int index) {
    switch (index) {
      case 0:
        return 'Art';
      case 1:
        return 'Meditation';
      case 2:
        return 'Music';
      case 3:
        return 'Yoga';
      case 4:
        return 'Video';
      default:
        return '';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<MoodSpaceProvider>(
        builder: (context, mindfulProvider, child) {
      return Scaffold(
        body: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                height: 50,
                padding: EdgeInsets.symmetric(horizontal: 18),
                alignment: Alignment.centerLeft,
                child: CustomText(
                  title: "We provide best Practices",
                  fontSize: 15,
                  color: blackColor,
                ),
              ),
              //Space
              SizedBox(
                height: 8,
              ),
              //
              Container(
                  padding: EdgeInsets.symmetric(horizontal: 18),
                  child: CustomTextField(
                    keyboardType: TextInputType.text,

                    //textInputAction: TextInputAction.done,
                    isOutlineInputBorder: true,
                    isOutlineInputBorderColor: greyColor,
                    onTap: () {
                      Helper.toScreen(
                          context,
                          SearchScreen(
                            screenName: 'library',
                          ));
                    },
                    onChanged: (_) {},
                    readOnly: true,
                    hintText: "Search",
                    hintFontSize: 13,
                    fieldborderRadius: 7,
                    outlineBottomLeftRadius: 6,
                    outlineTopRightRadius: 6,
                    outlineTopLeftRadius: 6,
                    outlineBottomRightRadius: 6,
                    textFieldFillColor: whiteColor,
                    suffixIcon: Image.asset("assets/icons/search.png"),
                  )),
              //Space
              SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 18.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    CustomText(
                      title: "Your recommendation",
                      fontSize: 16,
                      color: blackColor,
                      fontWeight: FontWeight.w600,
                    ),
                    // GestureDetector(
                    //   onTap: () {
                    //     // Add your action here
                    //     Helper.toScreen(context, AllRecommended());
                    //   },
                    //   child: Row(
                    //     children: [
                    //       CustomText(
                    //         title: 'View All',
                    //         fontSize: 15,
                    //         color: blueColor,
                    //         fontWeight: FontWeight.w600,
                    //       ),
                    //       const SizedBox(
                    //         width: 2,
                    //       ),
                    //       Icon(
                    //         Icons.arrow_forward_ios,
                    //         color: blueColor,
                    //         size: 14,
                    //       ),
                    //     ],
                    //   ),
                    // ),
                  ],
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Container(
                height: 140,
                child: ListView.builder(
                  padding: const EdgeInsets.only(left: 18.0),

                  scrollDirection: Axis.horizontal,
                  itemCount:
                      5, // Replace with the actual number of items in your list
                  itemBuilder: (context, index) {
                    return Container(
                      width: 290,
                      margin: EdgeInsets.only(right: 10),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        color: kPrimaryColor,
                      ),
                      child: Row(
                        children: [
                          Expanded(
                            child: Container(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Row(
                                    children: [
                                      VShapeContainer(
                                        child: Container(
                                          alignment: Alignment.center,
                                          width: 45,
                                          height: 18,
                                          child: CustomText(
                                            title: 'ART',
                                            fontWeight: FontWeight.w600,
                                            color: Colors.white,
                                            fontSize: 11,
                                          ),
                                        ),
                                        width: 70,
                                        height: 20,
                                        color: blueColor,
                                      )
                                    ],
                                  ),
                                  const SizedBox(
                                    height: 8,
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(left: 26.0),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        CustomText(
                                          title:
                                              'Quick meditaion-\nMeditate with me',
                                          fontSize: 13,
                                          color: blackColor,
                                          fontWeight: FontWeight.bold,
                                        ),
                                        SizedBox(height: 5),
                                        Text(
                                          'By Benjamin\nEpisode 03',
                                          style: TextStyle(
                                              fontSize: 12,
                                              color: textGreyColor2,
                                              fontWeight: FontWeight.bold),
                                        ),
                                        SizedBox(height: 8),
                                        Text(
                                          '5 min',
                                          style: TextStyle(
                                            fontSize: 12,
                                            fontWeight: FontWeight.w500,
                                            color: darkGreyColor,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.fromLTRB(16, 12, 8, 10),
                            child: Stack(
                              alignment: Alignment.center,
                              children: [
                                Container(
                                  width: 105,
                                  height: 130,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(8),
                                    image: DecorationImage(
                                      image: AssetImage(
                                        'assets/icons/image_01.png', // Replace with your image URL
                                      ),
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                  clipBehavior: Clip.hardEdge,
                                ),
                                Icon(
                                  Icons.play_arrow_rounded,
                                  color: Colors.white,
                                  size: 55,
                                )
                              ],
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 18.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        CustomText(
                          title: "Weeks's Podcasts",
                          fontSize: 16,
                          color: blackColor,
                          fontWeight: FontWeight.w600,
                        ),
                        const SizedBox(
                          height: 1.5,
                        ),
                        CustomText(
                          title: "Listen to the favourite Podcast",
                          fontSize: 12,
                          color: textGreyColor2,
                          fontWeight: FontWeight.w600,
                        ),
                      ],
                    ),
                    // GestureDetector(
                    //   onTap: () {
                    //     // Add your action here
                    //   },
                    //   child: Row(
                    //     children: [
                    //       CustomText(
                    //         title: 'View All',
                    //         fontSize: 15,
                    //         color: blueColor,
                    //         fontWeight: FontWeight.w600,
                    //       ),
                    //       const SizedBox(
                    //         width: 2,
                    //       ),
                    //       Icon(
                    //         Icons.arrow_forward_ios,
                    //         color: blueColor,
                    //         size: 14,
                    //       ),
                    //     ],
                    //   ),
                    // ),
                  ],
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              Container(
                height: 30,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  padding: EdgeInsets.only(left: 18),
                  itemCount: 5,
                  itemBuilder: (context, index) {
                    return Container(
                      margin: EdgeInsets.only(right: 8),
                      child: CustomInkWell(
                        onTap: () {
                          mindfulProvider.onEmotionalGenreChange(index);
                        },
                        child: Container(
                          width: 75,
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                            border: Border.all(
                              color: Colors.grey,
                              width: 1,
                            ),
                            borderRadius: BorderRadius.circular(4),
                            color: mindfulProvider.selectGenre == index
                                ? kPrimaryColor
                                : Colors.transparent,
                          ),
                          child: Text(
                            getButtonTitle(index),
                            style: TextStyle(
                              fontSize: 12,
                              color: textGreyColor2,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
              const SizedBox(
                height: 25,
              ),
              mindfulProvider.selectGenre == 0
                  ? ArtTab()
                  : mindfulProvider.selectGenre == 1
                      ? MeditationTab()
                      : mindfulProvider.selectGenre == 2
                          ? MusicTab()
                          : mindfulProvider.selectGenre == 3
                              ? YogaTab()
                              : VideoTab(),
            ],
          ),
        ),
      );
    });
  }
}

class VShapeContainer extends StatelessWidget {
  final double width;
  final double height;
  final Color color;
  final Widget child;

  VShapeContainer(
      {required this.width,
      required this.height,
      required this.color,
      required this.child});

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      size: Size(width, height),
      painter: VShapePainter(color: color),
      child: child,
    );
  }
}

class VShapePainter extends CustomPainter {
  final Color color;

  VShapePainter({required this.color});

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = color
      ..style = PaintingStyle.fill;

    final rect = Rect.fromLTRB(0, 0, size.width * 0.8, size.height);
    final path = Path()
      ..addRect(rect)
      ..moveTo(size.width * 0.8, size.height)
      ..lineTo(size.width, size.height / 2)
      ..lineTo(size.width * 0.8, 0)
      ..lineTo(size.width * 0.8, size.height)
      ..close();

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}
