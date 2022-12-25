import 'dart:convert';
import 'dart:io';

import 'package:okoul_movie_app/helpers/constants.dart';
import 'package:okoul_movie_app/services/baseService.dart';

import 'package:http/http.dart' as http;

class MovieService extends BaseService
{
  
 

  Future<List> getGenres() async
  {
    try
    {
      Uri url= Uri.parse(Constants.getGenresURL);
      var response = await http.get(url);
      if (response.statusCode != 200) throw HttpException('${response.statusCode}');
      var result =jsonDecode(response.body)['genres'];
      return result;
    }
    on SocketException { throw throwError('1');}
    catch(e){throw throwError('2');}

    


  }

  Future<List<dynamic>> getByGenres(int id, {int page=1}) async
  {
    try
    {
       String getByGenresURL ='https://api.themoviedb.org/3/discover/movie?api_key=${Constants.kApiKey}&language=en-US&with_genres=${id}&page=${page}';       
       Uri url= Uri.parse(getByGenresURL);
       var response = await http.get(url);
      if (response.statusCode != 200) throw HttpException('${response.statusCode}');
      var result =jsonDecode(response.body)['results'];     
      return result;
    }
    on SocketException { throw throwError('1');}
    catch(e){throw throwError('2');}

  }

  Future<List<dynamic>> getList({int page=1,required String apiURL}) async
  {
    try
    {
      var query=apiURL+page.toString();
      Uri url= Uri.parse(query);
      var response = await http.get(url);
      if (response.statusCode != 200) throw HttpException('${response.statusCode}');
      var result =jsonDecode(response.body)['results'];     
      return result;
    }   
    on SocketException { throw throwError('1');}
    catch(e){throw throwError('2');}
  }

 


  Future<List<dynamic>> getCasts(int id) async
  {
    try{
      String getCastsURL ='https://api.themoviedb.org/3/movie/$id/casts?api_key=${Constants.kApiKey}';
      Uri url= Uri.parse(getCastsURL);
      var response = await http.get(url);
      if (response.statusCode != 200) throw HttpException('${response.statusCode}');

   
      var result =jsonDecode(response.body)['cast'];
      
      return result;

      }
      on SocketException { throw throwError('1');}
      catch(e){throw throwError('2');}

  }

  Future<List<dynamic>> getFavoriteMoviesByIds(List<int> ids) async
  {
    try{
      List<dynamic> result=[];
      for (var id in ids) 
      
      {
      String detailsUrl ='https://api.themoviedb.org/3/movie/$id?api_key=${Constants.kApiKey}';
      Uri url= Uri.parse(detailsUrl);
      var response = await http.get(url);
      if (response.statusCode != 200) throw HttpException('${response.statusCode}');
      result.add(jsonDecode(response.body));     

      }

     return result;
     

      }
      on SocketException { throw throwError('1');}
      catch(e){throw throwError('2');}

  }

}