import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:wellbe/models/CustomModels/custom_model.dart';

class MeditationProvider extends ChangeNotifier{
  // for slider
  int currentPage = 0;

  CarouselController buttonCarouselController = CarouselController();

  changeCurrentPage(int index) {
    currentPage = index ;
    notifyListeners();
  }

  changeSliderForward(BuildContext context) {
      buttonCarouselController.nextPage();
    //buttonCarouselController.jumpToPage(index);
    notifyListeners();
  }
  changeSliderBack(BuildContext context) {
      buttonCarouselController.previousPage();
    //buttonCarouselController.jumpToPage(index);
    notifyListeners();
  }
  TabController? controller;
  tabFuncation(TickerProvider vsync){
    controller = TabController(length: 3, vsync: vsync);
    controller!.addListener(tabIndexChange);
  }

  tabIndexChange(){
    notifyListeners();
  }

  tabNavigate(BuildContext context,int index,{bool? isInitial}){
    controller!.animateTo(index);
    notifyListeners();
  }

  bool isSearchBar = false;
  searchBarToggle({bool?val}){
    isSearchBar = val!;
    notifyListeners();
  }

  int monthFeelingTap=0;
  onMonthFeelingsChange(value){
    monthFeelingTap = value;
    notifyListeners();
  }
  int departurelTap=0;
  onDepartureChange(){
    if(departurelTap==0){
      departurelTap =1;

    }else if(departurelTap==1){
      departurelTap =2;
    }else if(departurelTap==2){
      departurelTap =0;
    }
    notifyListeners();
  }

  int houseTap=0;
  onHouseChange(){
    if(houseTap==0){
      houseTap =1;

    }else if(houseTap==1){
      houseTap =2;
    }else if(houseTap==2){
      houseTap =0;
    }
    notifyListeners();
  }

  int tabTap=0;
  onTapChange(value){
    tabTap =value;
    notifyListeners();
  }
}