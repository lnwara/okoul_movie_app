import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../helpers/constants.dart';
import '../models/errorModel.dart';
import '../models/movie.dart';
import '../services/tmdb_api_service.dart';
import 'baseController.dart';

class UpcomingController extends BaseController 
{
 late MovieService service;
 RxList upcomingMovies=[].obs;



  @override
  void onInit() async {
    service=Get.find();
    if(upcomingMovies.isEmpty) loadUpcomingNowMovies();
    super.onInit();
  }

   void loadUpcomingNowMovies() async
  {
     try
       {
          change(upcomingMovies, status: RxStatus.loading());     
          var result=await service.getList(apiURL: Constants.getUpcomingURL);
          if(result.isEmpty) change(upcomingMovies, status: RxStatus.empty());
          else
          {
            upcomingMovies=List<MovieModel>.from(result.map((model)=> MovieModel.fromJson(model))).obs ;
            change(upcomingMovies, status: RxStatus.success());
          }     

          //update();
       }
       catch(e)
       {
          ErrorModel error =e as ErrorModel;
          change(upcomingMovies, status: RxStatus.error(error.message));
          throwError(e.toString());
       }

   
  }



  


  
}