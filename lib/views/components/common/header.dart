import 'dart:async';
import 'package:flutter/material.dart';
import 'package:okoul_movie_app/views/components/common/themeButton.dart';

import '../../../Helpers/config.dart';
import '../../../helpers/style.dart';


class AnimatedHeader extends StatefulWidget //with PreferredSizeWidget
{
    final String title;
    final Color color;
  const AnimatedHeader({Key? key, required this.title, required this.color}) : super(key: key);
//  @override
//   Size get preferredSize =>  Size.fromHeight(SizeConfig.screenHeight!*0.90);

  @override
  State<AnimatedHeader> createState() => _AnimatedHeaderState();
}

class _AnimatedHeaderState extends State<AnimatedHeader> {

  late Timer _timer;
  late double height;
  double opacity=0.1;

  _AnimatedHeaderState() {
     height=SizeConfig.screenHeight!*0.90;
    _timer = Timer(const Duration(milliseconds: 100), () {
      height= SizeConfig.orientation==Orientation.landscape?SizeConfig.screenHeight!*0.25:SizeConfig.screenHeight!*0.15;
      opacity=0.4;
      setState(() {
      });
    });
  }

  // @override
  // void dispose() {
  //   super.dispose();
  //   _timer.cancel();
  // }

  @override
  Widget build(BuildContext context) {
    return  AnimatedContainer
        (
          duration: const Duration(seconds: 1),
          width: SizeConfig.orientation==Orientation.landscape?SizeConfig.screenWidth!/1.5:SizeConfig.screenWidth,
          height: height,
          decoration:  BoxDecoration
          (
            color: widget.color.withOpacity(opacity),
            borderRadius:const BorderRadius.only
            (
              bottomRight: Radius.circular(100),
             // bottomLeft: Radius.circular(100)
            )
          ),
           child: Padding(
             padding: const EdgeInsets.all(50.0),
             child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
               children: [
                 Text(widget.title, style: CustomTextStyle.getTitleFont(),),
                // Text(DateTime.now().toLocal().toString(), style: CustomTextStyle.getTitleFont(),),
                 const ThemeButton()

               ],
             ),
           ),
          
        );
  }
}