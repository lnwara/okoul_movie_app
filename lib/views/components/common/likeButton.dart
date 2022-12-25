import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../helpers/constants.dart';
import '../../../services/storageService.dart';


class LikeButton extends StatefulWidget {
  bool isFavorite;
  int id;
  final VoidCallback onPress;
  LikeButton({Key? key, required this.isFavorite, required this.id, required this.onPress}) : super(key: key);


  @override
  State<LikeButton> createState() => _LikeButtonState();
}

class _LikeButtonState extends State<LikeButton> {
  final StorageService storage=Get.find();
  @override
  Widget build(BuildContext context) {
    return IconButton(
                onPressed: ()
                {
                  if(widget.isFavorite)
                  {
                    storage.removeFromFavorite(widget.id);
                  }
                  else
                  {
                   storage.addToFavorite(widget.id);
                  }
                  setState(() {
                    widget.isFavorite=!widget.isFavorite;
                  });
                  widget.onPress();
                  
                },
                icon:  widget.isFavorite? const Icon(
                Icons.favorite, color: Constants.kPinkColor,
              ):const Icon(
                Icons.favorite_border, color: Constants.kPinkColor,
              ),
              iconSize: 25,);
  }
}