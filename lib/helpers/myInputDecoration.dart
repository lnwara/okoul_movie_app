import 'package:flutter/material.dart';
import 'package:okoul_movie_app/helpers/constants.dart';

 class MyInputDecorationTheme
{

static TextStyle _buildTextStyle(Color color, {double size=20})=>TextStyle
(
color: color,
fontSize: size,
fontFamily: 'OoredooArabic',
);

static OutlineInputBorder _buildBorder(Color color)=>OutlineInputBorder
(
borderRadius: BorderRadius.only(topLeft: Radius.circular(20),bottomRight: Radius.circular(20)),
borderSide: BorderSide
(
  color: color,
  width: 1
)
);

  static InputDecorationTheme theme()=> InputDecorationTheme
  (
    contentPadding: EdgeInsets.all(16),
    isDense: true,

    floatingLabelBehavior: FloatingLabelBehavior.always,

    //constraints: BoxConstraints(maxWidth: 150),

    enabledBorder: _buildBorder(Colors.blueGrey),
    focusedBorder: _buildBorder(Constants.kBlackColor),
    errorBorder: _buildBorder(Colors.red),
    focusedErrorBorder: _buildBorder(Colors.red),

    labelStyle: _buildTextStyle(Colors.black54),
    floatingLabelStyle: _buildTextStyle(Constants.kBlackColor)

    

    
  );
}