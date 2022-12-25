import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:okoul_movie_app/controllers/favoriteController.dart';
import 'package:okoul_movie_app/helpers/config.dart';
import 'package:shimmer/shimmer.dart';
import 'package:zoom_tap_animation/zoom_tap_animation.dart';

import '../../../helpers/constants.dart';
import '../../../helpers/style.dart';
import '../../../models/movie.dart';
import '../../screens/details.dart';
import 'likeButton.dart';


class MovieItem extends GetView<FavoriteController> {

  MovieModel movie;

  MovieItem({Key? key, required this.movie}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(30),
      child: ZoomTapAnimation(
        onTap: ()
         {
           Get.to(MovieDetails(movie: movie,));
         },
        child: Card
        (
          clipBehavior: Clip.antiAliasWithSaveLayer,
          elevation: 5,
          shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30.0),
        ),
        shadowColor: Constants.kGreenColor.withOpacity(0.2),
        color: Colors.transparent,
          
          child: Row
          (
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: 
            [
              LikeButton(isFavorite: movie.isFavorite, id: movie.id, onPress: ()
              {
                controller.loadFavorite();
              }),
             Padding(
                padding: const EdgeInsets.only(top:8.0),
                child: SizedBox(
                  width: 150,
                  child: Center(
                    child: Text(movie.title, style: CustomTextStyle.sliverBodyStyle(),
                    overflow: TextOverflow.visible,),
                  ),
                ),
              ),
                Padding(
                padding: const EdgeInsets.all(10),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: movie.poster_path!=''?Image.network(movie.poster_path,fit: BoxFit.contain,
                  height: SizeConfig.orientation==Orientation.landscape?400:150,
                  errorBuilder: (BuildContext context, Object exception,
                                StackTrace? stackTrace){
                                  return Image.asset('assets/NoPhoto.jpg');
                                },
                  //width: 300,
                  ):Image.asset('assets/NoPhoto.jpg')),
              ),
              //Text(widget.movie.overview)
            ],
          ),
      
        ),
      ),
    );
 
  }
}

class MovieItemSkelton extends StatelessWidget {
  const MovieItemSkelton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
     return Padding(
      padding: const EdgeInsets.all(30),
      child: Shimmer.fromColors(
        baseColor: Colors.grey,
        highlightColor: Colors.white54,
        child: Card
        (
          clipBehavior: Clip.antiAliasWithSaveLayer,
          elevation: 5,
          shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30.0),
        ),
        //shadowColor: Constants.kGreenColor.withOpacity(0.2),
        color: Colors.transparent,
          
          child:  SizedBox(
            height: 150,
            child: ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                    
                    ),
          ),
        
        ),
      ),
    );
 
  }
}

