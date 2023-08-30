import 'package:flutter/material.dart';
import 'package:persistent_bottom_nav_bar_v2/persistent-tab-view.dart';
import 'package:provider/provider.dart';
import 'package:wellbe/provider/JournalProvider/journal_provider.dart';
import 'package:wellbe/widgets/error_text_widget.dart';

import '../../../../models/CustomModels/custom_model.dart';
import '../../../../provider/PodcastsProvider/podcasts_provider.dart';
import '../../../../utilites/colors.dart';
import '../../../../utilites/helper.dart';
import '../../../../widgets/custom_inkwell_btn.dart';
import '../../../../widgets/custom_loader.dart';
import '../../../../widgets/custom_text.dart';
import '../podcasts_details.dart';

class DisgustedTab extends StatefulWidget {
  DisgustedTab({Key? key, required this.index}) : super(key: key);
  int index;

  @override
  State<DisgustedTab> createState() => _DisgustedTabState();
}

class _DisgustedTabState extends State<DisgustedTab> {
  void initState() {
    // TODO: implement initState
    Provider.of<PodcastsProvider>(context, listen: false)
        .getPodcastsByMoods(widget.index.toInt(), (status) {}, context);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<PodcastsProvider>(
        builder: (context, podcastsProvider, child) {
      return podcastsProvider.isLoading2
          ? Column(
              children: [
                const SizedBox(
                  height: 55,
                ),
                Center(
                  child: CustomLoader(),
                ),
              ],
            )
          : !podcastsProvider.isLoading2 &&
                  podcastsProvider.getPodcastsByMoodsModel.length == 0
              ? Column(
                  children: [
                    const SizedBox(
                      height: 55,
                    ),
                    Center(
                      child: ErrorTextWidget(),
                    ),
                  ],
                )
              : ListView.builder(
                  itemCount: podcastsProvider.getPodcastsByMoodsModel.length,
                  shrinkWrap: true,
                  physics: ClampingScrollPhysics(),
                  itemBuilder: (context, index) {
                    return Container(
                      padding: EdgeInsets.only(bottom: 10),
                      child: CustomInkWell(
                        onTap: () {
                          pushNewScreen(context,
                              screen: PodcastsDetails(index: index),
                              withNavBar: false);
                          // Helper.toScreen(context, PodcastsDetails());
                        },
                        child: Container(
                          padding: EdgeInsets.symmetric(
                              horizontal: 10, vertical: 10),
                          decoration: BoxDecoration(
                              color: extraLightGreyColor,
                              borderRadius: BorderRadius.circular(8)),
                          child: Row(
                            children: [
                              Stack(
                                alignment: Alignment.center,
                                children: [
                                  Container(
                                    width: 80,
                                    height: 80,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(8),
                                        image: DecorationImage(
                                            fit: BoxFit.cover,
                                            image: AssetImage(
                                                "assets/icons/image_01.png"))),
                                    clipBehavior: Clip.hardEdge,
                                  ),
                                  Icon(
                                    Icons.play_arrow_rounded,
                                    color: Colors.white,
                                    size: 30,
                                  )
                                ],
                              ),
                              //Space
                              SizedBox(
                                width: 12,
                              ),
                              //
                              Expanded(
                                  child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      CustomText(
                                        title:
                                            "Quick Meditation 2023\nMeditate with me",
                                        fontSize: 12.5,
                                        color: blackColor,
                                        fontWeight: FontWeight.w700,
                                      ),
                                      CustomText(
                                        title: "6 min",
                                        fontSize: 12.5,
                                        color: greyColor,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ],
                                  ),
                                  //Space
                                  SizedBox(
                                    height: 6,
                                  ),
                                  CustomText(
                                    title: "By Benjamin - 03 Episodes",
                                    fontSize: 12,
                                    color: textGreyColor2,
                                    //fontWeight: FontWeight.w700,
                                  ),
                                ],
                              )),
                              //Space
                              SizedBox(
                                width: 12,
                              ),
                            ],
                          ),
                        ),
                      ),
                    );
                  });
    });
  }
}
