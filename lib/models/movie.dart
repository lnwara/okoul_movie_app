import 'dart:convert';

import 'package:okoul_movie_app/helpers/constants.dart';
import 'package:okoul_movie_app/models/baseModel.dart';
import 'package:okoul_movie_app/models/cast.dart';
import 'package:okoul_movie_app/services/storageService.dart';

class MovieModel extends BaseModel
{
   String poster_path;
   bool adult;
   String overview;
   String release_date;
   List<dynamic> genre_ids;
   int id;
   String original_title;
   String title;
   num popularity;
   int vote_count;
   num vote_average;
   late List<CastModel> casts;
   bool isFavorite;

MovieModel(
  {
    required this.poster_path,
    required this.adult,
    required this.genre_ids,
    required this.id,
    required this.original_title,
    required this.overview,
    required this.popularity,
    required this.release_date,
    required this.vote_average,
    required this.title,
    required this.vote_count,
    required this.isFavorite
    
    
    
  });


 factory MovieModel.fromJson(dynamic json) {
    return MovieModel(
      id: json['id'],
      poster_path: json['poster_path']!=null?Constants.kBaseImageURL+json['poster_path']:'',
      adult : json['adult']??'',
      genre_ids: json['genre_ids']??'',     
      original_title: json['original_title']??'',
      overview : json['overview']??'',
      popularity : json['popularity'],
      release_date : json['release_date']??'',
      vote_average: json['vote_average'],
      title : json['title']??'',
      vote_count: json['vote_count'],
      isFavorite: StorageService().isInFavoriteList(json['id'])
      
      );
  }


 factory MovieModel.fromFavoriteJson(dynamic json) {
    return MovieModel(
      id: json['id'],
      poster_path: json['poster_path']!=null?Constants.kBaseImageURL+json['poster_path']:'',
      adult : json['adult']??'',
      //genre_ids: json['genres']['id'],   
      genre_ids:[],  
      original_title: json['original_title']??'',
      overview : json['overview']??'',
      popularity : json['popularity'],
      release_date : json['release_date']??'',
      vote_average: json['vote_average'],
      title : json['title']??'',
      vote_count: json['vote_count'],
      isFavorite: true
      
      );
  }

  @override
  String toJson(BaseModel model) => json.encode(model);


}