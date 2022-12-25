import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

import '../../../Helpers/config.dart';

class PlayingNowSkelton extends StatelessWidget {
const PlayingNowSkelton({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return ClipRRect(
borderRadius: BorderRadius.circular(30),
      child: Shimmer.fromColors(
               baseColor: Colors.grey,
               highlightColor: Colors.white54,
               child:  Container(color:Colors.white, width: SizeConfig.screenWidth!*0.8,height: SizeConfig.screenWidth!*0.8,)
             ),
    );
  }
}