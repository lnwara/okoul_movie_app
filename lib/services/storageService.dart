
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:okoul_movie_app/helpers/constants.dart';
import 'package:okoul_movie_app/services/baseService.dart';

class StorageService extends BaseService
{
  final  GetStorage _box =GetStorage();
  Future<StorageService> init() async 
  {
    await GetStorage.init();
    return this;
  }

  addToFavorite(int movieId)
  {
     dynamic favJson = _box.read<dynamic>(Constants.favoriteKey);
     List<int> favList=[];
     if(favJson!=null)
     {
        favList=List<int>.from(favJson); 
     }
       favList.add(movieId);
       _box.write(Constants.favoriteKey, favList);
  }

  removeFromFavorite(int movieId)
  {
     dynamic favJson = _box.read<dynamic>(Constants.favoriteKey);     
      List<int> favList=[];
     if(favJson!=null)
     {
        favList=List<int>.from(favJson); 
     }
       favList.remove(movieId);
       _box.write(Constants.favoriteKey, favList);
  }

  bool isInFavoriteList(int movieId){
      dynamic favJson = _box.read<dynamic>(Constants.favoriteKey);     
      List<int> favList=[];
      if(favJson!=null)
      {
       favList=List<int>.from(favJson);
      }
      return favList.contains(movieId);
    }

  dynamic getInFavoriteList(){
   dynamic favJson = _box.read<dynamic>(Constants.favoriteKey);     
   List<int> favList=[];
   if(favJson!=null)
   {
   favList=List<int>.from(favJson);
   }
   return favList;
  }  


  ThemeMode get theme=>isDarkMode()?ThemeMode.dark:ThemeMode.light;

  bool isDarkMode(){
    bool? value=_box.read<bool>(Constants.themeKey);
    return value??false;
    }

  saveThemeMode(bool isDarkMode)
  {
    _box.write(Constants.themeKey, isDarkMode);
  }

  switchTheme()
  {
    bool isDark=isDarkMode();
    Get.changeThemeMode(isDark?ThemeMode.light:ThemeMode.dark);
    saveThemeMode(!isDark);
    
  }

    bool isFirstLaunch()=>_box.read<bool>(Constants.firstLaunch)??false;
     setFirstLaunch()=>_box.write(Constants.firstLaunch,true);


}