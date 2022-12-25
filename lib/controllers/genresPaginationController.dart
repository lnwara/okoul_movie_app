import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:okoul_movie_app/controllers/baseController.dart';

import '../models/Genres.dart';
import '../models/movie.dart';
import '../services/tmdb_api_service.dart';

class GenresPaginationController extends BaseController
{
  late Map<String,RxList<MovieModel>> movies=  {} ;
  late ScrollController scrollController;
  late String currentgGenre='';
  late int currentgGenreId;
  late MovieService service;
  late  List<Genres> genres=[];
  int _pageNo = 1;

  @override
  void onInit() async {
    service=Get.find();
    //scrollController.addListener(loadPaginationMoviesByCatogry);
    await loadGenres();
    
    super.onInit();
  }

  @override
  void onClose() {
   // scrollController.dispose();
    super.onClose();
  }


 
  Future loadGenres() async
  {
    try{
    var result =await service.getGenres();
    if(result.isNotEmpty)
    {
      change(null, status: RxStatus.loading()); 
      genres = List<Genres>.from(result.map((model)=> Genres.fromJson(model)));
      currentgGenre=genres.first.name;
      genres.forEach((x) async
      {
        var list=await service.getByGenres(x.id,page: _pageNo++);
        movies[x.name]=List<MovieModel>.from(list.map((model)=> MovieModel.fromJson(model))).obs;
     
      });
      change(null, status: RxStatus.success()); 

      

    }
    else
    {
      change(null, status: RxStatus.empty()); 
    }
    }
    catch(e)
    {
      change(null, status: RxStatus.error(e.toString())); 
      throwError(e.toString());
    }
    }

  void loadPaginationMoviesByCatogry() async
  {
    try
    {
     if (scrollController.offset >= scrollController.position.maxScrollExtent &&
        !scrollController.position.outOfRange) {
        //change(null, status: RxStatus.loading());  


          currentgGenreId= genres.where((element) => element.name==currentgGenre)
         .first
         .id;
    
          var result =await service.getByGenres(currentgGenreId);
          if (result.isEmpty) {
          change(null, status: RxStatus.empty());        
          } 
          else {
          movies[currentgGenre]!.addAll(List<MovieModel>.from(result.map((model)=> MovieModel.fromJson(model))));
          movies[currentgGenre]!.refresh();
          Future.delayed(const Duration(seconds: 10));
          change(null, status: RxStatus.success()); 
          

          }
          }
     
    }
     catch(e)
    {
      throwError(e.toString());
       change(null, status: RxStatus.error()); 

    }

  }


// void loadPagination() async {
//   try {
   
//      if (scrollController.offset >= scrollController.position.maxScrollExtent &&
//         !scrollController.position.outOfRange) {
//         change(null, status: RxStatus.loading());  


//           currentgGenreId= genres.where((element) => element.name==currentgGenre)
//          .first
//          .id;
    
//           var result =await service.getByGenres(currentgGenreId);
//           if (result.isEmpty) {
//           change(null, status: RxStatus.empty());        
//           } 
//           else {
//           movies[currentgGenre]!.addAll(List<MovieModel>.from(result.map((model)=> MovieModel.fromJson(model))));
//           movies[currentgGenre]!.refresh();
//           //Future.delayed(Duration(seconds: 100));
//           change(null, status: RxStatus.success()); 
//         }
//       } 
//       }
//       catch (err) {
//         change(null, status: RxStatus.error()); 
//       }
//       }


}