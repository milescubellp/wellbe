import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wellbe/widgets/custom_parent_widget.dart';

import '../../../models/GetPodcastsModel/get_podcasts_model.dart';
import '../../../provider/PodcastsProvider/podcasts_provider.dart';
import '../../../utilites/colors.dart';
import '../../../utilites/string_utils.dart';
import '../../../widgets/custom_inkwell_btn.dart';
import '../../../widgets/custom_text.dart';
import 'academic_audio.dart';

class QMScreen extends StatefulWidget {
  String? title;
  int? duration;
  String? image;

  QMScreen({Key? key, this.podcastaudio, this.title, this.duration, this.image})
      : super(key: key);
  List? podcastaudio;

  @override
  State<QMScreen> createState() => _QMScreenState();
}

class _QMScreenState extends State<QMScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Provider.of<PodcastsProvider>(context, listen: false).addUserPodcast(
        widget.podcastaudio![0].id.toString(), (status) {}, context);
  }

  @override
  Widget build(BuildContext context) {
    return CustomParentWidget(
      child: Scaffold(
        appBar: AppBar(
          elevation: 0,
          centerTitle: false,
          automaticallyImplyLeading: false,
          backgroundColor: kPrimaryColor,
          title: CustomText(
            title:
                "${widget.podcastaudio![0].title} - Episode ${widget.podcastaudio![0].id}",
            fontSize: 17,
            color: blackColor,
            fontWeight: FontWeight.w700,
          ),
          actions: [
            CustomInkWell(
              onTap: () {
                Navigator.pop(context);
              },
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Image.asset(
                  "assets/icons/close.png",
                  scale: 1.1,
                ),
              ),
            ),
            //Space
            SizedBox(
              width: 10,
            )
          ],
        ),
        body: SingleChildScrollView(
          child: Column(children: [
            AudioWidget(
                assetPath: widget.podcastaudio![0].audio, image: widget.image),

            //Space

            const SizedBox(
              height: 18,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 18.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          CustomText(
                              title: 'By Benjamin',
                              fontWeight: FontWeight.w600,
                              fontSize: 12.0,
                              color: textGreyColor2),
                          SizedBox(width: 10.0),
                          CustomText(
                              title: '${widget.duration} min',
                              color: greyColor,
                              fontWeight: FontWeight.w500,
                              fontSize: 12),
                        ],
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  CustomText(
                    title:
                        "${widget.title} - Episode 0${widget.podcastaudio![0].id}",
                    fontSize: 14,
                    color: blackColor,
                    fontWeight: FontWeight.w700,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: CustomText(
                          title: removeHtmlTags(
                              widget.podcastaudio![0].description.toString()),
                          fontSize: 12,
                          color: textGreyColor2,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  )
                ],
              ),
            )
          ]),
        ),
      ),
    );
  }
}
