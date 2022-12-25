import 'package:flutter/material.dart';
import 'package:okoul_movie_app/helpers/config.dart';
import 'package:okoul_movie_app/helpers/constants.dart';
import '../../components/common/header.dart';
import '../../components/movieGenres/genresSection.dart';
import '../../components/playingNow/playingNowSection.dart';
import '../../components/upcoming/upcomingSection.dart';

//Todo : convert to stateless
class Home extends StatefulWidget {
   const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {  
    SizeConfig().init(context);     
    return OrientationBuilder(
       builder: (context, orientation) {
      return Scaffold
      (    
        body: Stack(
          children: [
            SafeArea(
              minimum: EdgeInsets.all(SizeConfig.screenWidth!*0.05),
              child: SingleChildScrollView
              (
                scrollDirection : Axis.vertical,
                //controller: movieScroll,
                child: Column
                (
                  mainAxisAlignment:  MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  
                  children: 
                  [
                    SizedBox(height: SizeConfig.orientation==Orientation.landscape?SizeConfig.screenHeight!*0.25:SizeConfig.screenHeight!*0.15,),
                    const MovieContainerSection(),
                    SizedBox(height: SizeConfig.screenHeight!*0.05,),
                    const PlayingNowSection(),                   
                    SizedBox(height: SizeConfig.screenHeight!*0.05,),
                    const UpcomingSection()
                  
                         
            
            
                  ],
                ),
            
              ),
            ),
              const AnimatedHeader(color: Constants.kCyanColor, title: 'Welcome',),
    
          ],
        ),
    
      );},
    );
  }



}

