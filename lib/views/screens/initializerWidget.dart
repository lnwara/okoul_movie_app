
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../Helpers/config.dart';
import '../../services/storageService.dart';

class InitializerWidget extends StatefulWidget {
  const InitializerWidget({Key? key}) : super(key: key);

  @override
  InitializerWidgetState createState() => InitializerWidgetState();
}
bool isLoading=true;
class InitializerWidgetState extends State<InitializerWidget> {
final StorageService storage=Get.find();
Future startAnimation() async {
	    await Future.delayed(const Duration(milliseconds: 5000));
	    setState(() { isLoading = false; });
	    await Future.delayed(const Duration(milliseconds: 500));
      if(!storage.isFirstLaunch())
      {
        Get.toNamed('/1');

      } 
      else
      {
        Get.toNamed('/main');
      }
            
	    
	  }

  @override
	  void initState() {
	    super.initState();
	    startAnimation();
	  }
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      body: Stack
      (
        children: 
        [
          Image.asset(
            "assets/splash.gif",
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            fit: BoxFit.cover,
          ),
        ],
      )
    )
    ;
  }
}