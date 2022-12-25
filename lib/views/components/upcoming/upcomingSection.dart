import 'package:flutter/material.dart';

import 'package:flutter_animate/animate.dart';
import 'package:flutter_animate/effects/effects.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:okoul_movie_app/controllers/upcomingController.dart';
import 'package:okoul_movie_app/models/errorModel.dart';

import '../../../Helpers/config.dart';
import '../../../controllers/paginationController.dart';
import '../../../helpers/constants.dart';
import '../../../helpers/style.dart';
import '../movieGenres/movieContainer.dart';
import '../movieGenres/movieSkelton.dart';

class UpcomingSection extends GetView<UpcomingController> {
  const UpcomingSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('Upcoming', style: CustomTextStyle.getTitleFont(),).animate().fadeIn(),
             IconButton(onPressed:()
            {
              Get.toNamed("/pagination", 
               arguments: {'title':'Upcoming', 'controller': 
               Get.find<PaginationController>(tag: MovieSection.upcoming.toString())},
              );

            },
           icon: const Icon(Icons.more_horiz_sharp)
           ),
          ],
        ),

        SizedBox( child:
                   controller.obx((state) {
                       return SizedBox(
                          height: SizeConfig.orientation==Orientation.landscape?SizeConfig.screenHeight!*0.50:SizeConfig.screenHeight!*0.25,
                             width: SizeConfig.screenWidth,
                         child: ListView
                         (
                           scrollDirection: Axis.horizontal,
                           children: controller.upcomingMovies.map(
                             (element) => Padding(
                               padding: const EdgeInsets.all(8.0),
                               child: MovieContainer(movie: element),
                             )).toList(),
                         ),
                       );},
                       onLoading: const  Padding(
                         padding:   EdgeInsets.only(top:30),
                         child:  MovieContainerSkelton()
                       ),
                      onError: (e)
                      {
                        if(e is ErrorModel){
                          return Lottie.asset(
                           'assets/noInternet.json',
                           height: 70,width: 70
                           );
                         }
                         else
                         {
                          return Lottie.asset(
                           'assets/error.json',
                           height: 70,width: 70
                           );
                         }
                      }
                       ))


      ],
    );
                    
  }


  
  

}