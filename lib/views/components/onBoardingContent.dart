import 'package:flutter/material.dart';
import 'package:okoul_movie_app/helpers/config.dart';
import 'package:okoul_movie_app/helpers/style.dart';

import '../../helpers/constants.dart';

class OnBoardingContent extends StatelessWidget {
  String imageAssest;
  String mainTitle;
  String subTitle;
  OnBoardingContent({Key? key, required this.imageAssest, required this.mainTitle, required this.subTitle}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Column
      (
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        
        children: 
        [
          //const Spacer(),
          SizedBox(
            height: 100,
            child: Image(image: AssetImage(imageAssest),)),
          //const Spacer(),
          Center(child: Text(mainTitle, style: CustomTextStyle.getTitleFont(), overflow: TextOverflow.ellipsis,)),
          //SizedBox(height: SizeConfig.screenHeight!*0.2,),
          Text(subTitle,style: CustomTextStyle.sliverBodyStyle(),overflow:TextOverflow.visible,),
        
         // const Spacer(),




        ],
      
    );
  }
}