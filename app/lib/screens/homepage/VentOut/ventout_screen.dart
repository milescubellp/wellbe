import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wellbe/provider/mindful_provider.dart';
import 'package:wellbe/screens/homepage/VentOut/talk_to_expert_tab.dart';

import '../../../provider/ventout_provider.dart';
import '../../../utilites/colors.dart';
import '../../../utilites/helper.dart';
import '../../../widgets/custom_inkwell_btn.dart';
import '../../../widgets/custom_parent_widget.dart';
import '../../../widgets/custom_text.dart';
import '../../Profile/profile_screen.dart';
import '../MIndFul/info_screen.dart';
import 'connecting_expert.dart';
import 'forum_tab.dart';

class VentoutScreen extends StatefulWidget {
  VentoutScreen({Key? key}) : super(key: key);

  @override
  State<VentoutScreen> createState() => _VentoutScreenState();
}

class _VentoutScreenState extends State<VentoutScreen>
    with SingleTickerProviderStateMixin {
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
        .tabFuncation(this, 2);
  }

  @override
  Widget build(BuildContext context) {
    return CustomParentWidget(
      child: Consumer2<MoodSpaceProvider, VentoutProvider>(builder: (
        context,
        mindfulProvider,
        ventoutProvider,
        child,
      ) {
        return Stack(
          children: [
            Scaffold(
              body: customWidget(mindfulProvider, ventoutProvider),
            ),
            Container(
              padding: EdgeInsets.only(left: 18, right: 18, bottom: 0, top: 80),
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
                    physics: NeverScrollableScrollPhysics(),
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
                            color: _scrollPosition > 340
                                ? blackColor
                                : whiteColor)),
                    labelPadding: EdgeInsets.only(bottom: 12, top: 8),
                    indicatorSize: TabBarIndicatorSize.label,
                    indicatorWeight: 5.0,
                    // indicatorPadding: EdgeInsets.symmetric(horizontal: 22),
                    // labelColor: wh,
                    labelColor: kPrimaryColor,
                    unselectedLabelColor: blackColor,
                    tabs: [
                      CustomText(
                        title: "Forum",
                        color: _scrollPosition > 340 ? blackColor : whiteColor,
                      ),
                      CustomText(
                        title: "Talk to Expert",
                        color: _scrollPosition > 340 ? blackColor : whiteColor,
                      ),
                    ],
                  ),
                ),
              ),
            )
          ],
        );
      }),
    );
  }

  Widget customWidget(
      MoodSpaceProvider mindfulProvider, VentoutProvider ventoutProvider) {
    return MediaQuery.removePadding(
        context: context,
        removeBottom: true,
        removeTop: true,
        child: NestedScrollView(
          controller: _scrollController,
          floatHeaderSlivers: true,
          physics: BouncingScrollPhysics(),
          headerSliverBuilder: (context, isNestedScrolled) {
            return [createSilverAppBar1(context, mindfulProvider)];
          },
          body: TabBarView(controller: mindfulProvider.controller, children: [
            ForumTab(),
            // ImageForumTab(),
            ventoutProvider.isShow == true
                ? ConnectingExpert()
                : TalkToExpertTab()
          ]),
        ));
  }

  SliverAppBar createSilverAppBar1(context, MoodSpaceProvider mindfulProvider) {
    return SliverAppBar(
      automaticallyImplyLeading: false,
      centerTitle: false,
      elevation: 0,
      pinned: true,
      floating: false,
      backgroundColor: Colors.transparent,
      toolbarHeight: 90 + MediaQuery.of(context).padding.top,
      expandedHeight: 450,
      title: CustomText(
        title: "Vent Out",
        fontSize: 18,
        color: whiteColor,
        fontWeight: FontWeight.w700,
      ),
      flexibleSpace: FlexibleSpaceBar(
          background: Stack(
        children: [
          Container(
            child: Stack(alignment: Alignment.bottomCenter, children: [
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
              Positioned(
                bottom: 30,
                child: Column(
                  children: [
                    Row(
                      children: [
                        CustomText(
                          title: 'Forum',
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
                    // Container(
                    //   width: 40,
                    //   height: 40,
                    //   decoration: BoxDecoration(
                    //       shape: BoxShape.circle,
                    //       color: Color(0xFF44454c).withOpacity(0.7)),
                    //   child: Icon(
                    //     Icons.arrow_forward,
                    //     color: Colors.white,
                    //   ),
                    // ),
                    const SizedBox(
                      height: 30,
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
