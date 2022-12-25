import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:okoul_movie_app/helpers/config.dart';
import 'package:okoul_movie_app/models/movie.dart';
import 'package:shimmer/shimmer.dart';
import 'package:zoom_tap_animation/zoom_tap_animation.dart';

import '../../../controllers/detailsController.dart';
import '../../screens/details.dart';

class PlayingNowContainer extends StatelessWidget {
  MovieModel movie;
  PlayingNowContainer({Key? key,required this.movie}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    final DetailsController controller=Get.find();
    return ZoomTapAnimation(
      onTap: ()
      {
        controller.loadCasts(movie.id);        
        Get.to(MovieDetails(movie: movie,));
      },
      child: Stack(
        fit: StackFit.passthrough,
        children: [
         
          ClipRRect(
          borderRadius: BorderRadius.circular(30),
          child: Image.network(movie.poster_path,fit: BoxFit.fill,
             //height: 150.0,
              width: SizeConfig.screenWidth!*0.8,
          ), 
         ),

       
        ],
      ),
    );
  }
}

