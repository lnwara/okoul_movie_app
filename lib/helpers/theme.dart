import 'package:flutter/material.dart';
import 'constants.dart';

class CutomTheme
{



  static final dark = 
    ThemeData(
      primaryColor: Constants.kBlackColor,
      //inputDecorationTheme: MyInputDecorationTheme.theme(),
      brightness: Brightness.dark

    );


    static final light = 
    ThemeData(
      primaryColor: Constants.kBlackColor,
      //inputDecorationTheme: MyInputDecorationTheme.theme(),
      brightness: Brightness.light,
      backgroundColor: Colors.white.withOpacity(0.6),
      scaffoldBackgroundColor:Colors.white.withOpacity(0.9),
      
  
      

      

    );
  
}



