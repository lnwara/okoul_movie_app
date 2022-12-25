import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../helpers/constants.dart';
import '../models/errorModel.dart';
import '../models/movie.dart';
import '../services/tmdb_api_service.dart';
import 'baseController.dart';

class HomeController extends BaseController 
{
 late MovieService service;
 ScrollController playingNowScrollController=ScrollController();
 RxList playingNowMovies=[].obs;
 RxList upcomingMovies=[].obs;
 int _pageNo = 1;
 RxBool isLoading=false.obs;


  @override
  void onInit() async {
    service=Get.find();
    if(playingNowMovies.isEmpty) loadPlayingNowMovies();
    if(upcomingMovies.isEmpty) loadUpcomingNowMovies();
    //playingNowScrollController.addListener(playingNowMoviesPagination);

    super.onInit();
  }

  void loadPlayingNowMovies() async
  {    
    try
    {
       change(playingNowMovies, status: RxStatus.loading());       
       var result=await service.getList(apiURL: Constants.getPlayingNowURL);
      //Future.delayed(const Duration(seconds: 300));
      change(playingNowMovies, status: RxStatus.empty());       
      //  playingNowMovies=List.generate(
      //   result.length, (index) => MovieModel.fromJson(result[index])).obs;

       playingNowMovies=List<MovieModel>.from(result.map((model)=> MovieModel.fromJson(model))).obs ;
       playingNowMovies.refresh();
       change(playingNowMovies, status: RxStatus.success());
    }
    catch(e)
    {
       throwError(e.toString());
       change(playingNowMovies, status: RxStatus.error());
    }
       
  }

   void loadUpcomingNowMovies() async
  {
     try
       {
          change(upcomingMovies, status: RxStatus.loading());     
          var result=await service.getList(apiURL: Constants.getUpcomingURL);
          upcomingMovies=List<MovieModel>.from(result.map((model)=> MovieModel.fromJson(model))).obs ;
          change(upcomingMovies, status: RxStatus.success());
          //update();
       }
       catch(e)
       {
          
          change(upcomingMovies, status: RxStatus.error());
          throwError(e.toString());
       }

   
  }



  


  
}