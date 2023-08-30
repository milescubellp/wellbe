import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:wellbe/screens/homepage/MoodSpace/saerch_screen.dart';

import '../../../provider/keyboard_visibility_provider.dart';
import '../../../provider/mindful_provider.dart';
import '../../../utilites/colors.dart';
import '../../../utilites/helper.dart';
import '../../../widgets/custom_inkwell_btn.dart';
import '../../../widgets/custom_parent_widget.dart';
import '../../../widgets/custom_text.dart';
import '../../../widgets/custom_textfield.dart';
import '../../homepage/MIndFul/breathing_tab.dart';
import '../../homepage/MIndFul/meditation_tab.dart';
import '../../homepage/MIndFul/my_activties_tab.dart';
import '../MoodSpace/LibrariesGenreTab/meditation_tab.dart';
import 'info_screen.dart';

class MindfulScreen extends StatefulWidget {
  const MindfulScreen({Key? key}) : super(key: key);

  @override
  State<MindfulScreen> createState() => _MindfulScreenState();
}

class _MindfulScreenState extends State<MindfulScreen>
    with SingleTickerProviderStateMixin {
  ScrollController _scrollController = ScrollController();
  FocusNode _focusNode = FocusNode();
  double _scrollPosition = 0.0;
  _scrollListener() {
    setState(() {
      _scrollPosition = _scrollController.positions.toList() == 0
          ? _scrollController.positions.toList()[1].pixels
          : _scrollController.positions.toList()[0].pixels;
      if (_scrollPosition > 230) {
        //  _textColor = Theme.of(context).textTheme.headline1!.color!;
      } else {
        //_textColor = Theme.of(context).textTheme.headline2!.color!;
      }
    });
  }

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_scrollListener);
    Provider.of<MoodSpaceProvider>(context, listen: false)
        .tabFuncation(this, 3);
    final keyboardVisibilityProvider =
        Provider.of<KeyboardVisibilityProvider>(context, listen: false);
    _focusNode.addListener(() {
      keyboardVisibilityProvider.setKeyboardVisibility(_focusNode.hasFocus);
    });
  }

  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return CustomInkWell(
      onTap: () {
        Focus.of(context).unfocus();
      },
      child: CustomParentWidget(
        child: Consumer<MoodSpaceProvider>(
            builder: (context, mindfulProvider, child) {
          return Stack(
            children: [
              Scaffold(
                body: customWidget(mindfulProvider),
              ),
              Container(
                padding:
                    EdgeInsets.only(left: 18, right: 18, bottom: 0, top: 80),
                margin: EdgeInsets.only(bottom: 1),
                decoration: BoxDecoration(
                    color:
                        _scrollPosition > 340 ? whiteColor : Colors.transparent,
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

                      // isScrollable: true,
                      indicatorColor: Colors.white,
                      labelStyle: TextStyle(fontWeight: FontWeight.bold),
                      unselectedLabelStyle: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                      ),
                      indicator: UnderlineTabIndicator(
                          borderRadius: BorderRadius.circular(20),
                          borderSide: BorderSide(
                            width: 3,
                            color:
                                _scrollPosition > 340 ? blackColor : whiteColor,
                          )),
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
                            color: _scrollPosition > 340
                                ? blackColor
                                : whiteColor),
                        CustomText(
                            title: "Meditation",
                            color: _scrollPosition > 340
                                ? blackColor
                                : whiteColor),
                        CustomText(
                            title: "Breathing",
                            color: _scrollPosition > 340
                                ? blackColor
                                : whiteColor),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          );
        }),
      ),
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
            MyActivities(),
            // Meditation(),
            Meditation(),

            Breathing(),
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
                        Row(
                          children: [
                            CustomText(
                              title: 'My Activities',
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 19,
                              textAlign: TextAlign.center,
                            ),
                            const SizedBox(
                              width: 6,
                            ),
                            CustomInkWell(
                              onTap: () {
                                Helper.toScreen(context, InfoScreen());
                              },
                              child: Icon(
                                Icons.info_outline,
                                color: Colors.white,
                              ),
                            ),
                          ],
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
                        Row(
                          children: [
                            CustomText(
                              title: 'Welcome to \n WellBe Meditation,\n',
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 19,
                              textAlign: TextAlign.center,
                            ),
                            const SizedBox(
                              width: 6,
                            ),
                            CustomInkWell(
                              onTap: () {
                                Helper.toScreen(context, InfoScreen());
                              },
                              child: Icon(
                                Icons.info_outline,
                                color: Colors.white,
                              ),
                            ),
                          ],
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

                                      onTap: () {
                                        Helper.toScreen(
                                            context,
                                            SearchScreen(
                                              screenName: 'meditation',
                                            ));
                                      },
                                      keyboardType: TextInputType.text,
                                      //textInputAction: TextInputAction.done,
                                      isOutlineInputBorder: true,
                                      isOutlineInputBorderColor: greyColor,
                                      onChanged: (_) {},
                                      hintText: "Search",
                                      readOnly: true,
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
                        Row(
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
                              width: 6,
                            ),
                            CustomInkWell(
                              onTap: () {
                                Helper.toScreen(context, InfoScreen());
                              },
                              child: Icon(
                                Icons.info_outline,
                                color: Colors.white,
                              ),
                            ),
                          ],
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
              children: [],
            ),
          ]),
        ),
      ),
    );
  }
}
