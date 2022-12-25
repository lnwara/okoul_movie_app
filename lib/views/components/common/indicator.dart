
import 'package:flutter/material.dart';

import '../../../helpers/constants.dart';

class CustomTabIndicator extends Decoration {
  final double radius;

  final Color color;


  final double indicatorHeight;

  const CustomTabIndicator({
    this.radius = 2,
    this.indicatorHeight = 3,
    this.color = Constants.kCyanColor,
  });

  @override
  _CustomPainter createBoxPainter([VoidCallback? onChanged]) {
    return _CustomPainter(
      this,
      onChanged,
      radius,
      color,
      indicatorHeight,
    );
  }
}

class _CustomPainter extends BoxPainter {
  final CustomTabIndicator decoration;
  final double radius;
  final Color color;
  final double indicatorHeight;

  _CustomPainter(
    this.decoration,
    VoidCallback? onChanged,
    this.radius,
    this.color,
    this.indicatorHeight,
  ) : super(onChanged);

  @override
  void paint(Canvas canvas, Offset offset, ImageConfiguration configuration) {
    assert(configuration.size != null);

    final Paint paint = Paint();
    double xAxisPos = offset.dx + configuration.size!.width / 2;
    double yAxisPos = offset.dy + configuration.size!.height - indicatorHeight/2;
    paint.color = color;

   final Offset circle=Offset(xAxisPos, yAxisPos);
       

    canvas.drawCircle(circle,radius, paint);


    
  }




}
