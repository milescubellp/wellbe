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
import '../../homepage/VentOut/connecting_expert.dart';
import '../../homepage/VentOut/forum_tab.dart';
import 'image_forum_tab.dart';

class ImageVentoutScreen extends StatefulWidget {
  ImageVentoutScreen({Key? key}) : super(key: key);

  @override
  State<ImageVentoutScreen> createState() => _ImageVentoutScreenState();
}

class _ImageVentoutScreenState extends State<ImageVentoutScreen>
    with SingleTickerProviderStateMixin {
  ScrollController _scrollController = ScrollController();
  @override
  void initState() {
    super.initState();
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
        return Scaffold(
          body: customWidget(mindfulProvider, ventoutProvider),
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
          physics: BouncingScrollPhysics(),
          headerSliverBuilder: (context, isNestedScrolled) {
            return [createSilverAppBar1(context, mindfulProvider)];
          },
          body: TabBarView(controller: mindfulProvider.controller, children: [
            // ForumTab(),
            ImageForumTab(),
            // ventoutProvider.isShow == true
            //     ? ConnectingExpert()
            TalkToExpertTab()
          ]),
        ));
  }

  SliverAppBar createSilverAppBar1(context, MoodSpaceProvider mindfulProvider) {
    return SliverAppBar(
      automaticallyImplyLeading: false,
      centerTitle: false,
      elevation: 0,
      pinned: true,
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
                    CustomText(
                      title: 'Forum',
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
              )
            ]),
          ),
          Container(
            padding: EdgeInsets.only(left: 18, right: 18, bottom: 0, top: 65),
            decoration: BoxDecoration(
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
                  indicator: UnderlineTabIndicator(
                      borderRadius: BorderRadius.circular(20),
                      borderSide: BorderSide(width: 3, color: whiteColor)),
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
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                      color: whiteColor,
                    ),
                    CustomText(
                      title: "Talk to Expert",
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                      color: whiteColor,
                    ),
                  ],
                ),
              ),
            ),
          )
        ],
      )),
      actions: [
        CustomInkWell(
          onTap: () {},
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
                Helper.toScreen(context, ProfileScreen());
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
    );
  }
}
