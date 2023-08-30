import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

import '../../../provider/mindful_provider.dart';
import '../../../utilites/colors.dart';
import '../../../widgets/custom_inkwell_btn.dart';
import '../../../widgets/custom_parent_widget.dart';
import '../../../widgets/custom_text.dart';
import '../../../widgets/custom_textfield.dart';
import '../../homepage/MIndFul/breathing_tab.dart';
import '../../homepage/MIndFul/meditation_tab.dart';
import '../../homepage/MIndFul/my_activties_tab.dart';
import 'image_breath.dart';
import 'image_mindful_meditation_tab.dart';
import 'image_mindful_my_activity_tab.dart';

class ImageMindfulScreen extends StatefulWidget {
  const ImageMindfulScreen({Key? key}) : super(key: key);

  @override
  State<ImageMindfulScreen> createState() => _ImageMindfulScreenState();
}

class _ImageMindfulScreenState extends State<ImageMindfulScreen>
    with SingleTickerProviderStateMixin {
  ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    Provider.of<MoodSpaceProvider>(context, listen: false)
        .tabFuncation(this, 3);
  }

  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return CustomParentWidget(
      child: Consumer<MoodSpaceProvider>(
          builder: (context, mindfulProvider, child) {
        return Scaffold(
          body: customWidget(mindfulProvider),
        );
      }),
    );
  }

  Widget customWidget(MoodSpaceProvider mindfulProvider) {
    return MediaQuery.removePadding(
        context: context,
        removeBottom: true,
        removeTop: true,
        child: NestedScrollView(
          controller: _scrollController,
          physics: BouncingScrollPhysics(),
          headerSliverBuilder: (BuildContext context, bool innerBoxScrolled) {
            return <Widget>[
              createSilverAppBar1(context, mindfulProvider),
              // createSilverAppBar2(context),
            ];
          },
          body: TabBarView(controller: mindfulProvider.controller, children: [
            ImageMyActivities(),
            // Meditation(),
            ImageMindfulMeditationTab(),

            ImageBreathing(),
          ]),
        ));
  }

  SliverAppBar createSilverAppBar1(context, MoodSpaceProvider mindfulProvider) {
    return SliverAppBar(
      systemOverlayStyle: SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
      ),
      pinned: true,
      elevation: 0,
      title: CustomText(
        title: "Mindful",
        fontSize: 18,
        color: whiteColor,
        fontWeight: FontWeight.w700,
      ),
      toolbarHeight: 90 + MediaQuery.of(context).padding.top,
      expandedHeight: 450,
      automaticallyImplyLeading: false,
      actions: [
        CustomInkWell(
          onTap: () {},
          child: Image.asset(
            "assets/icons/notification.png",
            width: 75,
          ),
        ),
        //Space
        SizedBox(
          width: 8,
        ),
        Row(
          children: [
            CustomInkWell(
              onTap: () {},
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
      flexibleSpace: FlexibleSpaceBar(
        //  expandedTitleScale: 1.5,
        background: Container(
          child: Stack(children: [
            Container(
              child: Stack(alignment: Alignment.bottomCenter, children: [
                if (mindfulProvider.controller!.index == 0)
                  ClipRRect(
                    borderRadius: BorderRadius.only(
                        bottomRight: Radius.circular(30),
                        bottomLeft: Radius.circular(30)),
                    child: Image(
                      image: AssetImage(
                        'assets/images/slide_img1.png',
                      ),
                      width: double.maxFinite,
                      fit: BoxFit.cover,
                      height: MediaQuery.of(context).size.height * 0.73,
                    ),
                  ),
                if (mindfulProvider.controller!.index == 1)
                  ClipRRect(
                    borderRadius: BorderRadius.only(
                        bottomRight: Radius.circular(30),
                        bottomLeft: Radius.circular(30)),
                    child: Image(
                      image: AssetImage(
                        'assets/images/slide_img3.png',
                      ),
                      width: double.maxFinite,
                      fit: BoxFit.cover,
                      height: MediaQuery.of(context).size.height * 0.73,
                    ),
                  ),
                if (mindfulProvider.controller!.index == 2)
                  ClipRRect(
                    borderRadius: BorderRadius.only(
                        bottomRight: Radius.circular(30),
                        bottomLeft: Radius.circular(30)),
                    child: Image(
                      image: AssetImage(
                        'assets/images/slide_img2.png',
                      ),
                      width: double.maxFinite,
                      fit: BoxFit.cover,
                      height: MediaQuery.of(context).size.height * 0.73,
                    ),
                  ),
                Container(
                  width: double.maxFinite,
                  height: MediaQuery.of(context).size.height * 0.73,
                  decoration: BoxDecoration(
                    color: Color(0xFF344954).withOpacity(0.7),
                    borderRadius: BorderRadius.only(
                        bottomRight: Radius.circular(30),
                        bottomLeft: Radius.circular(30)),
                  ),
                ),
                if (mindfulProvider.controller!.index == 0)
                  Positioned(
                    bottom: 30,
                    child: Column(
                      children: [
                        CustomText(
                          title: 'My Activities',
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
                        Container(
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
                        const SizedBox(
                          height: 30,
                        ),
                      ],
                    ),
                  ),
                if (mindfulProvider.controller!.index == 1)
                  Positioned(
                    bottom: 30,
                    child: Column(
                      children: [
                        CustomText(
                          title: 'Welcome to \n WellBe Meditation,\n',
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 19,
                          textAlign: TextAlign.center,
                        ),
                        CustomText(
                          title:
                              'If you use this site regularly and would like to help\nkeep on the internet,please consider\ndonating a small sum',
                          color: Colors.white,
                          textAlign: TextAlign.center,
                          fontWeight: FontWeight.w500,
                          fontSize: 13,
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Container(
                          width: MediaQuery.of(context).size.width - 6,
                          child: Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 18.0),
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Expanded(
                                  child: SizedBox(
                                    height: 45,
                                    child: CustomTextField(
                                      //controller: emailController,
                                      keyboardType: TextInputType.text,
                                      //textInputAction: TextInputAction.done,
                                      isOutlineInputBorder: true,
                                      isOutlineInputBorderColor: greyColor,
                                      onChanged: (_) {},
                                      hintText: "Search",
                                      hintWeight: FontWeight.w700,
                                      hintTextColor: Colors.white,
                                      hintFontSize: 15,
                                      fieldborderRadius: 7,
                                      outlineBottomLeftRadius: 30,
                                      outlineTopRightRadius: 30,
                                      outlineTopLeftRadius: 30,
                                      outlineBottomRightRadius: 30,
                                      contentPaddingBottom: 0,
                                      isFilled: true,
                                      textFieldFillColor:
                                          Colors.white.withOpacity(0.2),
                                      suffixIcon: Image.asset(
                                        "assets/icons/search.png",
                                        color: Colors.white,
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
                if (mindfulProvider.controller!.index == 2)
                  Positioned(
                    bottom: 30,
                    child: Column(
                      children: [
                        CustomText(
                          title:
                              'Discover WellBe Breathing\nHarnessing the Power of Breath',
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
                              'Experience the transformation meditation power with\nWellBe.Nurture a calm mind,a happy heart,and an\nempowered self.Begin your journey to inner peace and\nemotional balance today',
                          color: Colors.white,
                          textAlign: TextAlign.center,
                          fontWeight: FontWeight.w500,
                          fontSize: 11,
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Container(
                          width: 40,
                          height: 40,
                          decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: Colors.transparent),
                          child: Icon(
                            Icons.arrow_forward,
                            color: Colors.transparent,
                          ),
                        ),
                      ],
                    ),
                  )
              ]),
            ),
            Column(
              children: [
                Container(
                  padding:
                      EdgeInsets.only(left: 18, right: 18, bottom: 0, top: 65),
                  margin: EdgeInsets.only(bottom: 1),
                  decoration: BoxDecoration(
                      border: Border(
                          bottom: BorderSide(
                              width: 1, color: greyColor.withOpacity(0.3)))),
                  child: Container(
                    child: Theme(
                      data: ThemeData(
                        highlightColor: Colors.transparent,
                        splashColor: Colors.transparent,
                      ),
                      child: TabBar(
                        controller: mindfulProvider.controller,
                        physics: NeverScrollableScrollPhysics(),
                        // isScrollable: true,
                        indicatorColor: Colors.white,
                        indicator: UnderlineTabIndicator(
                            borderRadius: BorderRadius.circular(20),
                            borderSide:
                                BorderSide(width: 3, color: Colors.white)),
                        labelPadding: EdgeInsets.only(bottom: 12, top: 8),
                        indicatorSize: TabBarIndicatorSize.label,

                        indicatorWeight: 5.0,
                        // indicatorPadding: EdgeInsets.symmetric(horizontal: 22),
                        // labelColor: wh,
                        labelColor: kPrimaryColor,
                        unselectedLabelColor: blackColor,
                        tabs: [
                          CustomText(
                            title: "My Activities",
                            fontSize: 14,
                            fontWeight: FontWeight.w600,
                            color: Colors.white,
                          ),
                          CustomText(
                            title: "Meditation",
                            fontSize: 14,
                            fontWeight: FontWeight.w600,
                            color: Colors.white,
                          ),
                          CustomText(
                            title: "Breathing",
                            fontSize: 14,
                            fontWeight: FontWeight.w600,
                            color: Colors.white,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ]),
        ),
      ),
    );
  }
}
