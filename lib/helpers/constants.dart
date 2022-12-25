import 'package:flutter/material.dart';

class Constants {
  // Constant Color
  static const Color kPinkColor = Color(0xFFFE53BB);
  static const Color kCyanColor = Color(0xFF08F7FE);
  static const Color kGreenColor = Color(0xFF09FBD3);
  static const Color kBlackColor = Color(0xFF19191B);
  static const Color kYellowColor = Color(0xFFF2A33A);
  static const Color kWhiteColor = Color(0xFFFFFFFF);
  static const Color kGreyColor = Color(0xFF767680);

  // Constant Icon

  // Constant Mask
  static const String kMaskFirstIndex = 'assets/mask/mask_firstIndex.png';
  static const String kMaskLastIndex = 'assets/mask/mask_lastIndex.png';
  static const String kMaskCenter = 'assets/mask/mask.png';
  static const String kMaskCast = 'assets/mask/mask_cast.png';



  //token
  static const String kApiKey='ee204f627e4ea323e28c8dc4e965a2f2';
  static const String kApiToken='eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiJlZTIwNGY2MjdlNGVhMzIzZTI4YzhkYzRlOTY1YTJmMiIsInN1YiI6IjYzOWQ5NTVmOWJjZDBmMDBhMmNmODViNyIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.qtZ93azuB0-Zmgbt5lecGkcyV3PlIGVQBihkN5oYR4k';
  static const String kBaseImageURL='https://image.tmdb.org/t/p/w500/';


  static const themeKey='isDarkMode';
  static const favoriteKey='favoriteList';
  static const firstLaunch='firstLaunch';

  static const getGenresURL ='https://api.themoviedb.org/3/genre/movie/list?api_key=${Constants.kApiKey}&language=en-US';
  static const getPlayingNowURL ='https://api.themoviedb.org/3/movie/now_playing?api_key=${Constants.kApiKey}&language=en-US&page=';
  static const getUpcomingURL ='https://api.themoviedb.org/3/movie/upcoming?api_key=${Constants.kApiKey}&language=en-US&page=';
  static const getTrendingURL ='https://api.themoviedb.org/3/movie/popular?api_key=ee204f627e4ea323e28c8dc4e965a2f2&language=en-US&page=';

  

 static const  Map<MovieSection,String> urlMap=
 {
  MovieSection.playingNow:getPlayingNowURL,
  MovieSection.upcoming:getUpcomingURL,
  MovieSection.movie:getGenresURL,
  MovieSection.trending:getTrendingURL



 };
 



}

enum MovieSection { playingNow,upcoming, movie, trending}
