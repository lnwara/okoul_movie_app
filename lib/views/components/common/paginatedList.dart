import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:lottie/lottie.dart';
import 'package:okoul_movie_app/Helpers/config.dart';
import 'package:okoul_movie_app/controllers/paginationController.dart';
import 'package:okoul_movie_app/helpers/constants.dart';
import 'package:okoul_movie_app/helpers/style.dart';
import 'package:shimmer/shimmer.dart';

import 'movieItem.dart';



class MovieList extends StatelessWidget {
  String title;
  PaginationController controller;
  MovieList({Key? key, required this.title, required this.controller}) : super(key: key);
 

  @override
  Widget build(BuildContext context) {
         
    return Scaffold
    (
      body: NestedScrollView(
         headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled)
         { return <Widget>[
            
            SliverAppBar
            (
              automaticallyImplyLeading:(controller.type!=MovieSection.trending)?true:false,
              title: Text(title, style: CustomTextStyle.getTitleFont(),),
              shadowColor:Constants.kCyanColor,
              backgroundColor:Constants.kCyanColor.withOpacity(0.4),
              pinned: true,
              expandedHeight: SizeConfig.screenHeight!*0.1,   
              shape:const RoundedRectangleBorder(
              borderRadius: BorderRadius.only(bottomRight: Radius.circular(100))) , 
                   
            )];
         }
            ,
        body: Column(
          children: [
            
            controller.obx((state) 
            {
              return Expanded(
                child: ListView.separated
                (
                  controller: controller.scrollController,
                  itemBuilder: (context, index) {
                    if(index==controller.moviList.length-1)
                    {
                      return const MovieItemSkelton();
                    }
                    return MovieItem(movie:controller.moviList[index]);
                  },
                  separatorBuilder: (context, index) =>const Divider(),
                  itemCount: controller.moviList.length),
              );
            },
            onLoading:  Center(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Lottie.asset(
                     'assets/49993-search.json',
                     height: 70,width: 70
                     ),
              ),
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
                 
               
               
               //Center(child:   Lottie.asset(
              //   'assets/49993-search.json',
              //   height: 70,width: 70
              //   ),)
                ),
            )
            
            ,
          ],
        ),
      )
    );
  }


}