import 'package:get/get.dart';

import '../models/errorModel.dart';

class BaseService extends GetxService
{
  

  ErrorModel throwError(String message )
  {
    return ErrorModel(
      id: message=='1'?1:message=='2'?2:3,
      message: message
      );

  }


}