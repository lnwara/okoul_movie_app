import 'dart:async';

import 'package:flutter/material.dart';
import 'package:okoul_movie_app/helpers/config.dart';


class AnimatedContent extends StatefulWidget {
  final List<Widget> childs;
  final Color color;
  const AnimatedContent({Key? key, required this.childs, required this.color}) : super(key: key);

  @override
  State<AnimatedContent> createState() => _AnimatedContentState();
}

class _AnimatedContentState extends State<AnimatedContent> {
  late Timer _timer;

  MainAxisAlignment alignment=MainAxisAlignment.center;

    _AnimatedContentState() {
     
    _timer = Timer(const Duration(milliseconds: 100), () {
     alignment=MainAxisAlignment.start;
      setState(() {
      });
    });
  }

   @override
  void dispose() {
    super.dispose();
    _timer.cancel();
  }
  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      
      duration: const Duration(seconds: 3),
      width: SizeConfig.screenWidth!*0.9,
      height: SizeConfig.screenHeight!,
      color: widget.color.withOpacity(0.3),
      curve: Curves.easeInBack,
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Expanded(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: widget.childs,
            ),
        ),
      ),
      );
  }
}