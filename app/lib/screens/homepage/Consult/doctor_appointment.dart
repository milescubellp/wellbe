import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wellbe/provider/homepage_provider.dart';
import 'package:wellbe/provider/profile_provider.dart';
import 'package:wellbe/screens/Profile/profile_screen.dart';
import 'package:wellbe/screens/homepage/Consult/AppointmentsTab/history.dart';
import 'package:wellbe/screens/homepage/Consult/AppointmentsTab/upcoming.dart';
import 'package:wellbe/screens/homepage/HomeScreens/homepage_screen.dart';
import 'package:wellbe/utilites/helper.dart';
import 'package:wellbe/widgets/custom_parent_widget.dart';

import '../../../provider/consult_provider.dart';
import '../../../utilites/colors.dart';
import '../../../widgets/custom_inkwell_btn.dart';
import '../../../widgets/custom_text.dart';

class DoctorAppointment extends StatefulWidget {
  @override
  State<DoctorAppointment> createState() => _DoctorAppointmentState();
}

class _DoctorAppointmentState extends State<DoctorAppointment>
    with SingleTickerProviderStateMixin {
  @override
  void initState() {
    super.initState();
    Provider.of<ConsultProvider>(context, listen: false).tabFuncation(this, 2);
  }

  @override
  Widget build(BuildContext context) {
    return CustomParentWidget(child:
        Consumer<ConsultProvider>(builder: (context, consultProvider, child) {
      return WillPopScope(
        onWillPop: () async {
          if (!Provider.of<ProfileProvider>(context, listen: false)
              .isProfilePage) {
            Helper.toScreen(
                context,
                HomePageScreen(
                  index: 0,
                ));
          } else {
            Navigator.pop(context);
          }
          return true;
        },
        child: Scaffold(
          appBar: AppBar(
            automaticallyImplyLeading: false,
            centerTitle: false,
            elevation: 0,
            toolbarHeight: 65,
            title: CustomText(
              title: "Appointments",
              fontSize: 18,
              color: blackColor,
              fontWeight: FontWeight.w700,
            ),
            leading: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  CustomInkWell(
                    onTap: () {
                      if (!Provider.of<ProfileProvider>(context, listen: false)
                          .isProfilePage) {
                        Helper.toScreen(
                            context,
                            HomePageScreen(
                              index: 0,
                            ));
                      } else {
                        Navigator.pop(context);
                      }
                    },
                    child: Container(
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          //    color: kPrimaryColor
                        ),
                        child: Image.asset(
                          "assets/icons/arrow_back_02.png",
                          scale: 1.1,
                        )),
                  ),
                ],
              ),
            ),
            bottom: PreferredSize(
                preferredSize: Size.fromHeight(50),
                child: Container(
                  decoration: BoxDecoration(
                      border: Border(
                          bottom:
                              BorderSide(width: 1.5, color: kPrimaryColor))),
                  margin: EdgeInsets.only(left: 18, right: 18, bottom: 0),
                  child: Container(
                    child: Theme(
                      data: ThemeData(
                        highlightColor: Colors.transparent,
                        splashColor: Colors.transparent,
                      ),
                      child: TabBar(
                        controller: consultProvider.controller,
                        physics: NeverScrollableScrollPhysics(),
                        // isScrollable: true,
                        indicatorColor: kPrimaryColor,
                        indicator: UnderlineTabIndicator(
                            borderRadius: BorderRadius.circular(20),
                            borderSide:
                                BorderSide(width: 3, color: kPrimaryColor)),
                        labelPadding: EdgeInsets.only(bottom: 12, top: 8),
                        indicatorSize: TabBarIndicatorSize.tab,

                        indicatorWeight: 5.0,
                        // indicatorPadding: EdgeInsets.symmetric(horizontal: 22),
                        // labelColor: wh,
                        labelColor: kPrimaryColor,
                        unselectedLabelColor: blackColor,
                        tabs: [
                          CustomText(
                            title: "Upcoming",
                            fontSize: 14,
                            fontWeight: FontWeight.w600,
                            color: blackColor,
                          ),
                          CustomText(
                            title: "History",
                            fontSize: 14,
                            fontWeight: FontWeight.w600,
                            color: blackColor,
                          ),
                        ],
                      ),
                    ),
                  ),
                )),
          ),
          body: TabBarView(controller: consultProvider.controller, children: [
            Upcoming(),
            History(),
          ]),
        ),
      );
    }));
  }
}
