import 'package:flutter/material.dart';
import 'package:flutter_animate/animate.dart';
import 'package:flutter_animate/effects/effects.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

import '../../../Helpers/config.dart';
import '../../../controllers/tabController.dart';
import '../../../helpers/constants.dart';
import '../../../helpers/style.dart';
import '../common/indicator.dart';
import 'movieContainer.dart';
import 'movieSkelton.dart';

class MovieContainerSection extends StatelessWidget {
  const MovieContainerSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
         mainAxisAlignment: MainAxisAlignment.spaceBetween,
         children: [
           Text('Movies', style: CustomTextStyle.getTitleFont(),).animate().fadeIn(),
            IconButton(onPressed:()
           {
             Get.toNamed("/genresPagination",);

           },
          icon: const Icon(Icons.more_horiz_sharp)
          ),

         ],
       ),

       Padding(
           padding: const EdgeInsets.only(top:30),
           child: movieSection(),
         ),
      ],
    );
                    
                 
  }

    SizedBox movieSection() {
    return SizedBox(
      child: GetBuilder<MyTabController>( 
                      builder: (tabController) {
                      if(tabController.genres.isNotEmpty)
                      {
                        return Row(
                           mainAxisAlignment: MainAxisAlignment.start,
                           children:[
                           RotatedBox(
                             quarterTurns: 1,
                             child: SizedBox(  
                               width: SizeConfig.orientation==Orientation.landscape?SizeConfig.screenHeight!*0.5:SizeConfig.screenHeight!*0.3,             
                               child: TabBar(
                                 
                                 labelColor: Constants.kCyanColor ,
                                 unselectedLabelColor: Constants.kGreyColor,
                                 indicator: const CustomTabIndicator(),
                                 //indicatorColor: Colors.transparent,
                                 tabs: tabController.tabs,
                                  controller: tabController.controller,
                                  isScrollable: true,
                                  onTap: (i)
                                  {
                                   tabController.loadMoviesByCatogry(tabController.tabs[i].text??'');
                                  },
                                  
                                  
                           
                                  )
                                  ),
                           ),
                           Flexible(
                             child: SizedBox
                             (
                               height:  SizeConfig.orientation==Orientation.landscape?SizeConfig.screenHeight!*0.5:SizeConfig.screenHeight!*0.26,
                               width: SizeConfig.orientation==Orientation.landscape? SizeConfig.screenWidth!*0.8:double.infinity,
                               child: TabBarView
                               (
                                 controller: tabController.controller,
                                 children: tabController.genres.map((e) => ListView
                                 (
                                   scrollDirection: Axis.horizontal,
                                   children: e.movies.map((m) => MovieContainer( movie: m,)).toList() ,
                                 )).toList()
                                
                               ),
                           
                             ),
                           ),
                           ]);
                      }
                      else if(tabController.genresHasError!=null)
                      {
                        return  Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Lottie.asset(tabController.genresHasError!.id==1?'assets/noInternet.json':
                          'assets/error.json',
                          height: 70,width: 70
                          ),
                        );
                      }
                      else {
                        return const MovieContainerSkelton();
                      }
                      }
            
                      
                    ),
    );
  }


  

}

