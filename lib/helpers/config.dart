import 'package:flutter/material.dart';

class SizeConfig {
  static  MediaQueryData? mediaQueryData;
  static  double? screenWidth;
  static  double? screenHeight;
  //static late double defaultSize;
  static  Orientation? orientation;

  void init(BuildContext context) {
    mediaQueryData = MediaQuery.of(context);
    screenWidth = mediaQueryData!.size.width;
    //print('$screenWidth');
    screenHeight = mediaQueryData!.size.height;
    orientation = mediaQueryData!.orientation;
  }
}

// Get the proportionate height as per screen size
double getProportionateScreenHeight(double inputHeight) {
  double screenHeight = SizeConfig.screenHeight!;
  // 812 is the layout height that designer use
  return (inputHeight / 812.0) * screenHeight;
}

// Get the proportionate height as per screen size
double getProportionateScreenWidth(double inputWidth) {
  double screenWidth = SizeConfig.screenWidth!;
  // 375 is the layout width that designer use
  return (inputWidth / 375.0) * screenWidth;
}
