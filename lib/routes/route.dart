


 import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:okoul_movie_app/controllers/genresPaginationController.dart';
import 'package:okoul_movie_app/helpers/constants.dart';
import 'package:okoul_movie_app/services/storageService.dart';
import 'package:okoul_movie_app/views/screens/mainScreen.dart';
import 'package:okoul_movie_app/views/screens/onboarding.dart';
import 'package:okoul_movie_app/views/screens/pages/favorites.dart';
import 'package:okoul_movie_app/views/screens/pages/trends.dart';

import '../Views/Screens/initializerWidget.dart';
import '../controllers/detailsController.dart';
import '../controllers/favoriteController.dart';
import '../controllers/paginationController.dart';
import '../controllers/playingNowController.dart';
import '../controllers/tabController.dart';
import '../controllers/upcomingController.dart';
import '../services/tmdb_api_service.dart';
import '../views/components/common/paginatedList.dart';
import '../views/components/movieGenres/genresPagination.dart';
import '../views/screens/pages/home.dart';

List<GetPage<dynamic>> appRoutes() => [
 GetPage(
        name: '/',
        page: () => const InitializerWidget(),
        transition: Transition.leftToRightWithFade,
        transitionDuration: const Duration(milliseconds: 500),
        //middlewares: [InitMiddleware()],  
        binding: BindingsBuilder(()
        {
          Get.put(MyTabController());
          Get.put(MovieService());
          Get.lazyPut(()=>PlayingNowController());
          Get.lazyPut(() => UpcomingController());
          Get.lazyPut(()=>MovieService());          
          //Get.lazyPut(()=>DetailsController());
          
                   
                    
        })      
      ),

    GetPage(
        name: '/1',
        page: () => const Onboarding(),
        transition: Transition.leftToRightWithFade,
        transitionDuration: const Duration(milliseconds: 500),
        binding: BindingsBuilder(()
        {
          Get.put(MyTabController());
          Get.put(MovieService());
          Get.lazyPut(()=>PlayingNowController());
          Get.lazyPut(() => UpcomingController());
          Get.lazyPut(()=>MovieService());          
          //Get.lazyPut(()=>DetailsController());
          
                   
                    
        })      
      ),
        GetPage(
        name: '/main',
        page: () => const MAinScreen(),
        transition: Transition.leftToRightWithFade,
        transitionDuration: const Duration(milliseconds: 500),
        binding: BindingsBuilder(()
        {
          Get.put(MovieService());
          Get.put(FavoriteController());
          Get.lazyPut(()=>DetailsController());
          Get.put(PaginationController(tag: MovieSection.playingNow.toString()),tag: MovieSection.playingNow.toString());
          Get.put( PaginationController(tag: MovieSection.trending.toString()),tag: MovieSection.trending.toString());
          Get.put( PaginationController(tag :MovieSection.upcoming.toString()),tag: MovieSection.upcoming.toString());
          Get.put( GenresPaginationController());
          Get.put(MyTabController());
          Get.lazyPut(()=>PlayingNowController());
          Get.lazyPut(() => UpcomingController());


         
          
                    
        })      
      ),
      GetPage(
        name: '/home',
        page: () => const Home(),
        transition: Transition.leftToRightWithFade,
        transitionDuration: const Duration(milliseconds: 500),
        binding: BindingsBuilder(()
        {
          
     
          

        })
        
        
      ),
      GetPage(
        name: '/favorite',
        page: () => const Favorites(),
        transition: Transition.leftToRightWithFade,
        transitionDuration: const Duration(milliseconds: 500),
        binding: BindingsBuilder(()
        {
          Get.put(FavoriteController());
          Get.put(MovieService());

        })
        
      ),
        GetPage(
        name: '/trends',
        page: () => const Trends(),
        transition: Transition.fadeIn,
        transitionDuration: const Duration(milliseconds: 500),
        binding: BindingsBuilder(()
        {
        })
      ),

     

       GetPage(
        name: '/pagination',
        arguments:MovieSection,
        page: () =>  MovieList( title: Get.arguments['title'],  controller: Get.arguments['controller'], ),
        transition: Transition.leftToRightWithFade,
        transitionDuration: const Duration(milliseconds: 500),
        binding: BindingsBuilder(()
        {
        //Get.lazyPut(() => PageController());
         

        }),

        
      ),

      GetPage(
        name: '/genresPagination',
        page: () =>   GenresPagination(),
        transition: Transition.leftToRightWithFade,
        transitionDuration: const Duration(milliseconds: 500),
        binding: BindingsBuilder(()
        {
        //Get.lazyPut(() => PageController());
         

        }))

      

       
      

       
     
    
    ];


      class InitMiddleware extends GetMiddleware
     {

      late StorageService storage;
     
      InitMiddleware()
      {
         
        storage=Get.find();

      }

      @override
      redirect(String? route)
      { 
           if(!storage.isFirstLaunch()) return RouteSettings(name:'/1');
           else return RouteSettings(name:'/main');

      }

      @override
      GetPage? onPageCalled(GetPage? page) {

       return super.onPageCalled(page);
      }
   
     }


   
