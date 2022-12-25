import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
import 'package:widget_mask/widget_mask.dart';

import '../../../Helpers/config.dart';

class MovieContainerSkelton extends StatelessWidget {
  const MovieContainerSkelton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {   
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: 
        [
           skeltonContainer(),
           skeltonContainer(),
           skeltonContainer(),
           skeltonContainer(),
           skeltonContainer(),
        ],
      ),
    );
  }

  SizedBox skeltonContainer() {
    return SizedBox(
          
          child: Shimmer.fromColors(
                   baseColor: Colors.grey,
                   highlightColor: Colors.white54,
                   child:   WidgetMask
                    (
                      blendMode: BlendMode.srcATop,
                      childSaveLayer: true,
                      mask: Container(color: Colors.black, width: 100, ),   
                          
                      child: Image.asset('assets/mask/mask.png',
                       //height: SizeConfig.screenHeight!*0.4,
                       width: SizeConfig.orientation==Orientation.landscape?SizeConfig.screenWidth!*0.2:SizeConfig.screenWidth!*0.4,
                       fit: BoxFit.fill,
                       
                       
                       
                      )
        
          ),
                 ) 
          
          
          
         
        );
  }
}