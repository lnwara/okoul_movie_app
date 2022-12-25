import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:okoul_movie_app/controllers/baseController.dart';

import '../helpers/constants.dart';
import '../models/movie.dart';
import '../services/tmdb_api_service.dart';

class PaginationController extends BaseController
{
  
   late MovieService service;
   ScrollController scrollController=ScrollController();
   RxList moviList=[].obs;
   int _pageNo = 1;
   late MovieSection type;
   late RxString title=''.obs;
   final String tag;
   PaginationController({required this.tag});


    @override
    void onInit() async {
      service=Get.find();
      type=getType();
      if(type!=MovieSection.movie)
      {
        if(moviList.isEmpty )loadPagination();
        scrollController.addListener(loadPagination);
      }


      super.onInit();
      }

     @override
     void onClose() {
         scrollController.dispose();
         super.onClose();
       }

 
  void loadPagination() async {
  try {
    if(moviList.isEmpty)
    {
       change(moviList, status: RxStatus.loading());       
       var result=await service.getList(apiURL: Constants.urlMap[type].toString());

       moviList=List.generate(
        result.length, (index) => MovieModel.fromJson(result[index])).obs;

       moviList.refresh();
       change(moviList, status: RxStatus.success());
    }
    else if (scrollController.offset >= scrollController.position.maxScrollExtent &&
        !scrollController.position.outOfRange) {
        //change(moviList, status: RxStatus.loading());   
       
        //await Future.delayed(const Duration(seconds: 50));
        var result=await service.getList(page: ++_pageNo,apiURL: Constants.urlMap[type].toString());
        //Future.delayed(const Duration(seconds: 1000));
        if (result.isEmpty) {
          change(moviList, status: RxStatus.empty());        
        } 
        else {
          moviList.addAll(List<MovieModel>.from(result.map((model)=> MovieModel.fromJson(model))).obs);
          moviList.refresh();
          change(moviList, status: RxStatus.success()); 
        }
      } 
      }
      catch (e) {
        change(moviList, status: RxStatus.error()); 
        throwError(e.toString());
      }
      }



      MovieSection getType()
      {
        if(tag==MovieSection.upcoming.toString()) return MovieSection.upcoming;
        if(tag==MovieSection.movie.toString()) return MovieSection.movie;
        if(tag==MovieSection.playingNow.toString()) return MovieSection.playingNow;
         return MovieSection.trending;
      }

    
      
}