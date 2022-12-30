import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/animate.dart';
import 'package:flutter_animate/effects/effects.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:okoul_movie_app/controllers/paginationController.dart';
import 'package:okoul_movie_app/controllers/playingNowController.dart';
import 'package:okoul_movie_app/views/components/playingNow/playingNowSkelton.dart';
import '../../../Helpers/config.dart';
import '../../../helpers/constants.dart';
import '../../../helpers/style.dart';
import 'playingNowContainer.dart';

class PlayingNowSection extends GetView<PlayingNowController> {
  const PlayingNowSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Row(
      children: [
        RotatedBox(
          quarterTurns: 1,
          child: Row(
            children: [
              Text('Playing now', style: CustomTextStyle.getTitleFont(),).animate().fadeIn(),
               IconButton(onPressed:(){ Get.toNamed
               ("/pagination",
                arguments: {'title':'Now Playing',
                 'controller': Get.find<PaginationController>(tag: MovieSection.playingNow.toString())},);},              
                icon: const Icon(Icons.more_horiz_sharp)
                ),
                       ],
                )
                ),
                SizedBox(width: SizeConfig.screenHeight!*0.02,),
                Flexible(
                  child: controller.obx((state) 
                  {
                    return  SizedBox(
                    width:double.infinity,
                    height: 380,
                    //width: double.infinity,
                    child: CarouselSlider.builder(
                      itemCount: controller.playingNowMovies.length,
                      itemBuilder: (context, index, realIndex) {
                        return InkWell(
                          onTap: () {
                           
                          },
                          child: PlayingNowContainer(movie: controller.playingNowMovies[index]),
                        );
                      },
                            options: CarouselOptions(
                              height: SizeConfig.orientation==Orientation.landscape? SizeConfig.screenHeight!/2:380,
                              enlargeCenterPage: true,
                              initialPage: 0,
                              autoPlay: true,
                              aspectRatio: 16 / 9,
                              autoPlayCurve: Curves.easeOut,
                              enableInfiniteScroll: true,
                              autoPlayAnimationDuration: const Duration(milliseconds: 500),
                              viewportFraction: 0.75,
                              scrollDirection: Axis.horizontal,
                              pauseAutoPlayOnTouch: true,
                            ),
                          ),
                        );
                        },
                        onLoading: CarouselSlider.builder(
                            itemCount: 4,
                            itemBuilder: (context, index, realIndex) {
                              return InkWell(
                                onTap: () {
                                 
                                },
                                child: const PlayingNowSkelton(),
                              );
                            },
                            options: CarouselOptions(
                              height: SizeConfig.orientation==Orientation.landscape? SizeConfig.screenHeight!/2:380,
                              enlargeCenterPage: true,
                              initialPage: 0,
                              autoPlay: false,
                              aspectRatio: 16 / 9,
                              autoPlayCurve: Curves.easeOut,
                              enableInfiniteScroll: false,
                              autoPlayAnimationDuration: const Duration(milliseconds: 500),
                              viewportFraction: 0.75,
                              scrollDirection: Axis.horizontal,
                              pauseAutoPlayOnTouch: false,
                            ),
                          ),
                                
                        onError: (e)
                        {
                         //return Center(child: Text(e.toString()));
                         if(e =='1')
                         {
                            return Center(
                              child: Lottie.asset(
                           'assets/noInternet.json',
                           height: 70,width: 70
                           ),
                            );
                         }
                         else
                         {
                          return Center(
                            child: Lottie.asset(
                             'assets/error.json',
                             height: 70,width: 70
                             ),
                          );
                         }
                          
                        }
                        ,onEmpty: Container()
                        )
                      ),
                      

                         ],
                       ),
    );
  }

  }
