import 'dart:math' as math;
import 'package:flutter/material.dart';

class LeftCurvePainter extends CustomPainter {
  //2
  LeftCurvePainter({@required this.color, @required this.avatarRadius});

  //3
  final Color color;
  final double avatarRadius;

  //4
  @override
  void paint(Canvas canvas, Size size) {
    final shapeBounds = Rect.fromLTWH(0, 0, size.width, size.height);
////2
    final centerAvatar = Offset(shapeBounds.left, shapeBounds.center.dy);
//2
    final avatarBounds =
    Rect.fromCircle(center: centerAvatar, radius: avatarRadius);
//3
    _drawBackground(canvas, shapeBounds, avatarBounds);
  }

  void _drawBackground(Canvas canvas, Rect shapeBounds, Rect avatarBounds) {
    //1
    final paint = Paint()..color = color;

    final backgroundPath = Path()
      ..moveTo(shapeBounds.right, shapeBounds.top)
      ..lineTo(shapeBounds.topLeft.dx, shapeBounds.topLeft.dy)
      ..arcTo(avatarBounds, -math.pi+math.pi/2, math.pi, false)
      ..lineTo(shapeBounds.bottomLeft.dx, shapeBounds.bottomLeft.dy)
      ..lineTo(shapeBounds.bottomRight.dx, shapeBounds.bottomRight.dy)
      ..close();

    //9
    canvas.drawPath(backgroundPath, paint);
  }

  //5
  @override
  bool shouldRepaint(LeftCurvePainter oldDelegate) {
    return color != oldDelegate.color;
  }
}
