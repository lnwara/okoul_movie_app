import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:okoul_movie_app/helpers/config.dart';
import 'package:okoul_movie_app/views/components/movieGenres/scrolableMovie.dart';
import 'package:shimmer/shimmer.dart';

import '../../../controllers/genresPaginationController.dart';
import '../../../controllers/tabController.dart';
import '../../../helpers/constants.dart';
import '../../../helpers/style.dart';
import '../common/indicator.dart';
import '../common/movieItem.dart';

class GenresPagination extends GetView<MyTabController> {
  GenresPagination({Key? key}) : super(key: key);
  GenresPaginationController gController=Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold
    (
      body: NestedScrollView(
        headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled)
         { return <Widget>[
            SliverAppBar
            (
              automaticallyImplyLeading:true,
              title: Text('Movies', style: CustomTextStyle.getTitleFont(),),
              shadowColor:Constants.kCyanColor,
              backgroundColor:Constants.kCyanColor.withOpacity(0.4),
              pinned: true,
              expandedHeight: SizeConfig.screenHeight!*0.1,   
              shape:const RoundedRectangleBorder(
              borderRadius: BorderRadius.only(bottomRight: Radius.circular(100))) ,        
     
            )];
         },
         body:  Column(
               children: [
                 Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children:[
                    SizedBox(  
                      width: SizeConfig.screenWidth!*0.90,
                      height: 50,
                      child: TabBar(                       
                        labelColor: Constants.kCyanColor ,
                        unselectedLabelColor: Constants.kGreyColor,
                        indicator: const CustomTabIndicator(),
                        tabs: controller.tabs,
                         controller: controller.controller,
                         isScrollable: true,
                         onTap: (i) async
                         {
                          gController.currentgGenre=controller.tabs[i].text??'';
                          gController.loadPaginationMoviesByCatogry();
                          controller.loadMoviesByCatogry(controller.tabs[i].text??'');

                          
                         },
                                                          
                         )
                         ),
                
                    ]),
                 
                  gController.obx((state) 
                   {
                     return Flexible(
                      child: 
                      
                      TabBarView
                      (
                        controller: controller.controller,
                        children: gController.genres.map((e) =>  const ScrolableList()
                         
                          ).toList()
                      )
                    );
                   },
                  onLoading:  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Center(child:   Lottie.asset(
                         'assets/49993-search.json',
                         height: 70,width: 70
                         ),),
                  ),
                  onError: (e)
                  {
                    //todo error log
                    return Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Lottie.asset(
                           'assets/error.json',
                           height: 70,width: 70
                           ),
                           const Text('unexpected error')
                      ],
                      ),
                    );
                  },
                  onEmpty:  Padding(
                    padding: const EdgeInsets.all(8.0),
                     child: 
                     Shimmer.fromColors(
                        baseColor: Colors.white,
                        highlightColor: Colors.black26,
                        child: Text('No more result', style: CustomTextStyle.sliverBodyStyle(),))
                      ),
                  )
            
               ],
             )
            ,
        
   
      ),
    );
  }



ListView movieList()=>ListView.separated
                          (
                            controller: gController.scrollController,
                            itemBuilder: (context, index) {
                             print(index);
                             return MovieItem(movie: gController.movies[gController.currentgGenre]![index],);
                             },
                            separatorBuilder: (context, index) =>const Divider(),
                            itemCount: gController.movies[gController.currentgGenre]!.length+1
                          );
  
}