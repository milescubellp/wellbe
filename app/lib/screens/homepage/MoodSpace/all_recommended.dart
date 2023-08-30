import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wellbe/provider/mindful_provider.dart';

import 'package:wellbe/widgets/custom_parent_widget.dart';

import '../../../utilites/colors.dart';
import '../../../widgets/custom_inkwell_btn.dart';
import '../../../widgets/custom_text.dart';
import 'LibrariesGenreTab/all_genre_tab.dart';
import 'LibrariesGenreTab/art_tab.dart';
import 'LibrariesGenreTab/meditation_tab.dart';
import 'LibrariesGenreTab/music_tab.dart';
import 'LibrariesGenreTab/video_tab.dart';
import 'LibrariesGenreTab/yoga_tab.dart';

class AllRecommended extends StatelessWidget {
  String getButtonTitle(int index) {
    switch (index) {
      case 0:
        return 'All';
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
    return CustomParentWidget(
      child: Consumer<MoodSpaceProvider>(
          builder: (context, mindfulProvider, child) {
        return Scaffold(
          appBar: AppBar(
            elevation: 0,
            centerTitle: false,
            leading: CustomInkWell(
              onTap: () {
                Navigator.pop(context);
              },
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Image.asset(
                  "assets/icons/arrow_back_02.png",
                  scale: 1.1,
                ),
              ),
            ),
            title: CustomText(
              title: "All Recommendation",
              fontSize: 16,
              color: blackColor,
              fontWeight: FontWeight.w700,
            ),
          ),
          body: SingleChildScrollView(
            child: Column(
              children: [
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
                const SizedBox(
                  height: 15,
                ),
                Container(
                  height: 30,
                  padding: const EdgeInsets.only(left: 18.0),
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
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
                    ? Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 18.0),
                        child: AllGenreTab(),
                      )
                    : mindfulProvider.selectGenre == 1
                        ? Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 18.0),
                            child: MeditationTab(),
                          )
                        : mindfulProvider.selectGenre == 2
                            ? Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 18.0),
                                child: MusicTab(),
                              )
                            : mindfulProvider.selectGenre == 3
                                ? Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 18.0),
                                    child: YogaTab(),
                                  )
                                : Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 18.0),
                                    child: VideoTab(),
                                  )
              ],
            ),
          ),
        );
      }),
    );
  }
}
