import 'package:get/get.dart';
import '../helpers/constants.dart';
import '../models/errorModel.dart';
import '../models/movie.dart';
import '../services/tmdb_api_service.dart';
import 'baseController.dart';

class PlayingNowController extends BaseController 
{
 late MovieService service;
 RxList playingNowMovies=[].obs;


  @override
  void onInit() async {
    service=Get.find();
    if(playingNowMovies.isEmpty) loadPlayingNowMovies();
    super.onInit();
  }

  void loadPlayingNowMovies() async
  {    
    try
    {
       change(playingNowMovies, status: RxStatus.loading());       
       var result=await service.getList(apiURL: Constants.getPlayingNowURL);
       if(result.isEmpty) change(playingNowMovies, status: RxStatus.empty());  
           
        playingNowMovies=List.generate(
         result.length, (index) => MovieModel.fromJson(result[index])).obs;
         change(playingNowMovies, status: RxStatus.success()); 

       //playingNowMovies=List<MovieModel>.from(result.map((model)=> MovieModel.fromJson(model))).obs ;
       //playingNowMovies.refresh();
      //change(playingNowMovies, status: RxStatus.success());
    }
    catch(e)
    {
      if(e is ErrorModel )
      {
        ErrorModel error =e;
        change(playingNowMovies, status: RxStatus.error(error.message));

      }
      else 
      {
        change(playingNowMovies, status: RxStatus.error(e.toString()));
        throwError(e.toString());
      }
      
    }
       
  }
  
}