import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wellbe/provider/auth_provider.dart';
import 'package:wellbe/utilites/colors.dart';
import 'package:wellbe/widgets/custom_cached_network_image.dart';
import 'package:wellbe/widgets/custom_inkwell_btn.dart';
import 'package:wellbe/widgets/custom_text.dart';
class SliderView extends StatelessWidget {
   SliderView({Key? key}) : super(key: key);
   int currentPage=0;
   List images =[
     "assets/images/slide_img1.png",
     "assets/images/slide_img2.png",
     "assets/images/slide_img3.png",
     "assets/images/slide_img4.png"
   ];
  @override
  Widget build(BuildContext context) {
    return Consumer<AuthProvider>(
        builder: (context,authProvider,child) {
          return Stack(
            children: [
              Container(
                width: double.infinity,
                height: double.infinity,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    fit: BoxFit.cover,
                    image: AssetImage("assets/icons/slider_bg.png")
                  )
                ),
                // child: Column(
                //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                //   children: [
                //      Container(
                //        width: double.infinity,
                //        height: 220,
                //        decoration: BoxDecoration(
                //          color: kPrimaryColor,
                //          borderRadius: BorderRadius.only(
                //            bottomLeft: Radius.circular(30),
                //            bottomRight: Radius.circular(30),
                //          )
                //        ),
                //      ),
                //     Image.asset("assets/icons/footer_bg_wave.png",
                //       fit: BoxFit.cover,
                //       width: double.infinity,)
                //   ],
                // ),
              ),
              CarouselSlider(
                options: CarouselOptions(
                  height: double.infinity,
                  //viewportFraction: 0.99,
                  viewportFraction: 1,
                  autoPlay: true,
                  //   enableInfiniteScroll: false,
                //  scrollPhysics: NeverScrollableScrollPhysics(),
                  onPageChanged: (int index, val) {
                    authProvider.changeCurrentPage(index);
                  },
                ),
                carouselController: authProvider.buttonCarouselController,
                items: images.map((i) {

                  return Builder(
                    builder: (BuildContext context) {
                      return Container(
                        width: double.infinity,
                       // height: 200,
                        clipBehavior: Clip.hardEdge,
                        decoration: BoxDecoration(

                        ),
                        child: Column(
                          children: [
                            //Space
                            SizedBox(height: MediaQuery.of(context).size.height*0.1,),
                            //
                            Container(
                              width: 300,
                              height: MediaQuery.of(context).size.height*0.4-20,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                image: DecorationImage(
                                    fit: BoxFit.cover,
                                    image: AssetImage("${i.toString()}"))
                              ),
                            ),
                            //Space
                            SizedBox(height: 20,),
                            //
                            Container(
                              alignment: Alignment.center,
                              child: CustomText(
                                title: authProvider.currentPage==0?
                                "Track your mood and\nleave stress behind!":
                                authProvider.currentPage==1?
                                "Take charge of\nyour thoughts":
                                authProvider.currentPage==2?
                                "No Judgement Zone!":
                                    "Write your way to better\nmental health",
                                fontSize: 22,
                                fontWeight: FontWeight.w700,
                                color: blackColor,
                                textAlign: TextAlign.center,
                              ),
                            ),
                            //Space
                            SizedBox(height: 10,),

                            Container(
                              alignment: Alignment.center,
                              padding: EdgeInsets.symmetric(horizontal: 18),
                              child: CustomText(
                                title:authProvider.currentPage==0?
                                "Take control of your feelings and wok on\n"
                                    "them daily to improve your overall well-being.":
                                authProvider.currentPage==1?
                                    "Learn simple techniques to embrace\n"
                                        "and navigate thoughts that slow you down."
                                    :
                                authProvider.currentPage==2?
                                    "A safe place to connect with like minded\n"
                                        "pals to unburden how you feel."
                                    :
                                    "Feel lighter, happier and less stressed\n"
                                        "by journaling down your thoughts."
                                ,
                                fontSize: 14,
                                //fontWeight: FontWeight.w700,
                                color: greyColor,
                                textAlign: TextAlign.center,
                              ),
                            ),
                          ],
                        ),
                      );
                    },
                  );
                }).toList(),
              ),
              Positioned.directional(
                  textDirection: Directionality.of(context),
                  bottom: MediaQuery.of(context).size.height*0.2-30,
                  start: 0,
                  end: 0,
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: List.generate(images.length, (index){
                          return buildDot(context,authProvider,index: index);
                        }),
                      ),
                      //Space
                      SizedBox(height: 30,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          CustomInkWell(
                            onTap: (){
                              authProvider.changeSliderImage(context);
                            },
                            child: Container(
                              width: 80,
                              height: 80,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                border: Border.all(
                                  width: 1,
                                  color: kPrimaryColor
                                )
                              ),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Container(
                                    width: 55,
                                    height: 55,
                                    decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        color: darkBlueColor
                                    ),
                                    child: Image.asset("assets/icons/ic_arrow_f.png",scale: 2,),
                                  ),
                                ],
                              ),
                            ),
                          )
                        ],
                      )
                    ],
                  )),
            ],
          );
        }
    );
  }

   buildDot(BuildContext context,AuthProvider authProvider,{int? index,Bu}){
     return AnimatedContainer(
       width:authProvider.currentPage==index? 45:5,
       height: 5,
       margin: EdgeInsets.only(right: 7),
       decoration: BoxDecoration(
           color:authProvider.currentPage==index? blackColor: greyColor,
          borderRadius: BorderRadius.circular(2.5)
       ), duration: Duration(milliseconds: 350),
     );
   }
}
