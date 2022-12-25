import 'package:get/get.dart';
import 'package:okoul_movie_app/controllers/baseController.dart';
import 'package:okoul_movie_app/services/tmdb_api_service.dart';

import '../models/movie.dart';
import '../services/storageService.dart';

class FavoriteController extends BaseController
{
   RxList favoriteMovies=[].obs;
   final StorageService storage=Get.find();
   final MovieService movieService=Get.find();


  @override
  void onInit() async {

    loadFavorite();
    super.onInit();
  }


  @override
  void onClose() {
    super.onClose();
  }

  loadFavorite() async
  {
    try{
    change(favoriteMovies, status: RxStatus.loading());   
    List<int> fav= await storage.getInFavoriteList();
    if(fav.isNotEmpty)
    {
       var result=await movieService.getFavoriteMoviesByIds(fav);
       favoriteMovies=List<MovieModel>.from(result.map((model)=> MovieModel.fromFavoriteJson(model))).obs ;
       favoriteMovies.refresh();
       change(favoriteMovies, status: RxStatus.success());   

       
    }else
    {
      change(favoriteMovies, status: RxStatus.empty()); 
    }
    }
    catch(e)
    {
      throwError(e.toString());
      change(favoriteMovies, status: RxStatus.error()); 
    } 

  }

}