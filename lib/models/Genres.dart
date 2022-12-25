import 'package:okoul_movie_app/models/baseModel.dart';
import 'dart:convert';

import 'package:okoul_movie_app/models/movie.dart';

class Genres extends BaseModel
{
  int id;
  String name;
  late List<MovieModel> movies=[];
  Genres({required this.id,required this.name});
  
   factory Genres.fromJson(dynamic json) {
    return Genres(id: json['id'],name: json['name']);
  }

  BaseModel fromJson(String jsonObject) =>Genres
  (
   id: json.decode(jsonObject),
   name: json.decode(jsonObject)
  );

  @override
  String toJson(BaseModel model) =>json.encode(model);

  


  



}