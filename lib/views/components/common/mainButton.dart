
import 'package:flutter/material.dart';
import 'package:okoul_movie_app/helpers/constants.dart';

import '../../../controllers/baseController.dart';



class MainButton extends StatelessWidget {
  const MainButton({
    Key ? key,
    required this.controller,
    required this.text,
    required this.onPress
  }) : super(key: key);

  final BaseController controller;
  final String text;
  final VoidCallback onPress;
  //final TextEditingController phoneController;

 

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Row(
      children:[ SizedBox(
        width: size.width*60/100, height: size.height* 6/100,
        child: ElevatedButton(
          child: Text(text,
          style: const TextStyle(
            color: Colors.black,
            fontSize: 20,
            fontFamily: 'OoredooArabic'
            ),),
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all(Constants.kCyanColor),
            shape: MaterialStateProperty.all<OutlinedBorder>(
              const RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(30.0),
              bottomRight: Radius.circular(30.0),

            ),
            )
            )
            ),

          onPressed: ()
          {
            onPress();
          }),
      ),
    ],
      mainAxisAlignment: MainAxisAlignment.center,
    );
  }
}