import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:okoul_movie_app/controllers/favoriteController.dart';
import 'package:okoul_movie_app/helpers/config.dart';
import 'package:okoul_movie_app/helpers/style.dart';
import 'package:okoul_movie_app/views/components/common/likeButton.dart';
import 'package:zoom_tap_animation/zoom_tap_animation.dart';

import '../../../Views/Screens/details.dart';
import '../../../controllers/detailsController.dart';
import '../../../helpers/constants.dart';
import '../../../models/movie.dart';

class FavCards extends StatefulWidget {
  MovieModel movie;
  FavCards({Key? key, required this.movie}) : super(key: key);

  @override
  State<FavCards> createState() => _FavCardsState();
}

class _FavCardsState extends State<FavCards> {
  final DetailsController controller=Get.find();
  final FavoriteController favController=Get.find();
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(30),
      child: ZoomTapAnimation(
        onTap: ()
         {
           controller.loadCasts(widget.movie.id);        
           Get.to(MovieDetails(movie: widget.movie,));
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
          
          child: Column
          (
            children: 
            [
              Row
              (
                children: 
                [
                  Padding(
                    padding: const EdgeInsets.only(top :8.0, left: 8.0),
                    child: LikeButton(isFavorite: widget.movie.isFavorite, id: widget.movie.id, onPress: ()
                    {
                      favController.loadFavorite();
                    }),
                  )
                ],
              ),
              Padding(
                padding: const EdgeInsets.all(10),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(30),
                  child: Image.network(widget.movie.poster_path,fit: BoxFit.contain,
                  height: SizeConfig.orientation==Orientation.landscape?200:500,
                  )),
              ),
              Padding(
                padding: const EdgeInsets.only(top:8.0),
                child: Text(widget.movie.title, style: CustomTextStyle.sliverBodyStyle(),),
              ),
              //Text(widget.movie.overview)
            ],
          ),
      
        ),
      ),
    );
  }
}