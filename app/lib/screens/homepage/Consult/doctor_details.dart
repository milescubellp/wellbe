import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wellbe/screens/homepage/Consult/appointment.dart';
import 'package:wellbe/utilites/string_utils.dart';
import 'package:wellbe/widgets/execute_after_frame_render.dart';

import '../../../models/CustomModels/custom_model.dart';
import '../../../models/GetDoctorsModel/get_doctors_model.dart';
import '../../../provider/DoctorUserProvider/doctor_user_provider.dart';
import '../../../provider/consult_provider.dart';
import '../../../utilites/colors.dart';
import '../../../utilites/helper.dart';
import '../../../widgets/custom_cached_network_image.dart';
import '../../../widgets/custom_inkwell_btn.dart';
import '../../../widgets/custom_loader.dart';
import '../../../widgets/custom_parent_widget.dart';
import '../../../widgets/custom_text.dart';

class DoctorDetails extends StatefulWidget {
  final GetDoctorsModel getDoctor;

  const DoctorDetails({super.key, required this.getDoctor});

  @override
  State<DoctorDetails> createState() => _DoctorDetailsState();
}

class _DoctorDetailsState extends State<DoctorDetails> {
  String getButtonTitle(int index) {
    switch (index) {
      case 0:
        return 'Video Call';
      case 1:
        return 'Audio Call';
      case 2:
        return 'Chat';

      default:
        return '';
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    executeAfterFrameRender(() {
      if (widget.getDoctor.availableType!.contains('Chat')) {
        Provider.of<ConsultProvider>(context, listen: false)
            .onDoctorsSelectTypeChange(0);
      } else if (widget.getDoctor.availableType!.contains('Audio Call')) {
        Provider.of<ConsultProvider>(context, listen: false)
          ..onDoctorsSelectTypeChange(1);
      } else if (widget.getDoctor.availableType!.contains('Video Call')) {
        Provider.of<ConsultProvider>(context, listen: false)
          ..onDoctorsSelectTypeChange(2);
        debugPrint(
            'index:${Provider.of<ConsultProvider>(context, listen: false).doctorsSelectTypeIndex}');
      }
    });

    debugPrint(
        'expertise length:${Provider.of<DoctorUserProvider>(context, listen: false).getExpertiseModels.length}');
    debugPrint(
        'language length:${Provider.of<DoctorUserProvider>(context, listen: false).getLanguagesModels.length}');
    debugPrint(
        'awavilable type length:${Provider.of<DoctorUserProvider>(context, listen: false).getAvailableTypeModels.length}');

    // Provider.of<DoctorUserProvider>(context,listen: false).getExpertise((status){}, context);
    // Provider.of<DoctorUserProvider>(context,listen: false).getLanguages((status){}, context);
    // Provider.of<DoctorUserProvider>(context,listen: false).getAvailableType((status){}, context);
  }

  @override
  Widget build(BuildContext context) {
    return CustomParentWidget(
      child: Consumer2<ConsultProvider, DoctorUserProvider>(
          builder: (context, consultProvider, doctorUserProvider, child) {
        return Scaffold(
          appBar: AppBar(
            elevation: 0,
            centerTitle: false,
            automaticallyImplyLeading: false,
            backgroundColor: kPrimaryColor,
            title: CustomText(
              title: "Doctor Details",
              fontSize: 17,
              color: blackColor,
              fontWeight: FontWeight.w700,
            ),
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
          ),
          body: doctorUserProvider.getExpertiseModels.length == 0 ||
                  doctorUserProvider.getLanguagesModels.length == 0 ||
                  doctorUserProvider.getAvailableTypeModels.length == 0
              ? Center(
                  child: CustomLoader(),
                )
              : SingleChildScrollView(
                  child: Column(
                  children: [
                    Container(
                      height: 318,
                      width: MediaQuery.of(context).size.width,
                      decoration: BoxDecoration(
                          color: kPrimaryColor,
                          borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(25),
                            bottomRight: Radius.circular(25),
                          )),
                      padding: EdgeInsets.only(
                          left: 13, right: 13, top: 10, bottom: 25),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          //IMAGE
                          Container(
                            //  width: double.infinity,
                            height: 230,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                            ),
                            alignment: Alignment.center,
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(20),
                              child: CustomCachedNetworkImage(
                                  url: '${widget.getDoctor.profilePic}'),
                            ),
                          ),
                          const SizedBox(
                            height: 15,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  CustomText(
                                    title: "${widget.getDoctor.name}",
                                    fontSize: 15.5,
                                    color: blackColor,
                                    fontWeight: FontWeight.w700,
                                  ),
                                  const SizedBox(
                                    height: 2,
                                  ),
                                  Row(
                                    children: [
                                      CustomText(
                                        title:
                                            "Psychologist | ${widget.getDoctor.experience} exp |",
                                        fontSize: 12,
                                        color: greyColor,
                                        fontWeight: FontWeight.bold,
                                        //fontWeight: FontWeight.w700,
                                      ),
                                      Icon(
                                        Icons.star,
                                        color: Colors.yellow,
                                        size: 16,
                                      ),
                                      CustomText(
                                        title: " 4.3",
                                        fontSize: 12,
                                        color: blackColor,
                                        fontWeight: FontWeight.bold,
                                        //fontWeight: FontWeight.w700,
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    //Space

                    const SizedBox(
                      height: 15,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 18.0),
                      child: Column(
                        children: [
                          Row(
                            children: [
                              CustomText(
                                title: 'About',
                                fontWeight: FontWeight.bold,
                                color: blackColor,
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 4,
                          ),
                          Row(
                            children: [
                              Expanded(
                                child: CustomText(
                                  title: removeHtmlTags(
                                      widget.getDoctor.about.toString()),
                                  fontWeight: FontWeight.w700,
                                  color: greyColor,
                                  fontSize: 11.4,
                                ),
                              ),
                              // CustomText(
                              //   title:
                              //   "There are many variations of passages of available,but the\nmajority have suffered alteration in some form,by injected\nhumour,or randomised words which don't look even slightly\nIf you are going to use a passage",
                              //   fontWeight: FontWeight.w700,
                              //   color: greyColor,
                              //   fontSize: 11.4,
                              // ),
                            ],
                          ),
                          const SizedBox(
                            height: 14,
                          ),
                          Row(
                            children: [
                              CustomText(
                                title: 'Availability',
                                fontWeight: FontWeight.bold,
                                color: blackColor,
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 4,
                          ),
                          Row(
                            children: [
                              CustomText(
                                title: "${widget.getDoctor.availability}",
                                fontWeight: FontWeight.w700,
                                color: greyColor,
                                fontSize: 11.4,
                              ),
                            ],
                          ),
                          // const SizedBox(
                          //   height: 2,
                          // ),
                          // Row(
                          //   children: [
                          //     CustomText(
                          //       title:
                          //           "Sat - Sun\t\t\t\t\t\t\t\t\t\t9.00AM - 01.00PM",
                          //       fontWeight: FontWeight.w700,
                          //       color: greyColor,
                          //       fontSize: 11.4,
                          //     ),
                          //   ],
                          // ),
                          const SizedBox(
                            height: 14,
                          ),
                          Row(
                            children: [
                              CustomText(
                                title: 'Expertise',
                                fontWeight: FontWeight.bold,
                                color: blackColor,
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 4,
                          ),

                          SizedBox(
                            height: 18,
                            child: ListView.builder(
                                scrollDirection: Axis.horizontal,
                                itemCount: doctorUserProvider
                                    .getExpertiseModels.length,
                                itemBuilder: (context, index) {
                                  final expertise = doctorUserProvider
                                      .getExpertiseModels[index];
                                  return Container(
                                    margin: EdgeInsets.only(right: 15),
                                    alignment: Alignment.centerLeft,
                                    child: CustomText(
                                      title: "${expertise.title}",
                                      fontWeight: FontWeight.w700,
                                      color: greyColor,
                                      fontSize: 11.4,
                                    ),
                                  );
                                }),
                          ),
                          const SizedBox(
                            height: 14,
                          ),
                          Row(
                            children: [
                              CustomText(
                                title: 'Languages',
                                fontWeight: FontWeight.bold,
                                color: blackColor,
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 4,
                          ),
                          SizedBox(
                            height: 18,
                            child: ListView.builder(
                                scrollDirection: Axis.horizontal,
                                itemCount: doctorUserProvider
                                    .getLanguagesModels.length,
                                itemBuilder: (context, index) {
                                  final language = doctorUserProvider
                                      .getLanguagesModels[index];
                                  return Container(
                                    margin: EdgeInsets.only(right: 15),
                                    alignment: Alignment.centerLeft,
                                    child: CustomText(
                                      title: "${language.title}",
                                      fontWeight: FontWeight.w700,
                                      color: greyColor,
                                      fontSize: 11.4,
                                    ),
                                  );
                                }),
                          ),
                          const SizedBox(
                            height: 14,
                          ),
                          Row(
                            children: [
                              CustomText(
                                title: 'Available type',
                                fontWeight: FontWeight.bold,
                                color: blackColor,
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 4,
                          ),
                          Container(
                            height: 30,
                            child: ListView.builder(
                              scrollDirection: Axis.horizontal,
                              itemCount: doctorUserProvider
                                  .getAvailableTypeModels.length,
                              itemBuilder: (context, index) {
                                final availableType = doctorUserProvider
                                    .getAvailableTypeModels[index];
                                debugPrint(
                                    '<<<index:${consultProvider.doctorsSelectTypeIndex}>>>');

                                return Container(
                                  margin: EdgeInsets.only(right: 8),
                                  child: CustomInkWell(
                                    onTap: () {},
                                    child: Container(
                                      width: 75,
                                      alignment: Alignment.center,
                                      decoration: BoxDecoration(
                                        border: Border.all(
                                          color: Colors.grey,
                                          width: 1,
                                        ),
                                        borderRadius: BorderRadius.circular(4),
                                        color: consultProvider
                                                    .doctorsSelectTypeIndex ==
                                                index
                                            ? kPrimaryColor
                                            : Colors.transparent,
                                      ),
                                      child: Text(
                                        '${availableType.title}',
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
                            height: 15,
                          ),
                          Container(
                            alignment: Alignment.centerLeft,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  children: [
                                    CustomText(
                                      title: "Review",
                                      fontSize: 15,
                                      color: blackColor,
                                      fontWeight: FontWeight.w700,
                                    ),
                                    // CustomText(
                                    //   title: " (104+ Reviews)",
                                    //   fontSize: 11,
                                    //   color: greyColor,
                                    //   fontWeight: FontWeight.w700,
                                    // ),
                                  ],
                                ),
                                // CustomInkWell(
                                //   onTap: () {
                                //     //   Helper.toScreen(context, InsightScreen());
                                //   },
                                //   child: Padding(
                                //     padding: const EdgeInsets.all(8.0),
                                //     child: Row(
                                //       children: [
                                //         CustomText(
                                //           title: "View All",
                                //           fontSize: 15,
                                //           color: blueColor,
                                //           fontWeight: FontWeight.w600,
                                //         ),
                                //         //Space
                                //         // SizedBox(width: 4,),
                                //         Icon(
                                //           Icons.keyboard_arrow_right,
                                //           color: blackColor,
                                //         )
                                //       ],
                                //     ),
                                //   ),
                                // )
                              ],
                            ),
                          ),
                          const SizedBox(
                            height: 15,
                          ),
                          Container(
                            height: 150,
                            child: ListView.builder(
                                itemCount: 4,
                                shrinkWrap: true,
                                scrollDirection: Axis.horizontal,
                                itemBuilder: (context, index) => Container(
                                      padding: EdgeInsets.symmetric(
                                          horizontal: 10, vertical: 10),
                                      margin: EdgeInsets.only(right: 15),
                                      decoration: BoxDecoration(
                                          color: Colors.white,
                                          border:
                                              Border.all(color: darkGreyColor),
                                          borderRadius:
                                              BorderRadius.circular(8)),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Row(
                                            children: [
                                              Container(
                                                width: 50,
                                                height: 50,
                                                decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            8),
                                                    image: DecorationImage(
                                                        fit: BoxFit.cover,
                                                        image: AssetImage(
                                                            "${meditationList[index].img}"))),
                                                clipBehavior: Clip.hardEdge,
                                              ),
                                              //Space
                                              SizedBox(
                                                width: 12,
                                              ),
                                              //
                                              Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  CustomText(
                                                    title: "Dr James William",
                                                    fontSize: 12.5,
                                                    color: blackColor,
                                                    fontWeight: FontWeight.w600,
                                                  ),

                                                  //Space
                                                  SizedBox(
                                                    height: 3,
                                                  ),
                                                  Row(
                                                    children: [
                                                      CustomText(
                                                        title: "1 day ago |",
                                                        fontSize: 10.7,
                                                        color: greyColor,
                                                        fontWeight:
                                                            FontWeight.w600,
                                                        //fontWeight: FontWeight.w700,
                                                      ),
                                                      Icon(
                                                        Icons.star,
                                                        color: Colors.yellow,
                                                        size: 16,
                                                      ),
                                                      CustomText(
                                                        title: " 4.3",
                                                        fontSize: 11,
                                                        color: blackColor,
                                                        fontWeight:
                                                            FontWeight.w500,
                                                        //fontWeight: FontWeight.w700,
                                                      ),
                                                    ],
                                                  ),
                                                ],
                                              ),
                                            ],
                                          ),
                                          const SizedBox(
                                            height: 7,
                                          ),
                                          CustomText(
                                            title:
                                                'It uses a dictionary of over 200 latin to\nwords,combined with a handful of model\nsentence structures,to generate which\n looks and reasonable',
                                            color: greyColor,
                                            fontSize: 12,
                                          )
                                        ],
                                      ),
                                    )),
                          ),
                          const SizedBox(
                            height: 45,
                          ),
                        ],
                      ),
                    ),
                  ],
                )),
          bottomNavigationBar: Container(
            padding: EdgeInsets.fromLTRB(17, 15, 17, 9),
            decoration: BoxDecoration(color: whiteColor, boxShadow: [
              BoxShadow(
                  color: greyColor.withOpacity(0.1),
                  spreadRadius: 3,
                  blurRadius: 3,
                  offset: Offset(
                    0,
                    -2,
                  ))
            ]),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    CustomText(
                      title: 'Consultation Price',
                      fontWeight: FontWeight.w500,
                      fontSize: 12,
                    ),
                    CustomText(
                      title: '${widget.getDoctor.consltFee}',
                      fontWeight: FontWeight.w700,
                      fontSize: 15,
                    ),
                  ],
                ),
                ElevatedButton(
                  onPressed: () {
                    // Perform action for the second button
                    consultProvider.onDoctorIdChanged(widget.getDoctor.id);
                    Helper.toScreen(context, AppointmentScreen());
                  },
                  child: CustomText(
                    title: 'Book New',
                    fontSize: 12,
                    color: Colors.white,
                  ),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: darkBlueColor,
                    foregroundColor: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(60),
                    ),
                  ),
                )
              ],
            ),
          ),
        );
      }),
    );
  }
}
