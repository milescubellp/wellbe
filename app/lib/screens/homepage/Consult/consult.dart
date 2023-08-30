import 'package:flutter/material.dart';

import 'package:persistent_bottom_nav_bar_v2/persistent-tab-view.dart';
import 'package:provider/provider.dart';
import 'package:wellbe/provider/consult_provider.dart';
import 'package:wellbe/provider/profile_provider.dart';
import 'package:wellbe/screens/homepage/Consult/appointment.dart';
import 'package:wellbe/screens/homepage/Consult/booking%20confirmed.dart';
import 'package:wellbe/screens/homepage/Consult/doctor_appointment.dart';
import 'package:wellbe/widgets/custom_button.dart';
import 'package:wellbe/widgets/custom_cached_network_image.dart';
import 'package:wellbe/widgets/custom_parent_widget.dart';

import '../../../models/CustomModels/custom_model.dart';
import '../../../provider/DoctorUserProvider/doctor_user_provider.dart';
import '../../../utilites/colors.dart';
import '../../../utilites/helper.dart';
import '../../../widgets/custom_inkwell_btn.dart';
import '../../../widgets/custom_loader.dart';
import '../../../widgets/custom_text.dart';
import '../../../widgets/custom_textfield.dart';
import '../MIndFul/activity_details.dart';
import '../MoodSpace/mood_space.dart';
import 'doctor_details.dart';

class Consult extends StatefulWidget {
  @override
  State<Consult> createState() => _ConsultState();
}

