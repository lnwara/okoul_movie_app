import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:okoul_movie_app/helpers/config.dart';

import '../../../helpers/style.dart';
import '../../../models/cast.dart';

class CastContainer extends StatelessWidget {
  CastContainer({Key? key, required this.cast}) : super(key: key);
  CastModel cast;

  @override
  Widget build(BuildContext context) {
    return Stack
    (
    children: [
   
      Center(
        child: Container(
          width: SizeConfig.screenWidth!*0.4,
          height: SizeConfig.screenHeight!*0.07,
          decoration: BoxDecoration
          (
           borderRadius: BorderRadius.circular(SizeConfig.screenWidth!/2 ),
           color:Get.isDarkMode? Colors.white12:Colors.black12
           
        
          ),
                
        child:Padding(
          padding: const EdgeInsets.only(left: 75, right: 10),
          child: Center(child: Text(cast.name,style:CustomTextStyle.castNameStyle())),
        ),
          
        ),
      ),
           Positioned(
             left: 0,
             child: CircleAvatar(
                    backgroundColor: Colors.transparent,
                    minRadius: 14,
                    maxRadius: SizeConfig.screenWidth!*0.078,
                    backgroundImage: cast.profile_path!=''?
                     NetworkImage(cast.profile_path): const AssetImage('assets/NoPhoto.jpg') as ImageProvider,
                  ),
           ),
      ]
      );
  }
}