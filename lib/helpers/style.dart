import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import 'config.dart';
import 'constants.dart';


class CustomTextStyle
{



static TextStyle getTitleFont()
{
  
  
return GoogleFonts.raleway(
      textStyle: TextStyle(
      color: Constants.kPinkColor,
       letterSpacing: .5,
       fontSize: SizeConfig.orientation==Orientation.landscape?SizeConfig.screenWidth!*0.04:SizeConfig.screenWidth!*0.08
       ),
  );
}

static TextStyle getHeaderFont()
{
return GoogleFonts.raleway(
      textStyle: TextStyle(
      color: Constants.kCyanColor,
       letterSpacing: .5,
       fontSize: SizeConfig.orientation==Orientation.landscape?SizeConfig.screenWidth!*0.04:SizeConfig.screenWidth!*0.08
       ),
  );
}

static TextStyle sliverHeaderStyle()
{   
return GoogleFonts.raleway(
      textStyle: TextStyle(
      color: Constants.kWhiteColor,
       letterSpacing: .5,
       fontSize:SizeConfig.orientation==Orientation.landscape?SizeConfig.screenWidth!*0.02: SizeConfig.screenWidth!*0.05
       ),
  );
}

static TextStyle sliverBodyStyle()
{   
return GoogleFonts.raleway(
      textStyle: TextStyle(
      //color: Constants.kWhiteColor,
       letterSpacing: .9,
       height: 1.5,
       fontSize: SizeConfig.orientation==Orientation.landscape?SizeConfig.screenWidth!*0.02:SizeConfig.screenWidth!*0.04
       ),
  );
}

static TextStyle castNameStyle()
{   
return GoogleFonts.raleway(
      textStyle: TextStyle(
      color: Get.isDarkMode? Constants.kWhiteColor:Colors.black,
       letterSpacing: .5,
       fontSize: SizeConfig.orientation==Orientation.landscape?SizeConfig.screenWidth!*0.01:SizeConfig.screenWidth!*0.03
       ),
  );
}



}