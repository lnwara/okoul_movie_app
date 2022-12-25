import 'package:get/get.dart';
import 'package:okoul_movie_app/models/cast.dart';

import '../services/tmdb_api_service.dart';
import 'baseController.dart';

class DetailsController extends BaseController 
{
 late MovieService service;
 List<CastModel> casts=[];


  @override
  void onInit() async {
    service=Get.find();
    super.onInit();
  }
  @override
  void onClose() {
    super.onClose();
  }



   void loadCasts(int id) async
  {
    try{
    change(null, status: RxStatus.loading());     
    var result=await service.getCasts(id);
    casts=List<CastModel>.from(result.map((model)=> CastModel.fromJson(model))).obs ;
    change(null, status: RxStatus.success());    
    }
    catch(e)
    {
      throwError(e.toString());
      change(null, status: RxStatus.error());    
    } 
  }

  
  
}