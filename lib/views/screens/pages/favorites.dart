import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:okoul_movie_app/controllers/favoriteController.dart';
import '../../../Helpers/config.dart';
import '../../../helpers/constants.dart';
import '../../../helpers/style.dart';
import 'dart:math' as math;

import '../../components/common/favCard.dart';


class Favorites extends StatelessWidget {
  const Favorites({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
  final FavoriteController controller=Get.find();
    return Scaffold
    (         
      body: RefreshIndicator(
        onRefresh: () async =>controller.loadFavorite() ,
        child: controller.obx((state)
        {
          return  CustomScrollView(
          slivers: [
            SliverAppBar
            (
              automaticallyImplyLeading:false,
              title: Text('Favorite Movies', style: CustomTextStyle.getTitleFont(),),
              shadowColor:Constants.kCyanColor,
              backgroundColor:Constants.kCyanColor.withOpacity(0.4),
              pinned: true,
              expandedHeight: SizeConfig.screenHeight!*0.1,   
              shape:const RoundedRectangleBorder(
                borderRadius: BorderRadius.only(bottomRight: Radius.circular(100))) ,        
      
            ),
             SliverFixedExtentList(
                itemExtent:SizeConfig.orientation==Orientation.landscape?SizeConfig.screenHeight!*0.9: 700,
                delegate: SliverChildListDelegate(
                 
                 controller.favoriteMovies.map((element) => 
                      
                  FavCards(movie: element)).toList() ),
                )

          ]
          );
        },
        onLoading: const Center(child:  CircularProgressIndicator(color: Constants.kGreenColor,)),
        onError: (e)
        {
           return Padding(
                padding: const EdgeInsets.all(10.0),
                child:  RefreshIndicator(
                  onRefresh: () async =>controller.loadFavorite() ,
                  child: Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Lottie.asset(
                             'assets/error.json',
                             height: 70,width: 70
                             ),
                             Text('Error exist', style: CustomTextStyle.getTitleFont())
                      ],
                    ),
                  ),
                ),
              );
        },
        onEmpty: RefreshIndicator(
          onRefresh: () async =>controller.loadFavorite() ,
          child: Center(child: Text('No Favorite Movies', style: CustomTextStyle.getTitleFont())))
      
           
          
          
          
          
          
        ),
      )

    );
  }


  
}

class _StackedListDelegate extends SliverPersistentHeaderDelegate {
  final double minHeight;
  final double maxHeight;
  final Widget child;

  _StackedListDelegate({
    required this.minHeight,
    required this.maxHeight,
    required this.child,
  });

  @override
  double get minExtent => minHeight;

  @override
  double get maxExtent => math.max(maxHeight, minHeight);

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return new SizedBox.expand(child: child);
  }

  @override
  bool shouldRebuild(_StackedListDelegate oldDelegate) {
    return maxHeight != oldDelegate.maxHeight ||
        minHeight != oldDelegate.minHeight ||
        child != oldDelegate.child;
  }
}

class StackedListChild extends StatelessWidget {
  final double minHeight;
  final double maxHeight;
  final bool pinned;
  final bool floating;
  final Widget child;

  SliverPersistentHeaderDelegate get _delegate => _StackedListDelegate(
      minHeight: minHeight, maxHeight: maxHeight, child: child);

  const StackedListChild({
    Key? key,
    required this.minHeight,
    required this.maxHeight,
    required this.child,
    this.pinned = false,
    this.floating = false,
  })  : assert(child != null),
        assert(minHeight != null),
        assert(maxHeight != null),
        assert(pinned != null),
        assert(floating != null),
        super(key: key);

  @override
  Widget build(BuildContext context) => SliverPersistentHeader(
      key: key, pinned: pinned, floating: floating, delegate: _delegate);
}