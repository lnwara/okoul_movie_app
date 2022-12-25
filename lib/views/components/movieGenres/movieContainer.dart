import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:okoul_movie_app/helpers/config.dart';
import 'package:okoul_movie_app/models/movie.dart';
import 'package:widget_mask/widget_mask.dart';
import '../../../controllers/detailsController.dart';
import '../../../helpers/constants.dart';
import '../../screens/details.dart';
import '../common/likeButton.dart';

class MovieContainer extends StatelessWidget {
  MovieModel movie;
  MovieContainer({Key? key,required this.movie}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    final DetailsController controller=Get.find();
    

    return GestureDetector(
      child: Container(
        decoration:  BoxDecoration
        (
          shape: BoxShape.circle,
          border: Border.all(width: 0.001,),
          boxShadow:   [ 
            BoxShadow(
              color: Constants.kCyanColor.withOpacity(0.2),
              blurRadius: 200,
            ),]
        ),
        child: Stack(
          fit: StackFit.passthrough,
          children: [
           
            WidgetMask
            (
              blendMode: BlendMode.srcATop,
              childSaveLayer: true,
              mask: Image.network(movie.poster_path,fit: BoxFit.fill,),   
                  
              child: Image.asset('assets/mask/mask.png',
               //height: SizeConfig.screenHeight!*0.4,
               width: SizeConfig.orientation==Orientation.landscape?SizeConfig.screenWidth!*0.2:SizeConfig.screenWidth!*0.4,
               fit: BoxFit.fill,
               
               
               
              )
    
            ),

             AnimatedPositioned(
              duration: const Duration(milliseconds: 10),
              top: 0,
              right: 0,
              child: LikeButton(isFavorite: movie.isFavorite, id: movie.id, onPress: ()
              {
                
              },),
            ),
          ],
        ),
      ),
      onTap: ()
      {
        controller.loadCasts(movie.id);        
        Get.to(MovieDetails(movie: movie,));

      },
      onDoubleTap: ()
      {
        
      },
    );
  }
}


