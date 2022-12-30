
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:okoul_movie_app/controllers/detailsController.dart';
import 'package:okoul_movie_app/helpers/style.dart';
import 'package:okoul_movie_app/models/movie.dart';
import '../../Helpers/config.dart';
import '../../helpers/constants.dart';
import '../components/common/castContainer.dart';

class MovieDetails extends GetView<DetailsController> {
  final MovieModel movie;
  MovieDetails({Key? key, required this.movie}) : super(key: key)
  {
    controller.loadCasts(movie.id);

  }


  @override
  Widget build(BuildContext context) {
  //final DetailsController controller=Get.find();
    return Scaffold
    (
      body: CustomScrollView
      (
        slivers: 
        [
          DetailsSliverAppBar(movie: movie),
           SliverToBoxAdapter
           (
             child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
               children: 
               [
                Row
                (
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: 
                  [
                    const Icon(Icons.calendar_month, color: Constants.kGreyColor, semanticLabel: 'Release date',),
                    Padding(
                      padding: const EdgeInsets.all(9.0),
                      child: Column(
                        children: [
                          Text('Release date', style: CustomTextStyle.sliverBodyStyle(),),
                          Text(movie.release_date.toString()),
                        ],
                      ),
                    ),
                    const SizedBox(width: 40,),
                    const Icon(Icons.bar_chart, color: Constants.kPinkColor,),
                    Padding(
                      padding: const EdgeInsets.all(9.0),
                      child: Column(
                        children: [
                          Text('Vote average', style: CustomTextStyle.sliverBodyStyle(),),
                          Text(movie.vote_average.toString()),
                        ],
                      ),
                    ),
                 
                  ],
                ),
                 Padding(
                   padding: const EdgeInsets.only(top:20, bottom: 20, right: 15, left: 15),
                   child: Text('OverView', style: CustomTextStyle.getTitleFont(),),
                 ),
                 Padding(
                   padding: const EdgeInsets.only(right: 15, left: 15),
                   child: Text(movie.overview,
                   style: CustomTextStyle.sliverBodyStyle(),
                   ),
                 ),
                 Padding(
                   padding: const EdgeInsets.only(top:20, bottom: 20,right: 15, left: 15),
                   child: Text('Casts', style: CustomTextStyle.getTitleFont(),),
                 ),
                   controller.obx((state) {
                  return SingleChildScrollView
                   (
                    scrollDirection: Axis.horizontal,
                    child:  Row(
                      children:controller.casts.map((e) =>Padding(
                        padding: const EdgeInsets.all(20),
                        child: CastContainer(cast: e,),
                      )).toList()
                                 
                      
                      
                    ),
                    
                   );},
                  onLoading: const Center(child:  CircularProgressIndicator(color: Constants.kGreenColor,))
                   ),
                   SizedBox(height: 50,)
               ],
                ),
           )
        ],
      ),
    );
  }
}

class DetailsSliverAppBar extends StatelessWidget {
  const DetailsSliverAppBar({
    Key? key,
    required this.movie,
  }) : super(key: key);

  final MovieModel movie;

  @override
  Widget build(BuildContext context) {
    return SliverAppBar
    (
      pinned: true,
      backgroundColor: Colors.transparent,
      expandedHeight: SizeConfig.screenHeight!*0.7,
      flexibleSpace: FlexibleSpaceBar
      (
        background: Image.network(movie.poster_path,fit: BoxFit.cover, 
        //width: double.maxFinite,
        ), 
        //stretchModes: [StretchMode.zoomBackground],
      ),
      bottom: PreferredSize
      (
        preferredSize: const Size.fromHeight(60),
        child: Container
        (
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Center(child: Text(
              movie.title,
              style: CustomTextStyle.sliverHeaderStyle(),
              )),

          ),
          width: double.maxFinite,
          padding: const EdgeInsets.all(9),
       
          decoration: const BoxDecoration
          (
            color: Colors.black54,
            borderRadius: BorderRadius.only(
              topLeft:Radius.circular(20),
              topRight: Radius.circular(20))
          ),
        ),
      ),

    );
  }
}