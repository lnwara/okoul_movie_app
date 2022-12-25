import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:okoul_movie_app/helpers/constants.dart';
import 'package:okoul_movie_app/services/storageService.dart';


class ThemeButton extends StatefulWidget {
const ThemeButton({Key? key}) : super(key: key);

  @override
  State<ThemeButton> createState() => _ThemeButtonState();
}

class _ThemeButtonState extends State<ThemeButton> {
  final StorageService service =Get.find();

  @override
  Widget build(BuildContext context) {
    return IconButton(
                onPressed: ()
                {
                  service.switchTheme();
                  setState(() {
                    
                  });
               
                  
                },
                icon:  service.isDarkMode()? const Icon(
                Icons.light_mode, color: Constants.kYellowColor,
              ):const Icon(
                Icons.dark_mode, color: Constants.kGreyColor,
              ),
              iconSize: 25,);
  }
}