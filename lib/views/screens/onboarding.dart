import 'dart:async';
import 'dart:ui';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/animate.dart';
import 'package:flutter_animate/effects/effects.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

import 'package:okoul_movie_app/helpers/config.dart';
import 'package:okoul_movie_app/helpers/constants.dart';
import 'package:okoul_movie_app/services/storageService.dart';
import 'package:shimmer/shimmer.dart';


import '../../helpers/style.dart';


class Onboarding extends StatefulWidget {
  const Onboarding({Key? key}) : super(key: key);

  @override
  State<Onboarding> createState() => _OnboardingState();
}

class _OnboardingState extends State<Onboarding> {
   bool animate= false;
   bool showText=false;
   StorageService storage =Get.find();
   

   @override
   void initState() {
    storage.setFirstLaunch();
    startAnimateion();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    List<Widget> textList=
   [
     Text('Enjoyable movies collections',
      style: CustomTextStyle.sliverBodyStyle(), textAlign:TextAlign.center)
      .animate().shimmer(color: Colors.red),
     
      Text('Playing now movies',
      style: CustomTextStyle.sliverBodyStyle(),textAlign:TextAlign.center)
      .animate().shimmer(color: Colors.red),
     
      Text('Sneak peak of upcoming movies and more ..',
      style: CustomTextStyle.sliverBodyStyle(),overflow: TextOverflow.visible,textAlign:TextAlign.center)
      .animate().shimmer(color: Colors.red)
   ];
    return Scaffold
    (
      //backgroundColor: Colors.black,
      body:  SizedBox
      (
        height: SizeConfig.screenHeight, width: SizeConfig.screenWidth,
        child: Stack
        (
          children: 
          [
            AnimatedPositioned(
              duration: const Duration(milliseconds: 1600),
              top: animate?SizeConfig.screenHeight!*0.1:SizeConfig.screenHeight!*0.6,
              right: animate?20:-100,
            child: Container
            (
              height: 200, width: 200,
              decoration: const BoxDecoration
              (
                 color: Constants.kPinkColor,
                 shape: BoxShape.circle
              ),
              child: BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 100, sigmaY: 100, tileMode: TileMode.repeated),
                child: const  SizedBox
                (
                   height: 200, width: 200,
                ),
                )
                
                )
                 ),
            AnimatedPositioned(
              duration: const Duration(milliseconds: 1600),
              top: animate?SizeConfig.screenHeight!*0.6:SizeConfig.screenHeight!*0.1,
              left: animate?-100:-88,
            child: Container
            (
              height: 200, width: 200,
              decoration: const BoxDecoration
              (
                 color: Constants.kGreenColor,
                 shape: BoxShape.circle
              ),
              child: BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 200, sigmaY: 200, tileMode: TileMode.mirror),
                child: const  SizedBox
                (
                   height: 200, width: 200,
                ),
                )
                
                )
                 ),
              AnimatedPositioned(
                top:animate?10:-50,
                left: 50,right: 30,
                curve : Curves.easeIn,
                duration: const Duration(milliseconds: 2000),
                child: animate?Center(
                  child: Column
                  (
                    //mainAxisAlignment: MainAxisAlignment.center,
                    //crossAxisAlignment: CrossAxisAlignment.center,
                    children: 
                     [
                      
                      Lottie.asset(
                     'assets/tv.json',
                     height: SizeConfig.screenHeight!*0.5,width: SizeConfig.screenWidth!*0.9
                     ),
                     
                      //  const SizedBox(
                      //   width: double.infinity , height: 450,
                        
                      //   child: 
                        
                      //   Image(image: AssetImage(Constants.kLogo),)),
                       // SizedBox(height: SizeConfig.screenHeight!*0.05,),
                         Center(child: 
                         Text('Explore your favorite movies and more..',
                          style: CustomTextStyle.getHeaderFont(),
                          overflow: TextOverflow.visible,textAlign:TextAlign.center))
                          .animate().tint(duration: const Duration(milliseconds: 4000),color:Constants.kPinkColor)
                          ,
                          const SizedBox(height: 50,),
                          
                          CarouselSlider.builder
                          (
                            itemCount: 3,
                            itemBuilder: (context, index, realIndex) {
                             return SizedBox(width: SizeConfig.screenWidth!*0.8,child: textList[index]);
                            },
                            options: CarouselOptions(
                           
                              initialPage: 0,
                              viewportFraction: 10 ,
                              autoPlay: true,
                              autoPlayCurve: Curves.easeOut,
                              enableInfiniteScroll: true,
                              autoPlayAnimationDuration: const Duration(milliseconds: 500),
                              scrollDirection: Axis.horizontal,
                              pauseAutoPlayOnTouch: true,
                            ),
                          ),
                         
                       
                   

                    ],
                  ),
                ):Container(),
                
              ),

               AnimatedPositioned(
                duration: const Duration(milliseconds: 2000),
                bottom: 40,
                //left: 60, 
                right: 20,
                 child: Padding(
                 padding: const EdgeInsets.all(8.0),
                  child: 
                  Shimmer.fromColors(
                     baseColor: Constants.kCyanColor,
                     highlightColor: Colors.grey,
                     child: GestureDetector(
                      child: Text('lets start ..', style: CustomTextStyle.sliverHeaderStyle(),),
                      onTap: ()
                      {
                        Get.toNamed('/main');

                      },
                      )
                      
                      )
                  ),
               )
            

         
          ],
        ),
      ),
    );
  }

  Future startAnimateion() async 
  {
    await Future.delayed(const Duration(milliseconds: 100));
    setState(() {
     animate =true; 
    });

    await Future.delayed(const Duration(seconds: 10));
    setState(() {
     showText =true; 
    });

  }
}