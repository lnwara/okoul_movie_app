import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:okoul_movie_app/routes/route.dart';

import 'helpers/theme.dart';
import 'services/storageService.dart';
import 'services/tmdb_api_service.dart';

void main() async {
   //await GetStorage.init();
   await Get.putAsync(() => StorageService().init());
   await StorageService().init();

   Get.put(MovieService());
  runApp( MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key);
  final StorageService  box = Get.find();
  

  @override
  Widget build(BuildContext context) {
    var isDark= box.isDarkMode();
    return GetMaterialApp(
    debugShowCheckedModeBanner: false,
    theme: isDark? CutomTheme.dark:CutomTheme.light,
    darkTheme: CutomTheme.dark,
    themeMode: box.theme, 
   // home: const Onboarding(),
    getPages: appRoutes(),
    initialRoute: '/',  
    );
  }
}




