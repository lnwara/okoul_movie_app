import 'package:flutter/material.dart';
import 'package:okoul_movie_app/controllers/baseController.dart';
import 'package:get/get.dart';
import 'package:okoul_movie_app/models/Genres.dart';
import 'package:okoul_movie_app/models/movie.dart';
import '../models/Genres.dart';
import '../models/errorModel.dart';
import '../services/tmdb_api_service.dart';

class MyTabController extends BaseController with GetTickerProviderStateMixin
{
  late TabController controller;
  late  List<Genres> genres=[];
  late  List<Tab> tabs=[];
  late MovieService service;
  int length=0;
  late ErrorModel? genresHasError;
  late ErrorModel? movieHasError;
  late String currentgGenre;
  late int currentgGenreId;





  @override
  void onInit()  {
    service=Get.find();
    controller=TabController(length:length,vsync: this);
    if(genres.isEmpty) loadGenres();
    super.onInit();
  }

  @override
  void onClose() {
    controller.dispose();
    super.onClose();
  }

  void loadGenres() async
  {
    try
    {
    genresHasError=null;
    var result =await service.getGenres();
    if(result.isNotEmpty)
    {
      genres = List<Genres>.from(result.map((model)=> Genres.fromJson(model)));
      tabs=genres.map((e) => Tab(text: e.name)).toList();
      length=genres.length;
      controller.dispose();
      controller=TabController(length:length,vsync: this);
      loadMoviesByCatogry(genres[0].name);

      update();

    }
    
    }
    catch(e)
    {
       genresHasError=e as ErrorModel;
       change(genres, status: RxStatus.error(genresHasError!.message));
       throwError(e.toString());
       update();

    }

  }

  void loadMoviesByCatogry(String name) async
  {
    try
    {
    movieHasError=null;
    currentgGenre=name;
    //change(null, status: RxStatus.loading());       
    currentgGenreId= genres.where((element) => element.name==name)
    .first
    .id;

    var result =await service.getByGenres(currentgGenreId);
    //change(null, status: RxStatus.success());       
    genres.where((element) => element.id==currentgGenreId).first.movies = List<MovieModel>
                                                             .from(result
                                                             .map((model)=> MovieModel.fromJson(model)
                                                             ));

    update();
    }
     catch(e)
    {
       movieHasError =e as ErrorModel;
       change(genres, status: RxStatus.error(movieHasError!.message));
       throwError(e.toString());
       update();

    }

  }




}