import 'dart:convert';

import '../helpers/constants.dart';
import 'baseModel.dart';

class CastModel extends BaseModel
{
   String name;
   String profile_path;
   String character;
   
   CastModel(
  {
    required this.name,
    required this.profile_path,
    required this.character,
    
  });
    factory CastModel.fromJson(dynamic json) {
    return CastModel(
      name: json['name'],
      profile_path: json['profile_path']!=null ?Constants.kBaseImageURL+json['profile_path']:'',
      character : json['character'],
      );
  }
  @override
  String toJson(BaseModel model) => json.encode(model);

}