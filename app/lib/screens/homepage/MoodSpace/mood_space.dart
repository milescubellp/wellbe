import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wellbe/provider/mindful_provider.dart';
import 'package:wellbe/screens/homepage/MoodSpace/saerch_screen.dart';
import 'package:wellbe/utilites/colors.dart';
import 'package:wellbe/widgets/custom_cached_network_image.dart';
import 'package:wellbe/widgets/custom_inkwell_btn.dart';
import 'package:wellbe/widgets/custom_parent_widget.dart';
import 'package:wellbe/widgets/custom_text.dart';

import '../../../provider/ThoughtProvider/thought_provider.dart';
import '../../../provider/keyboard_visibility_provider.dart';
import '../../../utilites/helper.dart';
import '../../../widgets/custom_loader.dart';
import '../../../widgets/custom_textfield.dart';
import '../MIndFul/info_screen.dart';
import 'journal_tab.dart';
import 'libraries_tab.dart';
import 'podcast_tab.dart';
import 'thoughts_tab.dart';

class MoodSpace extends StatefulWidget {
  const MoodSpace({Key? key}) : super(key: key);

  @override
  State<MoodSpace> createState() => _MoodSpaceState();
}

class _MoodSpaceState extends State<MoodSpace>
    with SingleTickerProviderStateMixin {
  double _maxScrollOffset = 200.0;
  FocusNode _focusNode = FocusNode();
  bool _isScrollingEnabled = true;
  ScrollController _scrollController = ScrollController();
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
        .tabFuncation(this, 4);
    final keyboardVisibilityProvider =
        Provider.of<KeyboardVisibilityProvider>(context, listen: false);
    _focusNode.addListener(() {
      keyboardVisibilityProvider.setKeyboardVisibility(_focusNode.hasFocus);
    });
  }

  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return CustomParentWidget(
      child: CustomInkWell(
        onTap: () {
          FocusScope.of(context).unfocus();
        },
        child: Consumer2<MoodSpaceProvider, ThoughtProvider>(
            builder: (context, mindfulProvider, thoughtProvider, child) {
          return Stack(
            children: [
              Scaffold(
                body: customWidget(mindfulProvider),
              ),
              Container(
                padding:
                    EdgeInsets.only(left: 18, right: 18, bottom: 0, top: 80),
                decoration: BoxDecoration(
                    color:
                        _scrollPosition > 340 ? whiteColor : Colors.transparent,
                    border: Border(
                        bottom: BorderSide(
                            width: 1.5, color: Colors.grey.withOpacity(0.3)))),
                child: Container(
                  child: Theme(
                    data: ThemeData(
                      highlightColor: Colors.transparent,
                      splashColor: Colors.transparent,
                    ),
                    child: TabBar(
                      controller: mindfulProvider.controller,

                      // isScrollable: true,
                      indicatorColor: kPrimaryColor,
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
                      labelColor: darkBlueColor,
                      unselectedLabelColor: blackColor,

                      tabs: [
                        CustomText(
                          title: "Journal",
                          color:
                              _scrollPosition > 340 ? blackColor : Colors.white,
                        ),
                        CustomText(
                          title: "Podcast",
                          color:
                              _scrollPosition > 340 ? blackColor : whiteColor,
                        ),
                        CustomText(
                          title: "Thoughts",
                          color:
                              _scrollPosition > 340 ? blackColor : whiteColor,
                        ),
                        CustomText(
                          title: "Library",
                          color:
                              _scrollPosition > 340 ? blackColor : whiteColor,
                        ),
                      ],
                    ),
                  ),
                ),
              )
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
            JournalTab(),
            PodcastTab(),
            ThoughtsTab(),
            LibrariesTab()
          ]),
        ));
  }

  SliverAppBar createSilverAppBar1(
    context,
    MoodSpaceProvider mindfulProvider,
  ) {
    return SliverAppBar(
      automaticallyImplyLeading: false,
      centerTitle: false,
      elevation: 0,
      pinned: true,
      backgroundColor: Colors.transparent,
      toolbarHeight: 90 + MediaQuery.of(context).padding.top,
      expandedHeight: 450,
      title: CustomText(
        title: "Mood Space",
        fontSize: 18,
        color: _scrollPosition > 340 ? blackColor : whiteColor,
        fontWeight: FontWeight.w700,
      ),
      flexibleSpace: FlexibleSpaceBar(
          background: Stack(
        children: [
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
                      'assets/images/slide_img1.png',
                    ),
                    width: double.maxFinite,
                    fit: BoxFit.cover,
                    height: MediaQuery.of(context).size.height * 0.73,
                  ),
                ),
              if (mindfulProvider.controller!.index == 3)
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
                            title: 'Journal',
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
                            title: 'We provide best podcasts',
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
                            'On the other hand,we denounce with righteous\nindignation and dislike men beguiled the foresee\nthepain and trouble',
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
                          padding: const EdgeInsets.symmetric(horizontal: 18.0),
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Expanded(
                                child: SizedBox(
                                  height: 45,
                                  child: CustomTextField(
                                    readOnly: true,
                                    onTap: () {
                                      Helper.toScreen(
                                          context,
                                          SearchScreen(
                                            screenName: 'podcast',
                                          ));
                                    },
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
                      Row(
                        children: [
                          CustomText(
                            title: 'Thoughts',
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
                            'The wise man therefore always holds in\nthese matters to this principle of that he\nrejects else endures pains to avoid\nto the worse pains',
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
                            shape: BoxShape.circle, color: Colors.transparent),
                        child: Icon(
                          Icons.arrow_forward,
                          color: Colors.transparent,
                        ),
                      ),
                    ],
                  ),
                ),
              if (mindfulProvider.controller!.index == 3)
                Positioned(
                  bottom: 30,
                  child: Column(
                    children: [
                      Row(
                        children: [
                          CustomText(
                            title: 'Libraries',
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
                            'These cases are perfectly simple and easy to\nwhen our power of choices is untramelled and\nwhen nothing prevents distinguish',
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
                            shape: BoxShape.circle, color: Colors.transparent),
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
        ],
      )),
    );
  }
}
