import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:okoul_movie_app/helpers/constants.dart';

import '../../Helpers/config.dart';
import '../../services/tmdb_api_service.dart';
import '../components/navigator.dart';
import 'pages/favorites.dart';
import 'pages/home.dart';
import 'pages/trends.dart';

class MAinScreen extends StatefulWidget {
  const MAinScreen({Key? key}) : super(key: key);

  @override
  State<MAinScreen> createState() => _MAinScreenState();
}

class _MAinScreenState extends State<MAinScreen> {
  MovieService service=Get.put(MovieService());
  int selectedpage=1 ;
  final _inactiveColor = Colors.grey;
  List<Widget> pages = const <Widget>
  [
    Favorites(),Home(),Trends()

  ];
PageController pageController = PageController(
  initialPage: 1,
  keepPage: false,
);

  @override
  Widget build(BuildContext context) {
    //SizeConfig().init(context);
    return Scaffold
    (
      bottomNavigationBar: CustomAnimatedBottomBar
      (
        selectedIndex: selectedpage,
        items: <BottomNavyBarItem>[
        BottomNavyBarItem(
          icon: const Icon(Icons.favorite),
          title: const Text(''),
          activeColor: Constants.kPinkColor,
          inactiveColor: _inactiveColor,
          textAlign: TextAlign.center,
        ),
        BottomNavyBarItem(
          icon: const Icon(Icons.home),
          title: const Text(''),
          activeColor: Constants.kGreenColor,
          inactiveColor: _inactiveColor,
          textAlign: TextAlign.center,
        ),
        BottomNavyBarItem(
          icon: const Icon(Icons.flash_on),
          title: const Text(''),
          activeColor: Constants.kYellowColor,
          inactiveColor: _inactiveColor,
          textAlign: TextAlign.center,
        ),
        
      ],
      onItemSelected: (i)
      {
        bottomTapped(i);
      },
      ),
      body: PageView
      (
        controller: pageController,
        scrollDirection: Axis.horizontal, 
        children: pages,
        onPageChanged: (i)
        {          
          pageChanged(i);

        },
      ),

    );

    
  }
void pageChanged(int index) {
    setState(() {
      selectedpage = index;
    });
  }

  void bottomTapped(int index) {
    setState(() {
      selectedpage = index;
      pageController.animateToPage(index,
      duration: const Duration(milliseconds: 500),
      curve: Curves.ease);
    });
  }
}