class _ConsultState extends State<Consult> {
  String getButtonTitle(int index) {
    switch (index) {
      case 0:
        return 'Anxiety';
      case 1:
        return 'Headaches';
      case 2:
        return 'Breathing';
      case 3:
        return 'Emotional';
      case 4:
        return 'Family';
      default:
        return '';
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    Provider.of<DoctorUserProvider>(context, listen: false)
        .getDoctors((status) {}, context);
    Provider.of<DoctorUserProvider>(context, listen: false)
        .getExpertise((status) {}, context);
    Provider.of<DoctorUserProvider>(context, listen: false)
        .getLanguages((status) {}, context);
    Provider.of<DoctorUserProvider>(context, listen: false)
        .getAvailableType((status) {}, context);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return CustomParentWidget(child: Consumer<DoctorUserProvider>(
        builder: (context, doctorUserProvider, child) {
      return Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          centerTitle: false,
          backgroundColor: kPrimaryColor,
          elevation: 0,
          toolbarHeight: 65,
          title: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustomText(
                title: "Consult",
                fontSize: 18,
                color: blackColor,
                fontWeight: FontWeight.w700,
              ),
              //Space
              SizedBox(
                height: 4,
              ),
              CustomText(
                title: "Find a doctor and specialist easily",
                fontSize: 11.5,
                color: blackColor,
                // fontWeight: FontWeight.w700,
              ),
            ],
          ),
        ),
        body: doctorUserProvider.isLoading
            ? Center(child: CustomLoader())
            : Column(children: [
                Container(
                  width: double.maxFinite,
                  decoration: BoxDecoration(
                      color: kPrimaryColor,
                      borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(18),
                          bottomRight: Radius.circular(18))),
                  child: Column(
                    children: [
                      // Padding(
                      //   padding: EdgeInsets.symmetric(horizontal: 18),
                      //   child: CustomTextField(
                      //     //controller: emailController,
                      //     keyboardType: TextInputType.text,
                      //     //textInputAction: TextInputAction.done,
                      //     isOutlineInputBorder: true,
                      //
                      //     isOutlineInputBorderColor: greyColor,
                      //
                      //     onChanged: (_) {},
                      //     hintText: "Search",
                      //     hintFontSize: 13,
                      //     fieldborderRadius: 7,
                      //     outlineBottomLeftRadius: 10,
                      //     outlineTopRightRadius: 10,
                      //     outlineTopLeftRadius: 10,
                      //     outlineBottomRightRadius: 10,
                      //     textFieldFillColor: whiteColor,
                      //     suffixIcon: Image.asset("assets/icons/search.png"),
                      //   ),
                      // ),
                      const SizedBox(
                        height: 12,
                      ),
                      // Container(
                      //   height: 100,
                      //   child: ListView.builder(
                      //       scrollDirection: Axis.horizontal,
                      //       itemCount: 5,
                      //       itemBuilder: (context, index) => Container(
                      //             margin: EdgeInsets.only(left: 16),
                      //             child: Column(
                      //               children: [
                      //                 Container(
                      //                   width: 60,
                      //                   height: 60,
                      //                   decoration: BoxDecoration(
                      //                       image: DecorationImage(
                      //                           fit: BoxFit.cover,
                      //                           image: AssetImage(
                      //                               'assets/images/slide_img1.png')),
                      //                       shape: BoxShape.circle,
                      //                       border: Border.all(
                      //                           color: Colors.white, width: 6)),
                      //                 ),
                      //                 const SizedBox(
                      //                   height: 7,
                      //                 ),
                      //                 CustomText(
                      //                   title: getButtonTitle(index),
                      //                   fontWeight: FontWeight.w500,
                      //                   fontSize: 12,
                      //                 )
                      //               ],
                      //             ),
                      //           )),
                      // ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 13,
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 18.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            CustomText(
                              title: 'Top Doctors',
                              fontWeight: FontWeight.w700,
                              fontSize: 13.3,
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 8,
                        ),
                        Expanded(
                          child: ListView.builder(
                              itemCount:
                                  doctorUserProvider.getDoctorsModels.length,
                              shrinkWrap: true,
                              physics: ClampingScrollPhysics(),
                              itemBuilder: (context, index) {
                                final getDoctor =
                                    doctorUserProvider.getDoctorsModels[index];
                                return Container(
                                  padding: EdgeInsets.only(bottom: 10),
                                  child: CustomInkWell(
                                    onTap: () {},
                                    child: Container(
                                      padding: EdgeInsets.symmetric(
                                          horizontal: 10, vertical: 10),
                                      decoration: BoxDecoration(
                                          color: Color(0xFFe2f2ff),
                                          border:
                                              Border.all(color: darkGreyColor),
                                          borderRadius:
                                              BorderRadius.circular(8)),
                                      child: Row(
                                        children: [
                                          Container(
                                            width: 80,
                                            height: 80,
                                            decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(8),
                                            ),
                                            clipBehavior: Clip.hardEdge,
                                            child: CustomCachedNetworkImage(
                                                url: getDoctor.profilePic),
                                          ),
                                          //Space
                                          SizedBox(
                                            width: 12,
                                          ),
                                          //
                                          Expanded(
                                              child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              CustomText(
                                                title: "${getDoctor.name}",
                                                fontSize: 14.5,
                                                color: blackColor,
                                                fontWeight: FontWeight.w600,
                                              ),

                                              //Space
                                              SizedBox(
                                                height: 6,
                                              ),
                                              Row(
                                                children: [
                                                  CustomText(
                                                    title:
                                                        "Cardiologist | ${getDoctor.experience} exp |",
                                                    fontSize: 11,
                                                    color: greyColor,
                                                    fontWeight: FontWeight.w700,
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
                                                    fontWeight: FontWeight.w500,
                                                    //fontWeight: FontWeight.w700,
                                                  ),
                                                ],
                                              ),
                                              //Space
                                              SizedBox(
                                                height: 10,
                                              ),
                                              Row(
                                                children: [
                                                  CustomButton(
                                                    onPressed: () {
                                                      // Perform action for the first button
                                                      // pushNewScreen(
                                                      //   context,
                                                      //   screen: DoctorDetails(),
                                                      //   withNavBar: false,
                                                      // );
                                                      Provider.of<ProfileProvider>(
                                                              context,
                                                              listen: false)
                                                          .onProfilePageChanged(
                                                              false);
                                                      Helper.toScreen(
                                                          context,
                                                          DoctorDetails(
                                                            getDoctor:
                                                                getDoctor,
                                                          ));
                                                    },
                                                    title: 'Details',
                                                    textColor: blueColor,
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: 12,
                                                    btnBorderColor: blueColor,
                                                    btnBorderWidth: 2,
                                                    btnRadius: 60,
                                                    btnWidth: 70,
                                                    btnHeight: 26,
                                                    btnColor:
                                                        Colors.transparent,
                                                    // style: ElevatedButton.styleFrom(
                                                    //   backgroundColor:
                                                    //       Colors.transparent,
                                                    //   foregroundColor: Colors.white,
                                                    //   elevation: 0,
                                                    //   padding: EdgeInsets.symmetric(
                                                    //       vertical: 2,
                                                    //       horizontal: 14),
                                                    //   shape: RoundedRectangleBorder(
                                                    //     side: BorderSide(
                                                    //         width: 2,
                                                    //         color: blueColor),
                                                    //     borderRadius:
                                                    //         BorderRadius.circular(60),
                                                    //   ),
                                                    // ),
                                                  ),
                                                  const SizedBox(
                                                    width: 7,
                                                  ),
                                                  CustomButton(
                                                    onPressed: () {
                                                      // Perform action for the first button
                                                      // pushNewScreen(
                                                      //   context,
                                                      //   screen: DoctorDetails(),
                                                      //   withNavBar: false,
                                                      // );
                                                      Helper.toScreen(context,
                                                          AppointmentScreen());
                                                    },
                                                    title: 'Book',
                                                    textColor: whiteColor,
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: 12,
                                                    btnBorderColor:
                                                        darkBlueColor,
                                                    btnBorderWidth: 2,
                                                    btnRadius: 60,
                                                    btnWidth: 70,
                                                    btnHeight: 26,
                                                    btnColor: darkBlueColor,
                                                  ),
                                                ],
                                              ),
                                            ],
                                          )),
                                        ],
                                      ),
                                    ),
                                  ),
                                );
                              }),
                        ),
                      ],
                    ),
                  ),
                ),
              ]),
      );
    }));
  }
}
